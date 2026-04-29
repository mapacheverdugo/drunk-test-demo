part of '../animated_button.dart';

class _ForestAnimatedButtonPrimary extends ForestAnimatedButtonInterface {
  _ForestAnimatedButtonPrimary({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    required super.depth,
    super.height,
    super.showIcon,
    super.iconIsSvg,
    super.svgUrl,
    super.svgSize,
    super.fontFamily = ForestTypography.gt,
    super.buttonColor = ForestColorsOld.colorForest500,
  }) : super(
          borderWidth: 2,
          duration: const Duration(milliseconds: 300),
          borderColor: Colors.black,
        );
}

class ForestAnimatedButtonPrimary extends StatelessWidget {
  const ForestAnimatedButtonPrimary({
    required this.label,
    required this.onTap,
    super.key,
    this.duration = const Duration(milliseconds: 300),
    this.depth = 4,
    this.buttonSize = OldForestButtonSize.bodyM,
    this.labelColor,
    this.labelFontWeight,
    this.borderRadius,
    this.isLoading = false,
    this.height,
    this.borderWidth,
    this.showIcon = false,
    this.iconIsSvg = true,
    this.svgUrl,
    this.svgSize = 9,
    this.loadingColor = ForestColorsOld.colorWood0,
    this.isExpanded = true,
    this.labelPadding,
    this.fontFamily = ForestTypography.gt,
    this.buttonColor = ForestColorsOld.colorForest500,
  });

  final String label;
  final VoidCallback? onTap;
  final ButtonSize buttonSize;
  final Color? labelColor;
  final FontWeight? labelFontWeight;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;
  final double? height;
  final double? borderWidth;
  final bool showIcon;
  final Duration duration;
  final double depth;
  final bool iconIsSvg;
  final String? svgUrl;
  final double svgSize;
  final Color loadingColor;
  final bool isExpanded;
  final EdgeInsets? labelPadding;
  final String fontFamily;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return _ForestAnimatedButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      borderRadiusGeometry: borderRadius,
      loadingColor: loadingColor,
      isExpanded: isExpanded,
      labelPadding: labelPadding,
      fontFamily: fontFamily,
      buttonColor: buttonColor,
      buttonType: _ForestAnimatedButtonPrimary(
        labelColor: labelColor ?? ForestColorsOld.colorWood0,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height ?? 60,
        isLoading: isLoading,
        showIcon: showIcon,
        iconIsSvg: iconIsSvg,
        svgUrl: svgUrl,
        depth: depth,
        svgSize: svgSize,
        fontFamily: fontFamily,
      ),
    );
  }
}
