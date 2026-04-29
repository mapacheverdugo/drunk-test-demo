part of 'drunk_test_bloc.dart';

@immutable
sealed class DrunkTestState extends Equatable {
  const DrunkTestState();

  @override
  List<Object?> get props => [];
}

final class DrunkTestUninitialized extends DrunkTestState {
  const DrunkTestUninitialized();
}

enum DrunkTestStatus { loading, started, tappedTooEarly, result }

enum DrunkTestStartedStatus { greenLight, redLight }

final class DrunkTestInitialized extends DrunkTestState {
  const DrunkTestInitialized({
    required this.maxAttempts,
    required this.maxReactionTime,
    required this.remainingLoadingSeconds,
    required this.blockedByTimeInSeconds,
    this.status = DrunkTestStatus.loading,
    this.lastAttemptStartDateTime,
    this.lastAttemptEndDateTime,
    this.currentAttempts = 0,
    this.startedStatus = DrunkTestStartedStatus.greenLight,
  });

  final int maxAttempts;
  final Duration maxReactionTime;
  final int remainingLoadingSeconds;
  final int blockedByTimeInSeconds;
  final DrunkTestStatus status;
  final int currentAttempts;
  final DateTime? lastAttemptStartDateTime;
  final DateTime? lastAttemptEndDateTime;
  final DrunkTestStartedStatus startedStatus;

  Duration? get lastAttemptReactionTime {
    if (lastAttemptEndDateTime == null || lastAttemptStartDateTime == null) {
      return null;
    }
    return lastAttemptEndDateTime!.difference(lastAttemptStartDateTime!);
  }

  bool get isPassed {
    if (lastAttemptEndDateTime == null ||
        lastAttemptStartDateTime == null ||
        status != DrunkTestStatus.result) {
      return false;
    }
    return lastAttemptEndDateTime!.difference(lastAttemptStartDateTime!) <=
        maxReactionTime;
  }

  DrunkTestInitialized copyWith({
    DrunkTestStatus? status,
    DrunkTestStartedStatus? startedStatus,
    int? currentAttempts,
    ValueGetter<DateTime?>? lastAttemptStartDateTime,
    ValueGetter<DateTime?>? lastAttemptEndDateTime,
    int? remainingLoadingSeconds,
    int? blockedByTimeInSeconds,
  }) =>
      DrunkTestInitialized(
        maxAttempts: maxAttempts,
        maxReactionTime: maxReactionTime,
        blockedByTimeInSeconds:
            blockedByTimeInSeconds ?? this.blockedByTimeInSeconds,
        status: status ?? this.status,
        remainingLoadingSeconds:
            remainingLoadingSeconds ?? this.remainingLoadingSeconds,
        currentAttempts: currentAttempts ?? this.currentAttempts,
        lastAttemptStartDateTime: lastAttemptStartDateTime != null
            ? lastAttemptStartDateTime()
            : this.lastAttemptStartDateTime,
        lastAttemptEndDateTime: lastAttemptEndDateTime != null
            ? lastAttemptEndDateTime()
            : this.lastAttemptEndDateTime,
        startedStatus: startedStatus ?? this.startedStatus,
      );

  @override
  List<Object?> get props => [
        maxAttempts,
        maxReactionTime,
        currentAttempts,
        lastAttemptStartDateTime,
        lastAttemptEndDateTime,
        startedStatus,
        status,
        remainingLoadingSeconds,
        lastAttemptReactionTime,
      ];
}
