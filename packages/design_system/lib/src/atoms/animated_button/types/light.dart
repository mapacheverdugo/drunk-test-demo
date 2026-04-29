part of '../animated_button.dart';

class _ForestAnimatedButtonLight extends ForestAnimatedButtonInterface {
  _ForestAnimatedButtonLight({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    required Duration duration,
    required super.depth,
    super.height,
    double? borderWidth,
    bool iconIsSvg = true,
    super.svgUrl,
    super.svgSize,
    super.svgColor,
    super.showIcon,
  }) : super(
          buttonColor: ForestColorsOld.colorWood0,
          borderWidth: 2,
          duration: const Duration(milliseconds: 300),
          borderColor: Colors.black,
        );
}

class ForestAnimatedButtonLight extends StatelessWidget {
  const ForestAnimatedButtonLight({
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
    this.svgColor,
    this.svgSize = 9,
    this.loadingColor = ForestColorsOld.colorWood0,
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
  final Color loadingColor;
  final bool iconIsSvg;
  final String? svgUrl;
  final double svgSize;
  final Color? svgColor;

  @override
  Widget build(BuildContext context) {
    return _ForestAnimatedButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      borderRadiusGeometry: borderRadius,
      loadingColor: loadingColor,
      buttonColor: ForestColorsOld.colorWood0,
      buttonType: _ForestAnimatedButtonLight(
        labelColor: labelColor ?? ForestColorsOld.colorForest900,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height ?? 60,
        borderWidth: borderWidth,
        isLoading: isLoading,
        showIcon: showIcon,
        duration: duration,
        depth: depth,
        iconIsSvg: iconIsSvg,
        svgUrl: svgUrl,
        svgSize: svgSize,
        svgColor: svgColor,
      ),
    );
  }
}
