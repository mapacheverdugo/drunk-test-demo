import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../strings.dart';

class DrunkTestResultPage extends StatelessWidget {
  const DrunkTestResultPage({
    required this.isPassed,
    required this.remainingAttempts,
    required this.reactionTime,
    required this.onTryAgainPressed,
    required this.onClosePressed,
    super.key,
  });

  final bool isPassed;
  final int remainingAttempts;
  final Duration reactionTime;
  final VoidCallback onTryAgainPressed;
  final void Function({required bool passed}) onClosePressed;

  @override
  Widget build(BuildContext context) {
    return isPassed
        ? _Passed(
            reactionTime: reactionTime,
            onClosePressed: () => onClosePressed(passed: true),
          )
        : _Failed(
            reactionTime: reactionTime,
            remainingAttempts: remainingAttempts,
            onTryAgainPressed: onTryAgainPressed,
            onClosePressed: () => onClosePressed(passed: true),
          );
  }
}

class _ReactionTimeBadge extends StatelessWidget {
  const _ReactionTimeBadge({required this.reactionTime, required this.passed});

  final Duration reactionTime;
  final bool passed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ForestSpacing.spaceX2,
        vertical: ForestSpacing.spaceY1,
      ),
      decoration: BoxDecoration(
        color: passed
            ? ForestColors.lightForest
            : ForestColors.softMappleRed,
        borderRadius: BorderRadius.circular(999),
      ),
      child: ForestText.textBodyLBold(
        label: Strings.reactionTimeMs(reactionTime.inMilliseconds),
        fontFamily: 'Mohr',
        color: passed ? ForestColors.darkForest : ForestColors.mappleRed,
      ),
    );
  }
}

class _Passed extends StatelessWidget {
  const _Passed({
    required this.reactionTime,
    required this.onClosePressed,
  });

