part of '../floating_animated_button.dart';

class _ForestFloatingAnimatedButtonLight
    extends ForestFloatingAnimatedButtonInterface {
  _ForestFloatingAnimatedButtonLight({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    required Duration duration,
    required super.depth,
    super.svgUrl,
    double? height,
    double? borderWidth,
    super.showIcon,
    super.iconIsSvg,
    super.svgColor,
    super.svgSize = 10,
  }) : super(
          buttonColor: ForestColorsOld.colorWood0,
          height: 60,
          borderWidth: 2,
          duration: const Duration(milliseconds: 300),
          borderColor: Colors.black,
        );
}

class ForestFloatingAnimatedButtonLight extends StatelessWidget {
  const ForestFloatingAnimatedButtonLight({
    required this.onTap,
    super.key,
    this.label = '',
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
    this.iconIsSvg = false,
    this.svgUrl,
    this.svgColor,
    this.svgSize = 10,
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
  final Color? svgColor;
  final double svgSize;

  @override
  Widget build(BuildContext context) {
    return _ForestFloatingAnimatedButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      borderRadiusGeometry: borderRadius,
      buttonType: _ForestFloatingAnimatedButtonLight(
        labelColor: labelColor ?? ForestColorsOld.colorForest900,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height,
        borderWidth: borderWidth,
        isLoading: isLoading,
        showIcon: showIcon,
        duration: duration,
        depth: depth,
        iconIsSvg: iconIsSvg,
        svgUrl: svgUrl,
        svgColor: svgColor,
        svgSize: svgSize,
      ),
    );
  }
}
