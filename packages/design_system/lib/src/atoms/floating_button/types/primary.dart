part of '../floating_button.dart';

class _ForestFloatingButtonPrimary extends ForestFloatingButtonInterface {
  _ForestFloatingButtonPrimary({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.isDisabled,
    double? height,
    double? borderWidth,
    super.showIcon,
    super.iconIsSvg = true,
    super.svgUrl,
    super.svgSize,
    super.svgColor,
  }) : super(
          buttonColor: ForestColorsOld.colorForest500,
          iconColor: ForestColorsOld.colorWood0,
          borderColor: ForestColorsOld.colorForest900,
          height: 48,
          width: 48,
          borderWidth: 1.5,
          iconSize: 15,
        );
}

class ForestFloatingButtonPrimary extends StatelessWidget {
  const ForestFloatingButtonPrimary({
    required this.onTap,
    super.key,
    this.label,
    this.buttonSize = OldForestButtonSize.bodyM,
    this.labelColor,
    this.labelFontWeight,
    this.borderRadius,
    this.isLoading = false,
    this.height,
    this.borderWidth,
    this.isDisabled = false,
    this.showIcon = false,
    this.svgSize = 9,
    this.iconIsSvg = true,
    this.svgUrl,
    this.svgColor,
  });

  final String? label;
  final VoidCallback? onTap;
  final ButtonSize buttonSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;
  final double? height;
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
      buttonType: _ForestFloatingButtonPrimary(
        labelColor: labelColor ?? ForestColorsOld.colorWood0,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height,
        borderWidth: borderWidth,
        svgColor: svgColor,
        isLoading: isLoading,
        isDisabled: isDisabled,
        showIcon: showIcon,
        svgSize: svgSize,
        svgUrl: svgUrl,
        iconIsSvg: iconIsSvg,
      ),
    );
  }
}
