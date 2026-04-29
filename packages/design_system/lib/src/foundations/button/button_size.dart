import 'package:design_system/src/atoms/text/text.dart';
import 'package:design_system/src/foundations/typography/typography.dart';
import 'package:flutter/widgets.dart';

class ButtonSize {
  const ButtonSize({
    required this.text,
    required this.paddingH,
    required this.paddingV,
    this.fontFamily = ForestTypography.gt,
  });

  final Widget Function({
    required String label,
    Color? color,
    FontWeight? fontWeight,
    Key? key,
    TextAlign? textAlign,
    String? fontFamily,
  }) text;

  final double paddingH;
  final double paddingV;
  final String fontFamily;
}

class OldForestButtonSize {
  OldForestButtonSize._();

  static const ButtonSize headingL = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textHeadingL,
  );

  static const ButtonSize headingM = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textHeadingM,
  );

  static const ButtonSize headingS = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textHeadingS,
  );

  static const ButtonSize headingXS = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textHeadingXS,
  );

  static const ButtonSize bodyLBold = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textBodyLBold,
  );

  static const ButtonSize bodyL = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textBodyL,
  );

  static const ButtonSize bodyMBold = ButtonSize(
    paddingH: 6,
    paddingV: 0,
    text: ForestText.textBodyMBold,
  );

  static const ButtonSize bodyM = ButtonSize(
    paddingH: 6,
    paddingV: 0,
    text: ForestText.textBodyM,
  );

  static const ButtonSize bodyMMohr = ButtonSize(
    paddingH: 6,
    paddingV: 0,
    text: ForestText.textBodyMMohr,
    fontFamily: 'mohr',
  );

  static const ButtonSize bodySBold = ButtonSize(
    paddingH: 8,
    paddingV: 6,
    text: ForestText.textBodySBold,
  );

  static const ButtonSize bodySMohr = ButtonSize(
    paddingH: 6,
    paddingV: 0,
    text: ForestText.textBodySMohr,
    fontFamily: 'mohr',
  );

  static const ButtonSize bodySBoldWP = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textBodySBold,
  );

  static const ButtonSize bodyS = ButtonSize(
    paddingH: 8,
    paddingV: 0,
    text: ForestText.textBodyS,
  );

  static const ButtonSize bodyXS = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textBodyXS,
  );

  static const ButtonSize linkL = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textlinkL,
  );

  static const ButtonSize linkM = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textlinkM,
  );

  static const ButtonSize linkS = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textlinkS,
  );

  static const ButtonSize linkXS = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textlinkXS,
  );

  static const ButtonSize buttonL = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textButtonL,
  );

  static const ButtonSize buttonM = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textButtonM,
  );

  static const ButtonSize buttonS = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textButtonS,
  );

  static const ButtonSize inputMBold = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textInputMBold,
  );

  static const ButtonSize inputM = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textInputM,
  );

  static const ButtonSize inputSBold = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textInputSBold,
  );

  static const ButtonSize inputS = ButtonSize(
    paddingH: 0,
    paddingV: 0,
    text: ForestText.textInputS,
  );
}
