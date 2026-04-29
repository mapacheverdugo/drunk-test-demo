import 'package:design_system/src/atoms/button/button.dart';
import 'package:design_system/src/atoms/text/text.dart';
import 'package:design_system/src/foundations/alert/alert_interface.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'types/default_none.dart';
part 'types/default_one_button.dart';
part 'types/default_two_button.dart';
part 'types/medium_elevated_none.dart';
part 'types/medium_elevated_one_button.dart';
part 'types/medium_elevated_two_button.dart';
part 'types/small_elevated_none.dart';
part 'types/small_elevated_one_button.dart';
part 'types/small_elevated_two_button.dart';
part 'types/stroke_none.dart';
part 'types/stroke_one_button.dart';
part 'types/stroke_two_button.dart';

class _ForestAlertGeneric extends StatelessWidget {
  const _ForestAlertGeneric({
    required this.title,
    required this.alertInterface,
    this.onTap,
    this.subtitle = '',
    this.onTapPrimaryButton,
    this.onTapOutlineButton,
    this.primaryButtonLabel = '',
    this.outlineButtonLabel = '',
    this.primaryIcon,
    this.outlineIcon,
    this.showOutlineIcon = false,
    this.showPrimaryIcon = false,
    this.iconColor,
    this.showXMark = false,
    this.isMarkDownBody = false,
    this.iconSize,
    this.customText,
    this.fontFamily,
  });

  final String title;
  final GestureTapCallback? onTap;
  final ForestAlertInterface alertInterface;
  final String subtitle;
  final VoidCallback? onTapPrimaryButton;
  final VoidCallback? onTapOutlineButton;
  final String primaryButtonLabel;
  final String outlineButtonLabel;
  final String? primaryIcon;
  final String? outlineIcon;
  final bool showPrimaryIcon;
  final bool showOutlineIcon;
  final Color? iconColor;
  final bool showXMark;
  final bool isMarkDownBody;
  final double? iconSize;
  final Widget? customText;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    var alertColor = ForestColorsOld.colorForest100;
    var titleColor = ForestColorsOld.colorForest800;
    var subtitleColor = ForestColorsOld.colorForest700;
    Widget outlineButton = const SizedBox.shrink();
    Widget primaryButton = const SizedBox.shrink();
    final svgUrl = alertInterface.svgUrl;

