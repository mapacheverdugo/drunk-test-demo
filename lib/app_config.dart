class AppConfig {
  AppConfig._();

  static const passThresholdMs = 500;
  static const maxAttempts = 1;
  static const blockedByTimeInSeconds = 600;
  static const loadingTimeInSeconds = 3;

  static bool isPassed(int reactionTimeMs) =>
      reactionTimeMs <= passThresholdMs;
}
