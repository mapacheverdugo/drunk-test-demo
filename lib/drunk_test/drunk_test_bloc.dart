import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:clock/clock.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

part 'drunk_test_effect.dart';
part 'drunk_test_event.dart';
part 'drunk_test_state.dart';

class DrunkTestBloc
    extends SideEffectBloc<DrunkTestEvent, DrunkTestState, DrunkTestEffect> {
  DrunkTestBloc() : super(const DrunkTestUninitialized()) {
    on<DrunkTestInitialize>(_onDrunkTestInitialize);
    on<DrunkTestLoadingRemainingSecondsChanged>(
      _onDrunkTestLoadingRemainingSecondsChanged,
    );
    on<DrunkTestStart>(_onDrunkTestStart);
    on<DrunkTestChangeToRedLight>(_onDrunkTestChangeToRedLight);
    on<DrunkTestRestart>(_onDrunkTestRestart);
    on<DrunkTestStartedTap>(_onDrunkTestStartedTap);
    on<DrunkTestResultClosePressed>(_onDrunkTestResultClosePressed);
  }

  StreamSubscription<num>? _loadingSecondsStreamSubscription;
  Timer? _delayTimer;

  Future<void> _onDrunkTestInitialize(
    DrunkTestInitialize event,
    Emitter<DrunkTestState> emit,
  ) async {
    emit(
      DrunkTestInitialized(
        maxAttempts: event.maxAttempts,
        maxReactionTime: event.maxReactionTime,
        remainingLoadingSeconds: event.loadingTime.inSeconds,
        blockedByTimeInSeconds: event.blockedByTimeInSeconds,
      ),
    );
    _loadingSecondsStreamSubscription = Stream.periodic(
      const Duration(seconds: 1),
      (x) => event.loadingTime.inSeconds - ((x + 1) * 1),
    ).take(event.loadingTime.inSeconds).listen((remainingSeconds) {
      if (isClosed) return;
      add(
        DrunkTestLoadingRemainingSecondsChanged(
          remainingSeconds: remainingSeconds,
        ),
      );
    });
  }

  Future<void> _onDrunkTestLoadingRemainingSecondsChanged(
    DrunkTestLoadingRemainingSecondsChanged event,
    Emitter<DrunkTestState> emit,
  ) async {
    final currentState = state;
    if (currentState is DrunkTestInitialized) {
      if (event.remainingSeconds <= 0) {
        add(const DrunkTestStart());
      }
      emit(
        currentState.copyWith(
          status: DrunkTestStatus.loading,
          remainingLoadingSeconds: event.remainingSeconds,
        ),
      );
    }
  }

  Future<void> _onDrunkTestStart(
    DrunkTestStart event,
    Emitter<DrunkTestState> emit,
  ) async {
    final currentState = state;
    if (currentState is DrunkTestInitialized) {
      if (currentState.status == DrunkTestStatus.started) {
        return;
      }
      _loadingSecondsStreamSubscription?.pause();
      _loadingSecondsStreamSubscription = null;
      emit(currentState.copyWith(status: DrunkTestStatus.started));
      _delayRandomly();
    }
  }

  Future<void> _onDrunkTestChangeToRedLight(
    DrunkTestChangeToRedLight event,
    Emitter<DrunkTestState> emit,
  ) async {
    final currentState = state;
    if (currentState is DrunkTestInitialized) {
      if (currentState.status != DrunkTestStatus.started ||
          currentState.startedStatus == DrunkTestStartedStatus.redLight) {
        return;
      }
      emit(
        currentState.copyWith(
          startedStatus: DrunkTestStartedStatus.redLight,
          lastAttemptStartDateTime: clock.now,
        ),
      );
    }
  }

  Future<void> _onDrunkTestRestart(
    DrunkTestRestart event,
    Emitter<DrunkTestState> emit,
  ) async {
    final currentState = state;
    if (currentState is DrunkTestInitialized) {
      if (currentState.status == DrunkTestStatus.loading) {
        return;
      }
      emit(
        currentState.copyWith(
          startedStatus: DrunkTestStartedStatus.greenLight,
          status: DrunkTestStatus.started,
        ),
      );
      _delayRandomly();
    }
  }

  void _delayRandomly() {
    final randomDelayMs = math.Random().nextInt(2000) + 4000;
    _delayTimer = Timer(Duration(milliseconds: randomDelayMs), () {
      if (isClosed) return;
      add(const DrunkTestChangeToRedLight());
    });
  }

  Future<void> _onDrunkTestStartedTap(
    DrunkTestStartedTap event,
    Emitter<DrunkTestState> emit,
  ) async {
    final currentState = state;
    if (currentState is DrunkTestInitialized &&
        currentState.status == DrunkTestStatus.started) {
      if (currentState.startedStatus == DrunkTestStartedStatus.greenLight) {
        emit(currentState.copyWith(status: DrunkTestStatus.tappedTooEarly));
        produceSideEffect(
          DrunkTestShowTestStartedTappedTooEarly(
            remainingAttempts:
                currentState.maxAttempts - currentState.currentAttempts,
          ),
        );
        return;
      }

      final now = clock.now();
      final reactionTime =
          now.difference(currentState.lastAttemptStartDateTime!);
      final currentAttempts = currentState.currentAttempts + 1;
      final passed = reactionTime <= currentState.maxReactionTime;

      emit(
        currentState.copyWith(
          lastAttemptEndDateTime: () => now,
          lastAttemptStartDateTime: () => currentState.lastAttemptStartDateTime,
          currentAttempts: currentAttempts,
          status: DrunkTestStatus.result,
        ),
      );

      produceSideEffect(
        DrunkTestAttemptCompleted(
          reactionTimeMs: reactionTime.inMilliseconds,
          passed: passed,
        ),
      );

      log(
        'DrunkTestBloc reactionTime=${reactionTime.inMilliseconds}ms '
        'attempts=$currentAttempts passed=$passed',
      );
    }
  }

  Future<void> _onDrunkTestResultClosePressed(
    DrunkTestResultClosePressed event,
    Emitter<DrunkTestState> emit,
  ) async {
    final currentState = state;
    if (currentState is DrunkTestInitialized) {
      if (event.passed) {
        produceSideEffect(const DrunkTestNotifyPassedAndClosed());
      } else {
        produceSideEffect(const DrunkTestNotifyFailedAndClosed());
      }
      return;
    }
    emit(const DrunkTestUninitialized());
  }

  @override
  Future<void> close() {
    _delayTimer?.cancel();
    _loadingSecondsStreamSubscription?.cancel();
    return super.close();
  }
}
