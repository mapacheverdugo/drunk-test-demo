import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ForestDialogTypeV2 {
  oneHorizontalButton,
  twoHorizontalButton,
  twoVerticalButton,
  threeVerticalButton,
  twoVerticalButtonInvert,
}

enum ForestStatusV2 {
  success,
  warning,
  danger,
}

class ForestDialogV2 {
  static dynamic show({
    required BuildContext context,
    required String label,
    required String description,
    required VoidCallback onPressActionOne,
    required String labelActionOne,
    required RouteSettings routeSettings,
    ForestStatusV2 status = ForestStatusV2.success,
    ForestDialogTypeV2 dialogType = ForestDialogTypeV2.oneHorizontalButton,
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
      case ForestDialogTypeV2.twoHorizontalButton:
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
      case ForestDialogTypeV2.twoVerticalButton:
        footer = Column(
          children: [
            if (status == ForestStatusV2.danger)
              ForestButtonDanger(
                label: labelActionOne,
                onTap: onPressActionOne,
                buttonSize: OldForestButtonSize.bodyMMohr,
              )
            else
              ForestButtonPrimary(
                label: labelActionOne,
                onTap: onPressActionOne,
                buttonSize: OldForestButtonSize.bodyMMohr,
              ),
            const SizedBox(height: ForestSpacing.spaceY1),
            ForestButtonLight(
              labelColor: ForestColors.darkestForest,
              height: 48,
              label: labelActionTwo ?? '',
              onTap: onPressActionTwo,
              buttonSize: OldForestButtonSize.bodyMMohr,
            ),
          ],
        );
      case ForestDialogTypeV2.twoVerticalButtonInvert:
        footer = Column(
          children: [
            ForestButtonLight(
              labelColor: ForestColorsOld.colorForest800,
              height: 48,
              label: labelActionOne,
              onTap: onPressActionOne,
              buttonSize: OldForestButtonSize.bodyMMohr,
            ),
            const SizedBox(height: ForestSpacing.spaceY1),
            if (status == ForestStatusV2.danger)
              ForestButtonDanger(
                label: labelActionTwo ?? '',
                onTap: onPressActionTwo,
              )
            else
              ForestButtonPrimary(
                label: labelActionTwo ?? '',
                onTap: onPressActionTwo,
                buttonSize: OldForestButtonSize.bodyMMohr,
              ),
          ],
        );
      case ForestDialogTypeV2.threeVerticalButton:
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
      case ForestDialogTypeV2.oneHorizontalButton:
        footer = ForestButtonPrimary(
          label: labelActionOne.toUpperCase(),
          onTap: onPressActionOne,
          buttonSize: OldForestButtonSize.bodyMMohr,
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
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: ForestSpacing.spaceX3,
                ),
                decoration: const BoxDecoration(
                  color: ForestColors.iceCream,
                  border: Border(
                    bottom: BorderSide(
                      width: 8,
                      color: ForestColors.darkestForest,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(ForestBorder.radiusM),
                    topLeft: Radius.circular(ForestBorder.radiusM),
                    bottomLeft: Radius.circular(ForestBorder.radiusL),
                    bottomRight: Radius.circular(ForestBorder.radiusL),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(ForestSpacing.spaceX3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ForestColors.darkestForest,
                          width: 1.5,
                        ),
                        borderRadius:
                            BorderRadius.circular(ForestBorder.radiusM),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                            visible: svgImage.isNotEmpty,
                            child: Column(
                              children: [
                                const SizedBox(height: ForestSpacing.spaceY3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      svgImage,
                                      height: svgHeight,
                                      colorFilter: svgColor != null
                                          ? ColorFilter.mode(
                                              svgColor,
                                              BlendMode.srcIn,
                                            )
                                          : null,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: ForestSpacing.spaceY3),
                                ForestText.textHeadingXS(
                                  label: label.toUpperCase(),
                                  color: ForestColors.fontBlack,
                                  fontFamily: 'mohr',
                                ),
                                const SizedBox(height: ForestSpacing.spaceY1),
                                if (description.isNotEmpty) ...[
                                  ForestText.textBodyM(
                                    label: description,
                                    color: ForestColors.mildBlack,
                                  ),
                                  const SizedBox(height: 20),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
