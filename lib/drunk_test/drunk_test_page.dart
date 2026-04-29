import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:side_effect_cubit/side_effect_cubit.dart';

import '../data/test_results_repository.dart';
import '../strings.dart';
import 'drunk_test_bloc.dart';
import 'drunk_test_result_page.dart';
import 'widgets/drunk_test_tapped_too_early_dialog.dart';
import 'widgets/forest_dialog_base.dart';

class DrunkTestPage extends StatelessWidget {
  const DrunkTestPage({
    required this.blockedByTimeInSeconds,
    required this.maxReactionTimeInMilliseconds,
    required this.loadingTimeInSeconds,
    required this.maxAttempts,
    this.userId,
    this.repository = const TestResultsRepository(),
    super.key,
  });

  final int blockedByTimeInSeconds;
  final int maxReactionTimeInMilliseconds;
  final int loadingTimeInSeconds;
  final int maxAttempts;
  final String? userId;
  final TestResultsRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DrunkTestBloc()
        ..add(
          DrunkTestInitialize(
            maxAttempts: maxAttempts,
            maxReactionTime:
                Duration(milliseconds: maxReactionTimeInMilliseconds),
            blockedByTimeInSeconds: blockedByTimeInSeconds,
            loadingTime: Duration(seconds: loadingTimeInSeconds),
          ),
        ),
      child: BlocSideEffectListener<DrunkTestBloc, DrunkTestEffect>(
        listener: (context, effect) {
          switch (effect) {
            case DrunkTestShowTestStartedTappedTooEarly():
              _showTappedTooEarlyDialog(context);
            case DrunkTestNotifyPassedAndClosed():
              Navigator.of(context).pop(true);
            case DrunkTestNotifyFailedAndClosed():
              Navigator.of(context).pop(false);
            case DrunkTestAttemptCompleted(:final reactionTimeMs):
              _persistAttempt(reactionTimeMs: reactionTimeMs);
          }
        },
        child: BlocBuilder<DrunkTestBloc, DrunkTestState>(
          buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
          builder: (context, state) {
            final bloc = context.read<DrunkTestBloc>();
            if (state is DrunkTestInitialized) {
              return BlocBuilder<DrunkTestBloc, DrunkTestState>(
                buildWhen: (prev, curr) =>
                    prev is DrunkTestInitialized &&
                    curr is DrunkTestInitialized &&
                    prev.status != curr.status,
                builder: (context, innerState) {
                  final s = innerState as DrunkTestInitialized;
                  switch (s.status) {
                    case DrunkTestStatus.loading:
                      return const _DrunkTestLoading();
                    case DrunkTestStatus.started:
                    case DrunkTestStatus.tappedTooEarly:
                      return const _DrunkTestStarted();
                    case DrunkTestStatus.result:
                      return DrunkTestResultPage(
                        isPassed: s.isPassed,
                        reactionTime:
                            s.lastAttemptReactionTime ?? Duration.zero,
                        remainingAttempts: s.maxAttempts - s.currentAttempts,
                        onTryAgainPressed: () =>
                            bloc.add(const DrunkTestRestart()),
                        onClosePressed: ({required bool passed}) => bloc.add(
                          DrunkTestResultClosePressed(passed: passed),
                        ),
                      );
                  }
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Future<void> _persistAttempt({required int reactionTimeMs}) async {
    final id = userId;
    if (id == null) return;
    try {
      await repository.insertResult(
        userId: id,
        reactionTimeMs: reactionTimeMs,
      );
    } catch (e, st) {
      log('Failed to persist test result', error: e, stackTrace: st);
    }
  }

  Future<void> _showTappedTooEarlyDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      useSafeArea: false,
      barrierDismissible: false,
      builder: (_) => const ForestDialogBase(
        child: DrunkTestTappedTooEarlyDialog(),
      ),
    );

    if (context.mounted) {
      context.read<DrunkTestBloc>().add(const DrunkTestRestart());
    }
  }
}

class _DrunkTestLoading extends StatelessWidget {
  const _DrunkTestLoading();

  static const double size = 192;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ForestColors.darkForest,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                child: SizedBox(
                  width: size,
                  height: size,
                  child: const CircularProgressIndicator(
                    strokeWidth: 16,
                    color: ForestColors.white,
                  ),
                ),
              ),
              Align(
                child: BlocSelector<DrunkTestBloc, DrunkTestState, int>(
                  selector: (state) => state is DrunkTestInitialized
                      ? state.remainingLoadingSeconds
                      : 0,
                  builder: (context, remainingSeconds) => SizedBox(
                    width: size,
                    height: size,
                    child: Center(
                      child: ForestText.textHeadingXXL(
                        label: remainingSeconds.toString(),
                        color: ForestColors.white,
                        fontFamily: 'Mohr',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DrunkTestStarted extends StatelessWidget {
  const _DrunkTestStarted();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DrunkTestBloc, DrunkTestState, DrunkTestStartedStatus>(
      selector: (state) => state is DrunkTestInitialized
          ? state.startedStatus
          : DrunkTestStartedStatus.greenLight,
      builder: (context, started) {
        final isGreen = started == DrunkTestStartedStatus.greenLight;
        final color = isGreen ? ForestColors.darkForest : ForestColors.mappleRed;
        final text = isGreen ? Strings.tapWhenRed : Strings.tapNow;
        final asset = isGreen
            ? 'assets/svg/traffic_light_green.svg'
            : 'assets/svg/traffic_light_red.svg';

        return GestureDetector(
          onTapDown: (_) =>
              context.read<DrunkTestBloc>().add(const DrunkTestStartedTap()),
          child: Scaffold(
            backgroundColor: color,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: ForestSpacing.spaceX4,
                  ),
                  child: ForestText.textHeadingL(
                    label: text.toUpperCase(),
                    color: ForestColors.white,
                    fontFamily: 'Mohr',
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  asset,
                  height: (MediaQuery.of(context).size.height / 3) * 2,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
