import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SnackBarSuffixType { empty, button, close }

enum ForestSnackBarType { neutral, error, warning, info, success }

class ForestSnackbar {
  static void show({
    required BuildContext context,
    required String label,
    required SnackBarSuffixType snackBarSuffixType,
    ForestSnackBarType snackBarType = ForestSnackBarType.success,
    String? body,
    String? buttonText,
    String? labelButtonText,
    String? iconExternal,
    VoidCallback? onPressLabelButton,
    VoidCallback? onPressCloseButton,
    bool hasIcon = true,
    bool isPositionBottom = true,
    bool hasHorizontalMargin = false,
    Duration duration = const Duration(seconds: 8),
    String? customIcon,
    DismissDirection? dismissDirection,
  }) {
    var backgroundColor = ForestColorsOld.colorForest500;
    var icon = 'assets/src/svg/check.svg';
    var itemColor = ForestColorsOld.colorWood0;

    switch (snackBarType) {
      case ForestSnackBarType.error:
        backgroundColor = ForestColors.mappleRed;
        icon = customIcon ?? 'assets/src/svg/xmark.svg';
      case ForestSnackBarType.warning:
        backgroundColor = ForestColorsOld.colorCassia500;
        icon = customIcon ?? 'assets/src/svg/circle_info.svg';
      case ForestSnackBarType.info:
        backgroundColor = ForestColorsOld.colorSky500;
        icon = customIcon ?? 'assets/src/svg/circle_info.svg';
      case ForestSnackBarType.neutral:
        backgroundColor = ForestColorsOld.colorWood0;
        icon = customIcon ?? 'assets/src/svg/message.svg';
        itemColor = ForestColorsOld.colorWood800;
      case ForestSnackBarType.success:
        backgroundColor = ForestColorsOld.colorForest500;
        icon = customIcon ?? 'assets/src/svg/check.svg';
        itemColor = ForestColorsOld.colorWood0;
    }

    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      duration: duration,
      padding: const EdgeInsets.all(ForestSpacing.spaceX2),
      dismissDirection: dismissDirection,
      margin: EdgeInsets.only(
        left: hasHorizontalMargin ? ForestSpacing.spaceX3 : 0,
        right: hasHorizontalMargin ? ForestSpacing.spaceX3 : 0,
        bottom: isPositionBottom ? 0 : MediaQuery.of(context).size.height * 0.7,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ForestBorder.radiusM),
        side: const BorderSide(width: 1.5, color: ForestColors.darkestForest),
      ),
      content: Row(
        crossAxisAlignment:
            body != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (hasIcon) ...[
            SvgPicture.asset(
              iconExternal ?? icon,
              colorFilter: ColorFilter.mode(
                itemColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: ForestSpacing.spaceX1),
          ],
          if (body != null)
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ForestText.textBodySBold(
                    label: label,
                    color: itemColor,
                    fontFamily: 'mohr',
                  ),
                  ForestRich(
                    text: body,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: itemColor,
                      fontSize: ForestTypography.textBodyXS,
                    ),
                    params: [
                      ForestRichModel(
                        patternId: 'a1',
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: itemColor,
                          fontSize: ForestTypography.textBodyS,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          else
            Flexible(
              child: ForestText.textBodySBold(
                label: label,
                color: itemColor,
              ),
            ),
          if (snackBarSuffixType == SnackBarSuffixType.button)
            GestureDetector(
              onTap: onPressLabelButton,
              child: ForestText.textBodySBold(
                label: labelButtonText!,
                color: itemColor,
              ),
            ),
          if (snackBarSuffixType == SnackBarSuffixType.close)
            GestureDetector(
              onTap: onPressCloseButton,
              child: SvgPicture.asset(
                'assets/src/svg/xmark.svg',
                height: 12,
              ),
            ),
          if (snackBarSuffixType == SnackBarSuffixType.empty) const SizedBox(),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }
}
