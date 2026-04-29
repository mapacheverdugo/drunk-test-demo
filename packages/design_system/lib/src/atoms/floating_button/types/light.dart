part of '../floating_button.dart';

class _ForestFloatingButtonLight extends ForestFloatingButtonInterface {
  _ForestFloatingButtonLight({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.buttonColor = ForestColorsOld.colorWood0,
    super.isDisabled,
    super.height = null,
    super.width = null,
    double? borderWidth,
    super.showIcon,
    super.iconIsSvg = true,
    super.svgUrl,
    super.svgSize,
    super.svgColor,
  }) : super(
          iconColor: ForestColorsOld.colorForest900,
          borderColor: ForestColorsOld.colorForest900,
          borderWidth: 1.5,
          iconSize: 15,
        );
}

class ForestFloatingButtonLight extends StatelessWidget {
  const ForestFloatingButtonLight({
    required this.onTap,
    super.key,
    this.buttonColor = ForestColorsOld.colorWood0,
    this.icon,
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
    this.svgColor,
  });

  final IconData? icon;
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
  final Color? svgColor;

  @override
  Widget build(BuildContext context) {
    return _ForestFloatingButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      buttonType: _ForestFloatingButtonLight(
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
        svgColor: svgColor,
      ),
    );
  }
}
