part of '../floating_button.dart';

class _ForestFloatingButtonLightOutline extends ForestFloatingButtonInterface {
  _ForestFloatingButtonLightOutline({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.buttonColor = Colors.transparent,
    super.isDisabled,
    super.height = null,
    super.width = null,
    double? borderWidth,
    super.showIcon,
    super.iconIsSvg = true,
    super.svgUrl,
    super.svgSize,
  }) : super(
          iconColor: ForestColorsOld.colorWood0,
          borderColor: ForestColorsOld.colorWood0,
          borderWidth: 1.5,
          iconSize: 15,
        );
}

class ForestFloatingButtonLightOutline extends StatelessWidget {
  const ForestFloatingButtonLightOutline({
    required this.onTap,
    super.key,
    this.buttonColor = Colors.transparent,
    this.label,
    this.buttonSize = OldForestButtonSize.bodyM,
    this.labelColor,
    this.labelFontWeight,
    this.borderRadius,
    this.isLoading = false,
    this.height = 48,
    this.width = 48,
    this.borderWidth,
    this.isDisabled = false,
    this.showIcon = false,
    this.svgSize = 9,
    this.iconIsSvg = true,
    this.svgUrl,
  });

  final String? label;
  final Color buttonColor;
  final VoidCallback? onTap;
  final ButtonSize buttonSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;
  final double? height;
  final double? width;
  final double? borderWidth;
  final bool isDisabled;
  final bool showIcon;
  final bool iconIsSvg;
  final String? svgUrl;
  final double svgSize;

  @override
  Widget build(BuildContext context) {
    return _ForestFloatingButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      buttonType: _ForestFloatingButtonLightOutline(
        labelColor: labelColor ?? ForestColorsOld.colorWood0,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height,
        borderWidth: borderWidth,
        buttonColor: buttonColor,
        isLoading: isLoading,
        isDisabled: isDisabled,
        width: width,
        showIcon: showIcon,
        svgSize: svgSize,
        svgUrl: svgUrl,
        iconIsSvg: iconIsSvg,
      ),
    );
  }
}
