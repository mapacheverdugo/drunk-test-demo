part of 'drunk_test_bloc.dart';

@immutable
sealed class DrunkTestEffect extends Equatable {
  const DrunkTestEffect();

  @override
  List<Object?> get props => [];
}

final class DrunkTestShowTestStartedTappedTooEarly extends DrunkTestEffect {
  const DrunkTestShowTestStartedTappedTooEarly({
    required this.remainingAttempts,
  });

  final int remainingAttempts;

  @override
  List<Object?> get props => [remainingAttempts];
}

final class DrunkTestNotifyPassedAndClosed extends DrunkTestEffect {
  const DrunkTestNotifyPassedAndClosed();
}

final class DrunkTestNotifyFailedAndClosed extends DrunkTestEffect {
  const DrunkTestNotifyFailedAndClosed();
}

final class DrunkTestAttemptCompleted extends DrunkTestEffect {
  const DrunkTestAttemptCompleted({
    required this.reactionTimeMs,
    required this.passed,
  });

  final int reactionTimeMs;
  final bool passed;

  @override
  List<Object?> get props => [reactionTimeMs, passed];
}
