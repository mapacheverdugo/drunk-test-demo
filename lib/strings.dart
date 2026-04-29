class Strings {
  Strings._();

  static const explanatoryTitle = 'Safe to ride?';
  static const explanatoryDescriptionLead =
      "It's late. Let's check your reaction-time to help keep you and everyone else safe on the road. ";
  static const explanatoryDescriptionBold =
      'Touch the screen when the traffic light is red.';
  static const explanatoryDisclaimerText =
      'Before starting the test, please read through the ';
  static const explanatoryDisclaimerLink = 'safety disclaimer';
  static const explanatoryCheckboxLabel =
      'I have read and understood the disclaimer.';
  static const explanatoryStartButton = 'Start';
  static const explanatoryGoBackButton = 'Go back';

  static const tapWhenRed = 'Tap the screen when the light turns red';
  static const tapNow = 'Tap the screen!';

  static const tappedTooEarlyTitle = "Don't tap too early";
  static const tappedTooEarlyDescription =
      'You have to wait for the traffic light to change to red.';
  static const tappedTooEarlyTryAgain = 'Try again';

  static const resultPassedTitle = 'Response time normal';
  static const resultPassedDescription =
      'Your reaction time appears within the expected range.';
  static const resultPassedReminderBold = 'REMINDER:';
  static const resultPassedReminderRest =
      ' This is not a legal or medical certification of sobriety. Do not ride if you have consumed alcohol and/or drugs and/or you feel impaired.';
  static const resultPassedAlternativeText =
      'Please consider alternative transport if necessary. ';
  static const resultPassedAlternativeLink = 'Transport for London';
  static const resultPassedButton = 'Rent now';

  static const resultFailedTitle = 'SAFETY ADVISORY\nSLOW RESPONSE DETECTED';
  static const resultFailedDescription =
      'Your reaction time appears to be slower than expected. This may indicate impairment or fatigue.';
  static const resultFailedLegalWarning =
      'LEGAL WARNING: Riding an e-bike while unfit through drink or drugs is a criminal offence in England.';
  static const resultFailedAdvice =
      'OUR ADVICE: We strongly recommend you do not ride if you are unfit to do so.';
  static const resultFailedAlternativeText =
      'Please consider alternative transport like ';
  static const resultFailedAlternativeLink = 'Transport for London';
  static const resultFailedReportIssue =
      'Think this result is wrong? If a technical issue or physical condition may have affected your result, ';
  static const resultFailedReportIssueLink = 'tap here';
  static const resultFailedReportIssueSuffix = ' to report it.';
  static const resultFailedReportHelp =
      'This helps us improve our accuracy and provide reasonable adjustments for your account.';
  static const resultFailedTryAgain = 'Try again';
  static const resultFailedRentAnyway = 'Rent bike anyway';

  static String attemptsLeft(int attempts) =>
      attempts == 1 ? '$attempts attempt left' : '$attempts attempts left';

  static const safetyDisclaimerBody =
      'This reaction-time test is provided as a self-check tool only. It does '
      'not detect or measure intoxication, and a passing result does not mean '
      "you are fit to ride. Always use your own judgement, and don't ride if "
      'you have consumed alcohol or drugs, are tired, or feel unwell.';

  static const landingTitle = 'Drunk cyclist test';
  static const landingSubtitle = 'Demo of the reaction-time check flow';
  static const landingButton = 'Run the test';
  static const landingResultPassed = 'Last run: passed ✓';
  static const landingResultFailed = 'Last run: failed ✗';
  static const landingResultCancelled = 'Last run: cancelled';

  static const welcomeNameLabel = 'Your name';
  static const welcomeNameHint = 'Enter your name (3+ chars)';
  static const welcomeLastResultLabel = 'Last result';
  static const welcomePersonalRecordLabel = 'Personal record';
  static const welcomeNoResultsYet = 'No results yet';
  static const welcomePassed = 'Passed';
  static const welcomeFailed = 'Failed';

  static const clearNameDialogTitle = 'Clear your name?';
  static const clearNameDialogDescription =
      'If you clear your name, you will lose access to your saved results '
      'and any new results created with the same name will live under a new '
      'identity.';
  static const clearNameDialogConfirm = 'Yes, clear my name';
  static const clearNameDialogCancel = 'Cancel';

  static const leaderboardTitle = 'Top 10 records';
  static const leaderboardEmpty =
      'No records yet — be the first to set one.';
  static const leaderboardClose = 'Close';

  static String reactionTimeMs(int ms) => '${ms}ms';
}
