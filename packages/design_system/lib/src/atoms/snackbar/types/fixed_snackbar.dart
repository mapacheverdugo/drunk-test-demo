import 'package:design_system/src/atoms/text/text.dart';
import 'package:design_system/src/foundations/borders/borders.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ForestFixedSnackBarSuffixType { empty, button, close }

enum ForestFixedSnackBarType { neutral, error, warning, info, success }

class ForestFixedSnackbar extends StatelessWidget {
  const ForestFixedSnackbar({
    required this.label,
    required this.snackBarSuffixType,
    super.key,
    this.snackBarType = ForestFixedSnackBarType.success,
    this.body,
    this.buttonText,
    this.labelButtonText,
    this.onPressLabelButton,
    this.onPressCloseButton,
    this.hasIcon = true,
    this.isSvgIcon = false,
    this.svgIcon = '',
  });

  final String label;
  final ForestFixedSnackBarType snackBarType;
  final String? body;
  final String? buttonText;
  final String? labelButtonText;
  final VoidCallback? onPressLabelButton;
  final VoidCallback? onPressCloseButton;
  final bool hasIcon;
  final bool isSvgIcon;
  final String svgIcon;
  final ForestFixedSnackBarSuffixType snackBarSuffixType;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = ForestColorsOld.colorForest500;
    var icon = '';
    var itemColor = ForestColorsOld.colorWood0;

    switch (snackBarType) {
      case ForestFixedSnackBarType.error:
        backgroundColor = ForestColorsOld.colorRowan500;
        icon = 'xmark';
      case ForestFixedSnackBarType.warning:
        backgroundColor = ForestColorsOld.colorCassia500;
        icon = 'circle_info';
      case ForestFixedSnackBarType.info:
        backgroundColor = ForestColorsOld.colorSky500;
        icon = 'circle_info';
      case ForestFixedSnackBarType.neutral:
        backgroundColor = ForestColorsOld.colorWood0;
        icon = 'bicycle';
        itemColor = ForestColorsOld.colorWood800;
      case ForestFixedSnackBarType.success:
        backgroundColor = ForestColorsOld.colorForest500;
        icon = '';
        itemColor = ForestColorsOld.colorWood0;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ForestSpacing.spaceX2,
        vertical: ForestSpacing.spaceX3,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(ForestBorder.radiusS),
      ),
      child: Row(
        children: [
          if (hasIcon) ...[
            if (svgIcon.isNotEmpty)
              SvgPicture.asset(
                'assets/src/svg/$svgIcon.svg',
                colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
              )
            else
              SvgPicture.asset(
                'assets/src/svg/$icon.svg',
                colorFilter: ColorFilter.mode(itemColor, BlendMode.srcIn),
              ),
            const SizedBox(width: ForestSpacing.spaceX1),
          ],
          ForestText.textBodySBold(label: label, color: itemColor),
          const Spacer(),
          if (snackBarSuffixType == ForestFixedSnackBarSuffixType.button)
            GestureDetector(
              onTap: onPressLabelButton,
              child: ForestText.textBodySBold(
                label: labelButtonText!,
                color: itemColor,
              ),
            ),
          if (snackBarSuffixType == ForestFixedSnackBarSuffixType.close)
            GestureDetector(
              onTap: onPressCloseButton,
              child: SvgPicture.asset(
                'assets/src/svg/xmark.svg',
                height: 12,
                colorFilter: const ColorFilter.mode(
                  ForestColorsOld.colorRowan100,
                  BlendMode.srcIn,
                ),
              ),
            ),
          if (snackBarSuffixType == ForestFixedSnackBarSuffixType.empty)
            const SizedBox(),
        ],
      ),
    );
  }
}
