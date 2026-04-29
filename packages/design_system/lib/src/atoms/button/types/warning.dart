part of '../button.dart';

class _ForestButtonWarning extends ForestButtonInterface {
  _ForestButtonWarning({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.isDisabled,
    double? height,
    double? borderWidth,
    super.icon,
    super.iconColor = null,
    super.showIcon,
    super.isExpanded,
    bool iconIsSvg = true,
    super.svgUrl,
    super.svgSize,
    super.svgColor,
  }) : super(
          buttonColor: ForestColorsOld.colorCassia500,
          height: 48,
          borderWidth: 1.5,
        );
}

class ForestButtonWarning extends StatelessWidget {
  const ForestButtonWarning({
    required this.label,
    required this.onTap,
    super.key,
    this.buttonSize = OldForestButtonSize.bodyM,
    this.labelColor,
    this.labelFontWeight,
    this.borderRadius,
    this.isLoading = false,
    this.height,
    this.borderWidth,
    this.isDisabled = false,
    this.icon,
    this.showIcon = false,
    this.iconColor,
    this.isExpanded = true,
    this.svgSize = 9,
    this.iconIsSvg = true,
    this.svgUrl,
    this.svgColor,
    this.paddingInsets,
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
  final bool isDisabled;
  final String? icon;
  final bool showIcon;
  final Color? iconColor;
  final bool isExpanded;
  final String? svgUrl;
  final double svgSize;
  final Color? svgColor;
  final bool iconIsSvg;
  final EdgeInsets? paddingInsets;

  @override
  Widget build(BuildContext context) {
    return _ForestButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      borderRadiusGeometry: borderRadius,
      buttonType: _ForestButtonWarning(
        labelColor: labelColor ?? ForestColorsOld.colorWood0,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height,
        borderWidth: borderWidth,
        isLoading: isLoading,
        isDisabled: isDisabled,
        icon: icon,
        showIcon: showIcon,
        iconColor: iconColor,
        isExpanded: isExpanded,
        svgSize: svgSize,
        svgUrl: svgUrl,
        iconIsSvg: iconIsSvg,
        svgColor: svgColor,
      ),
    );
  }
}