    switch (alertInterface.alertType) {
      case AlertType.success:
        alertColor = ForestColorsOld.colorForest100;
        titleColor = ForestColorsOld.colorForest800;
        subtitleColor = ForestColorsOld.colorForest700;
        primaryButton = ForestButtonPrimary(
          label: primaryButtonLabel,
          onTap: onTapPrimaryButton,
          showIcon: showPrimaryIcon,
          icon: primaryIcon,
        );

        outlineButton = ForestButtonPrimaryOutline(
          label: outlineButtonLabel,
          onTap: onTapOutlineButton,
          showIcon: showOutlineIcon,
          icon: outlineIcon,
        );
      case AlertType.error:
        alertColor = ForestColorsOld.colorRowan100;
        titleColor = ForestColorsOld.colorRowan800;
        subtitleColor = ForestColorsOld.colorRowan700;
        primaryButton = ForestButtonPrimary(
          label: primaryButtonLabel,
          onTap: onTapPrimaryButton,
          showIcon: showPrimaryIcon,
          icon: primaryIcon,
        );

        outlineButton = ForestButtonPrimaryOutline(
          label: outlineButtonLabel,
          onTap: onTapOutlineButton,
          showIcon: showOutlineIcon,
          icon: outlineIcon,
        );
      case AlertType.info:
        alertColor = ForestColorsOld.colorSky100;
        titleColor = ForestColorsOld.colorSky800;
        subtitleColor = ForestColorsOld.colorSky700;
        primaryButton = ForestButtonPrimary(
          label: primaryButtonLabel,
          onTap: onTapPrimaryButton,
          showIcon: showPrimaryIcon,
          icon: primaryIcon,
        );

        outlineButton = ForestButtonPrimaryOutline(
          label: outlineButtonLabel,
          onTap: onTapOutlineButton,
          showIcon: showOutlineIcon,
          icon: outlineIcon,
        );
      case AlertType.normal:
        alertColor = ForestColorsOld.colorWood0;
        titleColor = ForestColorsOld.colorWood800;
        subtitleColor = ForestColorsOld.colorWood700;
        primaryButton = ForestButtonPrimary(
          label: primaryButtonLabel,
          onTap: onTapPrimaryButton,
          showIcon: showPrimaryIcon,
          icon: primaryIcon,
        );

        outlineButton = ForestButtonPrimaryOutline(
          label: outlineButtonLabel,
          onTap: onTapOutlineButton,
          showIcon: showOutlineIcon,
          icon: outlineIcon,
        );
      case AlertType.secondary:
        alertColor = ForestColorsOld.colorAutumn100;
        titleColor = ForestColorsOld.colorAutumn800;
        subtitleColor = ForestColorsOld.colorAutumn700;
        primaryButton = ForestButtonPrimary(
          label: primaryButtonLabel,
          onTap: onTapPrimaryButton,
          showIcon: showPrimaryIcon,
          icon: primaryIcon,
        );

        outlineButton = ForestButtonPrimaryOutline(
          label: outlineButtonLabel,
          onTap: onTapOutlineButton,
          showIcon: showOutlineIcon,
          icon: outlineIcon,
        );
      case AlertType.warning:
        alertColor = ForestColorsOld.colorCassia100;
        titleColor = ForestColorsOld.colorCassia800;
        subtitleColor = ForestColorsOld.colorCassia700;
        primaryButton = ForestButtonWarning(
          label: primaryButtonLabel,
          onTap: onTapPrimaryButton,
          showIcon: showPrimaryIcon,
          svgUrl: primaryIcon,
        );

        outlineButton = ForestButtonPrimaryOutline(
          label: outlineButtonLabel,
          onTap: onTapOutlineButton,
          showIcon: showOutlineIcon,
          icon: outlineIcon,
        );
    }

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 10,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: ForestColorsOld.colorForest900,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(alertInterface.padding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          alertInterface.borderRadius,
                        ),
                        border: alertInterface.borderWidth == 0
                            ? null
                            : Border.all(width: alertInterface.borderWidth),
                        color: alertColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (alertInterface.showIcon)
                                if (svgUrl.isNotEmpty) ...[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: ForestSpacing.spaceY05,
                                    ),
                                    child: SvgPicture.asset(
                                      svgUrl,
                                      colorFilter: iconColor != null
                                          ? ColorFilter.mode(
                                              iconColor!,
                                              BlendMode.srcIn,
                                            )
                                          : null,
                                      height: iconSize,
                                    ),
                                  ),
                                  const SizedBox(width: ForestSpacing.spaceX2),
                                ],
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (customText != null)
                                      customText!
                                    else
                                      ForestText.textBodyMBold(
                                        label: title,
                                        color: titleColor,
                                        fontFamily: fontFamily,
                                      ),
                                    const SizedBox(
                                      height: ForestSpacing.spaceY05,
                                    ),
                                    if (subtitle.isNotEmpty)
                                      Visibility(
                                        visible: !isMarkDownBody,
                                        replacement: Markdown(
                                          physics:
                                              const ClampingScrollPhysics(),
                                          data: subtitle,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          styleSheet: MarkdownStyleSheet(
                                            p: TextStyle(
                                              color: iconColor,
                                            ),
                                          ),
                                        ),
                                        child: ForestText.textBodyXS(
                                          label: subtitle,
                                          color: subtitleColor,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (showXMark) ...[
                                const SizedBox(width: ForestSpacing.spaceX1),
                                SvgPicture.asset(
                                  'assets/src/svg/xmark.svg',
                                  colorFilter: ColorFilter.mode(
                                    titleColor,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          if (alertInterface.hasButton) ...[
                            const SizedBox(height: ForestSpacing.spaceY2),
                            Row(
                              children: [
                                if (alertInterface.buttonCounter > 1)
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Flexible(child: outlineButton),
                                        const SizedBox(
                                          width: ForestSpacing.spaceX2,
                                        ),
                                        Flexible(child: primaryButton),
                                      ],
                                    ),
                                  )
                                else
                                  Flexible(child: primaryButton),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              if (alertInterface.bottomBorderWidth == 2)
                const SizedBox(height: 2),
              if (alertInterface.bottomBorderWidth == 4)
                const SizedBox(height: 4),
            ],
          ),
        ],
      ),
    );
  }
}
