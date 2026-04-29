part of '../alert.dart';

class _ForestAlertSmallElevatedOneButton extends ForestAlertInterface {
  _ForestAlertSmallElevatedOneButton({
    required super.alertType,
    required super.borderRadius,
    required super.padding,
    required double borderWidth,
    required bool hasButton,
    required int buttonCounter,
    required double bottomBorderWidth,
    required super.svgUrl,
    required super.showIcon,
  }) : super(
          alertColor: ForestColorsOld.colorForest100,
          titleColor: ForestColorsOld.colorForest800,
          borderWidth: 1,
          hasButton: true,
          buttonCounter: 1,
          bottomBorderWidth: 4,
        );
}

class ForestAlertSmallElevatedOneButton extends StatelessWidget {
  const ForestAlertSmallElevatedOneButton({
    required this.title,
    required this.alertType,
    super.key,
    this.onTap,
    this.borderRadius = 8,
    this.padding = 16,
    this.borderWidth = 1,
    this.subtitle = '',
    this.hasButton = true,
    this.buttonCounter = 1,
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
      alertInterface: _ForestAlertSmallElevatedOneButton(
        alertType: alertType,
        borderRadius: borderRadius,
        padding: padding,
        borderWidth: borderWidth,
        hasButton: hasButton,
        buttonCounter: buttonCounter,
        bottomBorderWidth: bottomBorderWidth,
        svgUrl: svgUrl,
        showIcon: showIcon,
      ),
    );
  }
}
