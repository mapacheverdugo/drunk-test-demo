part of '../alert.dart';

class _ForestAlertDefaultNone extends ForestAlertInterface {
  _ForestAlertDefaultNone({
    required super.alertType,
    required super.borderRadius,
    required super.padding,
    required super.hasButton,
    required super.buttonCounter,
    required super.svgUrl,
    required super.showIcon,
  }) : super(
          alertColor: ForestColorsOld.colorForest100,
          titleColor: ForestColorsOld.colorForest800,
          borderWidth: 0,
          bottomBorderWidth: 0,
        );
}

class ForestAlertDefaultNone extends StatelessWidget {
  const ForestAlertDefaultNone({
    required this.title,
    required this.alertType,
    super.key,
    this.onTap,
    this.borderRadius = 8,
    this.padding = 16,
    this.borderWidth = 02,
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
    this.svgUrl = '',
    this.showIcon = true,
    this.iconColor,
    this.showXMark = false,
    this.iconSize,
    this.customText,
    this.fontFamily,
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
  final String svgUrl;
  final bool showIcon;
  final Color? iconColor;
  final bool showXMark;
  final double? iconSize;
  final Widget? customText;
  final String? fontFamily;

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
      iconColor: iconColor,
      fontFamily: fontFamily,
      alertInterface: _ForestAlertDefaultNone(
        alertType: alertType,
        borderRadius: borderRadius,
        padding: padding,
        hasButton: hasButton,
        buttonCounter: buttonCounter,
        svgUrl: svgUrl,
        showIcon: showIcon,
      ),
      showXMark: showXMark,
      iconSize: iconSize,
      customText: customText,
    );
  }
}
