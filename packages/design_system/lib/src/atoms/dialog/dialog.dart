import 'package:design_system/src/atoms/button/button.dart';
import 'package:design_system/src/atoms/text/text.dart';
import 'package:design_system/src/foundations/borders/borders.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ForestDialogType {
  oneHorizontalButton,
  twoHorizontalButton,
  twoVerticalButton,
  threeVerticalButton,
  twoVerticalButtonInvert,
}

enum ForestStatus {
  success,
  warning,
  danger,
}

class ForestDialog {
  static dynamic show({
    required BuildContext context,
    required String label,
    required String description,
    required VoidCallback onPressActionOne,
    required String labelActionOne,
    required RouteSettings routeSettings,
    ForestStatus status = ForestStatus.success,
    ForestDialogType dialogType = ForestDialogType.oneHorizontalButton,
    VoidCallback? onPressActionTwo,
    VoidCallback? onPressActionTree,
    String svgImage = '',
    double svgHeight = 28,
    Color? svgColor,
    Color circleAvatarColor = Colors.transparent,
    Color circleForegroundColor = ForestColorsOld.colorForest900,
    String? labelActionTwo,
    String? labelActionTree,
    Widget? bodyWidget,
    Color barrierColor = ForestColorsOld.colorForest900,
    bool barrierDismissible = true,
  }) async {
    Widget footer = ForestButtonPrimary(
      label: labelActionOne,
      onTap: onPressActionOne,
    );

    switch (dialogType) {
      case ForestDialogType.twoHorizontalButton:
        footer = Row(
          children: [
            Expanded(
              child: ForestButtonBorderless(
                label: labelActionTwo ?? '',
                labelColor: ForestColorsOld.colorForest800,
                onTap: onPressActionTwo,
              ),
            ),
            const SizedBox(width: ForestSpacing.spaceX1),
            Expanded(
              child: ForestButtonPrimary(
                label: labelActionOne,
                onTap: onPressActionOne,
              ),
            ),
          ],
        );
      case ForestDialogType.twoVerticalButton:
        footer = Column(
          children: [
            if (status == ForestStatus.danger)
              ForestButtonDanger(
                label: labelActionOne,
                onTap: onPressActionOne,
              )
            else
              ForestButtonPrimary(
                label: labelActionOne,
                onTap: onPressActionOne,
              ),
            const SizedBox(height: ForestSpacing.spaceY1),
            ForestButtonLight(
              labelColor: ForestColorsOld.colorForest800,
              height: 48,
              label: labelActionTwo ?? '',
              onTap: onPressActionTwo,
            ),
          ],
        );
      case ForestDialogType.twoVerticalButtonInvert:
        footer = Column(
          children: [
            ForestButtonLight(
              labelColor: ForestColorsOld.colorForest800,
              height: 48,
              label: labelActionOne,
              onTap: onPressActionOne,
            ),
            const SizedBox(height: ForestSpacing.spaceY1),
            if (status == ForestStatus.danger)
              ForestButtonDanger(
                label: labelActionTwo ?? '',
                onTap: onPressActionTwo,
              )
            else
              ForestButtonPrimary(
                label: labelActionTwo ?? '',
                onTap: onPressActionTwo,
              ),
          ],
        );
      case ForestDialogType.threeVerticalButton:
        footer = Column(
          children: [
            ForestButtonPrimary(
              label: labelActionOne,
              onTap: onPressActionOne,
            ),
            const SizedBox(height: ForestSpacing.spaceY1),
            ForestButtonLight(
              label: labelActionTwo ?? '',
              onTap: onPressActionTwo,
            ),
            const SizedBox(height: ForestSpacing.spaceY1),
            ForestButtonBorderless(
              label: labelActionTree ?? '',
              onTap: onPressActionTree,
            ),
          ],
        );
      case ForestDialogType.oneHorizontalButton:
        footer = ForestButtonPrimary(
          label: labelActionOne,
          onTap: onPressActionOne,
        );
    }

    return await showDialog<dynamic>(
      context: context,
      barrierColor: barrierColor.withValues(alpha: 0.6),
      barrierDismissible: barrierDismissible,
      routeSettings: routeSettings,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ForestSpacing.spaceX3,
                    ),
                    margin: const EdgeInsets.only(
                      left: ForestSpacing.spaceX3,
                      right: ForestSpacing.spaceX3,
                      bottom: ForestSpacing.spaceY1,
                    ),
                    decoration: BoxDecoration(
                      color: ForestColorsOld.colorWood0,
                      borderRadius: BorderRadius.circular(ForestBorder.radiusS),
                      border: Border.all(color: ForestColorsOld.colorForest900),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: svgImage.isNotEmpty,
                          child: Column(
                            children: [
                              const SizedBox(height: ForestSpacing.spaceY3),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: circleAvatarColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: circleForegroundColor,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                        ForestSpacing.spaceX2,
                                      ),
                                      child: SvgPicture.asset(
                                        svgImage,
                                        height: svgHeight,
                                        colorFilter: svgColor != null
                                            ? ColorFilter.mode(
                                                svgColor,
                                                BlendMode.srcIn,
                                              )
                                            : null,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: ForestSpacing.spaceY3),
                        ForestText.textHeadingXS(
                          label: label,
                          color: ForestColorsOld.colorWood800,
                        ),
                        const SizedBox(height: ForestSpacing.spaceY3),
                        if (description.isNotEmpty) ...[
                          ForestText.textBodyM(
                            label: description,
                            color: ForestColorsOld.colorWood700,
                          ),
                          const SizedBox(height: ForestSpacing.spaceY3),
                        ],
                        if (bodyWidget != null) ...[
                          bodyWidget,
                          const SizedBox(height: ForestSpacing.spaceY3),
                        ],
                        footer,
                        const SizedBox(height: ForestSpacing.spaceY3),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
