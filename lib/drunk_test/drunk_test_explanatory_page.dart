import 'package:design_system/design_system.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../strings.dart';
import 'drunk_test_page.dart';
import 'safety_disclaimer_page.dart';

class DrunkTestExplanatoryPage extends StatefulWidget {
  const DrunkTestExplanatoryPage({
    required this.blockedByTimeInSeconds,
    required this.maxReactionTimeInMilliseconds,
    required this.loadingTimeInSeconds,
    required this.maxAttempts,
    this.userId,
    super.key,
  });

  final int blockedByTimeInSeconds;
  final int maxReactionTimeInMilliseconds;
  final int loadingTimeInSeconds;
  final int maxAttempts;
  final String? userId;

  @override
  State<DrunkTestExplanatoryPage> createState() =>
      _DrunkTestExplanatoryPageState();
}

class _DrunkTestExplanatoryPageState extends State<DrunkTestExplanatoryPage> {
  bool _disclaimerChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ForestColors.darkForest,
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
              SvgPicture.asset('assets/svg/traffic_light_both.svg'),
              const SizedBox(height: ForestSpacing.spaceY7),
              ForestText.textBodyM(
                label: Strings.explanatoryTitle.toUpperCase(),
                fontFamily: 'Mohr',
                textAlign: TextAlign.center,
                color: ForestColors.white,
              ),
              const SizedBox(height: ForestSpacing.spaceY1),
              ForestRich(
                textAlign: TextAlign.center,
                textStyle: const TextStyle(
                  fontSize: ForestTypography.textBodyM,
                  color: ForestColors.white,
                ),
                text: '${Strings.explanatoryDescriptionLead}'
                    'a1[${Strings.explanatoryDescriptionBold}]',
                params: [
                  ForestRichModel(
                    patternId: 'a1',
                    color: ForestColors.white,
                    textStyle: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(height: ForestSpacing.spaceY3),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: 'GT',
                    fontSize: ForestTypography.textBodyM,
                    color: ForestColors.white,
                  ),
                  children: [
                    const TextSpan(text: Strings.explanatoryDisclaimerText),
                    TextSpan(
                      text: Strings.explanatoryDisclaimerLink,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _onDisclaimerTapped,
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: GestureDetector(
                        onTap: _onDisclaimerTapped,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: SvgPicture.asset(
                            'assets/svg/share.svg',
                            width: 12,
                            height: 12,
                            colorFilter: const ColorFilter.mode(
                              ForestColors.white,
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
              GestureDetector(
                onTap: () => setState(
                  () => _disclaimerChecked = !_disclaimerChecked,
                ),
                child: Row(
                  children: [
                    CheckAtom(
                      isChecked: _disclaimerChecked,
                      onChanged: (value) =>
                          setState(() => _disclaimerChecked = value),
                    ),
                    const SizedBox(width: ForestSpacing.spaceX05),
                    Flexible(
                      child: ForestText.textBodyM(
                        label: Strings.explanatoryCheckboxLabel,
                        color: ForestColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: ForestSpacing.spaceY3),
              const Spacer(),
              ForestButton.primary(
                size: ForestButtonSize.lg,
                onPressed: _onStartPressed,
                enabled: _disclaimerChecked,
                expanded: true,
                label: Strings.explanatoryStartButton,
              ),
              const SizedBox(height: ForestSpacing.spaceY1),
              ForestButton.light(
                size: ForestButtonSize.lg,
                onPressed: () => Navigator.of(context).pop(),
                expanded: true,
                elevated: false,
                label: Strings.explanatoryGoBackButton,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDisclaimerTapped() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const SafetyDisclaimerPage()),
    );
  }

  Future<void> _onStartPressed() async {
    final result = await Navigator.of(context).push<bool?>(
      MaterialPageRoute<bool?>(
        builder: (_) => DrunkTestPage(
          blockedByTimeInSeconds: widget.blockedByTimeInSeconds,
          maxReactionTimeInMilliseconds: widget.maxReactionTimeInMilliseconds,
          loadingTimeInSeconds: widget.loadingTimeInSeconds,
          maxAttempts: widget.maxAttempts,
          userId: widget.userId,
        ),
      ),
    );

    if (mounted) Navigator.of(context).pop(result);
  }
}
