part of '../alert.dart';

class _ForestAlertSmallElevatedNone extends ForestAlertInterface {
  _ForestAlertSmallElevatedNone({
    required super.alertType,
    required super.borderRadius,
    required super.padding,
    required double borderWidth,
    required super.hasButton,
    required super.buttonCounter,
    required double bottomBorderWidth,
    required super.showIcon,
    required super.svgUrl,
  }) : super(
          alertColor: ForestColorsOld.colorForest100,
          titleColor: ForestColorsOld.colorForest800,
          borderWidth: 1,
          bottomBorderWidth: 2,
        );
}

class ForestAlertSmallElevatedNone extends StatelessWidget {
  const ForestAlertSmallElevatedNone({
    required this.title,
    required this.alertType,
    super.key,
    this.onTap,
    this.borderRadius = 8,
    this.padding = 16,
    this.borderWidth = 2,
    this.subtitle = '',
    this.hasButton = false,
    this.buttonCounter = 0,
    this.bottomBorderWidth = 2,
    this.onTapPrimaryButton,
    this.onTapOutlineButton,
    this.primaryButtonLabel = '',
    this.outlineButtonLabel = '',
    this.primaryIcon,
    this.outlineIcon,
    this.showOutlineIcon = false,
    this.showPrimaryIcon = false,
    this.showIcon = true,
    this.svgUrl = '',
    this.showXMark = false,
    this.iconColor,
    this.isMarkDownBody = false,
    this.iconSize,
  });

  final String title;
  final AlertType alertType;
  final VoidCallback? onTap;
  final double borderRadius;
  final double padding;
  final double borderWidth;
  final String subtitle;
  final bool hasButton;
  final int buttonCounter;
  final double bottomBorderWidth;
  final VoidCallback? onTapPrimaryButton;
  final VoidCallback? onTapOutlineButton;
  final String primaryButtonLabel;
  final String outlineButtonLabel;
  final String? primaryIcon;
  final String? outlineIcon;
  final bool showPrimaryIcon;
  final bool showOutlineIcon;
  final bool showIcon;
  final String svgUrl;
  final bool showXMark;
  final Color? iconColor;
  final bool isMarkDownBody;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return _ForestAlertGeneric(
      title: title,
      onTap: onTap,
      subtitle: subtitle,
      onTapPrimaryButton: onTapPrimaryButton,
      onTapOutlineButton: onTapOutlineButton,
      primaryButtonLabel: primaryButtonLabel,
      outlineButtonLabel: outlineButtonLabel,
      primaryIcon: primaryIcon,
      outlineIcon: outlineIcon,
      showOutlineIcon: showOutlineIcon,
      showPrimaryIcon: showPrimaryIcon,
      alertInterface: _ForestAlertSmallElevatedNone(
        alertType: alertType,
        borderRadius: borderRadius,
        padding: padding,
        borderWidth: borderWidth,
        hasButton: hasButton,
        buttonCounter: buttonCounter,
        bottomBorderWidth: bottomBorderWidth,
        showIcon: showIcon,
        svgUrl: svgUrl,
      ),
      showXMark: showXMark,
      iconColor: iconColor,
      isMarkDownBody: isMarkDownBody,
      iconSize: iconSize,
    );
  }
}
