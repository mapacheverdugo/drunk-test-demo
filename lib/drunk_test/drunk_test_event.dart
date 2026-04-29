part of 'drunk_test_bloc.dart';

@immutable
sealed class DrunkTestEvent extends Equatable {
  const DrunkTestEvent();

  @override
  List<Object?> get props => [];
}

final class DrunkTestLoadingRemainingSecondsChanged extends DrunkTestEvent {
  const DrunkTestLoadingRemainingSecondsChanged({
    required this.remainingSeconds,
  });

  final int remainingSeconds;

  @override
  List<Object?> get props => [remainingSeconds];
}

final class DrunkTestInitialize extends DrunkTestEvent {
  const DrunkTestInitialize({
    required this.maxAttempts,
    required this.maxReactionTime,
    required this.blockedByTimeInSeconds,
    required this.loadingTime,
  });

  final int maxAttempts;
  final Duration maxReactionTime;
  final int blockedByTimeInSeconds;
  final Duration loadingTime;

  @override
  List<Object?> get props => [
        maxAttempts,
        maxReactionTime,
        blockedByTimeInSeconds,
        loadingTime,
      ];
}

final class DrunkTestStart extends DrunkTestEvent {
  const DrunkTestStart();
}

final class DrunkTestChangeToRedLight extends DrunkTestEvent {
  const DrunkTestChangeToRedLight();
}

final class DrunkTestRestart extends DrunkTestEvent {
  const DrunkTestRestart();
}

final class DrunkTestStartedTap extends DrunkTestEvent {
  const DrunkTestStartedTap();
}

final class DrunkTestResultClosePressed extends DrunkTestEvent {
  const DrunkTestResultClosePressed({required this.passed});

  final bool passed;

  @override
  List<Object?> get props => [passed];
}