  final Duration reactionTime;
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ForestColors.iceCream,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: ForestSpacing.spaceX3,
            vertical: ForestSpacing.spaceY3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const SizedBox(width: double.infinity),
              SvgPicture.asset('assets/svg/check_circle.svg'),
              const SizedBox(height: ForestSpacing.spaceY3),
              ForestText.textHeadingXS(
                label: Strings.resultPassedTitle.toUpperCase(),
                fontFamily: 'Mohr',
                textAlign: TextAlign.center,
                color: ForestColors.neutralBlack,
              ),
              const SizedBox(height: ForestSpacing.spaceY1),
              _ReactionTimeBadge(reactionTime: reactionTime, passed: true),
              const SizedBox(height: ForestSpacing.spaceX1),
              ForestText.textBodyM(
                label: Strings.resultPassedDescription,
                textAlign: TextAlign.center,
                color: ForestColors.mildBlack,
              ),
              const SizedBox(height: ForestSpacing.spaceY3),
              ForestRich(
                textAlign: TextAlign.center,
                text: 'a1[${Strings.resultPassedReminderBold}]'
                    '${Strings.resultPassedReminderRest}\n',
                textStyle: TextStyle(
                  color: ForestColors.mildBlack,
                  fontSize: ForestTypography.textBodyM,
                  fontFamily: 'GT',
                ),
                params: [
                  ForestRichModel(
                    patternId: 'a1',
                    textStyle: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'GT',
                    fontSize: ForestTypography.textBodyM,
                    color: ForestColors.mildBlack,
                  ),
                  children: [
                    TextSpan(
                      text: Strings.resultPassedAlternativeText,
                      style: TextStyle(color: ForestColors.mildBlack),
                    ),
                    TextSpan(
                      text: Strings.resultPassedAlternativeLink,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: ForestColors.accentForest,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _openTfl,
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: _openTfl,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: SvgPicture.asset(
                            'assets/svg/share.svg',
                            width: 12,
                            height: 12,
                            colorFilter: const ColorFilter.mode(
                              ForestColors.accentForest,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ForestSpacing.spaceY3),
              const Spacer(),
              ForestButton.primary(
                size: ForestButtonSize.lg,
                onPressed: onClosePressed,
                expanded: true,
                label: Strings.resultPassedButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Failed extends StatelessWidget {
  const _Failed({
    required this.reactionTime,
    required this.remainingAttempts,
    required this.onTryAgainPressed,
    required this.onClosePressed,
  });

  final Duration reactionTime;
  final int remainingAttempts;
  final VoidCallback onTryAgainPressed;
  final VoidCallback onClosePressed;

  @override
  Widget build(BuildContext context) {
    final hasRemaining = remainingAttempts > 0;
    final footerText =
        hasRemaining ? Strings.attemptsLeft(remainingAttempts) : null;
    final buttonText = hasRemaining
        ? Strings.resultFailedTryAgain
        : Strings.resultFailedRentAnyway;

    return Scaffold(
      backgroundColor: ForestColors.iceCream,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ForestSpacing.spaceX3,
                    vertical: ForestSpacing.spaceY3,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(width: double.infinity),
                      SvgPicture.asset('assets/svg/warning_circle.svg'),
                      const SizedBox(height: ForestSpacing.spaceY3),
                      ForestText.textHeadingXS(
                        label: Strings.resultFailedTitle,
                        fontFamily: 'Mohr',
                        textAlign: TextAlign.center,
                        color: ForestColors.neutralBlack,
                      ),
                      const SizedBox(height: ForestSpacing.spaceY1),
                      _ReactionTimeBadge(
                        reactionTime: reactionTime,
                        passed: false,
                      ),
                      const SizedBox(height: ForestSpacing.spaceX1),
                      ForestText.textBodyM(
                        label: Strings.resultFailedDescription,
                        textAlign: TextAlign.center,
                        color: ForestColors.mildBlack,
                      ),
                      const SizedBox(height: ForestSpacing.spaceY3),
                      ForestText.textBodyM(
                        label: Strings.resultFailedLegalWarning,
                        textAlign: TextAlign.center,
                        color: ForestColors.mildBlack,
                      ),
                      const SizedBox(height: ForestSpacing.spaceY3),
                      ForestText.textBodyM(
                        label: Strings.resultFailedAdvice,
                        textAlign: TextAlign.center,
                        color: ForestColors.mildBlack,
                      ),
                      const SizedBox(height: ForestSpacing.spaceY1),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'GT',
                            fontSize: ForestTypography.textBodyM,
                            color: ForestColors.mildBlack,
                          ),
                          children: [
                            const TextSpan(
                              text: Strings.resultFailedAlternativeText,
                            ),
                            TextSpan(
                              text: Strings.resultFailedAlternativeLink,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                                color: ForestColors.accentForest,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = _openTfl,
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: GestureDetector(
                                onTap: _openTfl,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: SvgPicture.asset(
                                    'assets/svg/share.svg',
                                    width: 12,
                                    height: 12,
                                    colorFilter: const ColorFilter.mode(
                                      ForestColors.accentForest,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: ForestSpacing.spaceY3),
                      Builder(
                        builder: (context) => RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontFamily: 'GT',
                              fontSize: ForestTypography.textBodyM,
                              color: ForestColors.mildBlack,
                            ),
                            children: [
                              const TextSpan(
                                text: Strings.resultFailedReportIssue,
                              ),
                              TextSpan(
                                text: Strings.resultFailedReportIssueLink,
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  color: ForestColors.accentForest,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => _showReportComingSoon(context),
                              ),
                              const TextSpan(
                                text: Strings.resultFailedReportIssueSuffix,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: ForestSpacing.spaceY1),
                      ForestText.textBodyM(
                        label: Strings.resultFailedReportHelp,
                        textAlign: TextAlign.center,
                        color: ForestColors.mildBlack,
                      ),
                      if (footerText != null) ...[
                        const SizedBox(height: ForestSpacing.spaceY3),
                        ForestText.textBodyMBold(label: footerText),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              ForestSpacing.spaceX3,
              0,
              ForestSpacing.spaceX3,
              ForestSpacing.spaceY3,
            ),
            child: ForestButton.primary(
              size: ForestButtonSize.lg,
              onPressed: hasRemaining ? onTryAgainPressed : onClosePressed,
              expanded: true,
              label: buttonText,
            ),
          ),
        ],
      ),
    );
  }
}

void _openTfl() {
  launchUrl(Uri.parse('https://tfl.gov.uk/'));
}

void _showReportComingSoon(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Reporting flow is not part of this demo.'),
    ),
  );
}
