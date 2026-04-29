part of '../button.dart';

class _ForestButtonPrimaryOutline extends ForestButtonInterface {
  _ForestButtonPrimaryOutline({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.borderColor,
    super.isDisabled,
    double? height,
    double? borderWidth,
    super.icon,
    super.iconColor = null,
    super.showIcon,
    super.isExpanded,
    super.iconIsSvg = true,
    super.svgUrl,
    super.svgSize,
    super.svgColor,
    Color? buttonColor,
  }) : super(
          buttonColor: Colors.transparent,
          height: 48,
          borderWidth: 1,
          iconSize: 14,
        );
}

class ForestButtonPrimaryOutline extends StatelessWidget {
  const ForestButtonPrimaryOutline({
    required this.label,
    required this.onTap,
    super.key,
    this.borderColor = ForestColorsOld.colorForest900,
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
    this.loadingColor,
    this.buttonColor = ForestColorsOld.colorWood0,
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
  final Color borderColor;
  final Color? iconColor;
  final bool isExpanded;
  final bool iconIsSvg;
  final String? svgUrl;
  final double svgSize;
  final Color? svgColor;
  final EdgeInsets? paddingInsets;
  final Color? loadingColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return _ForestButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      borderRadiusGeometry: borderRadius,
      loadingColor: loadingColor,
      buttonType: _ForestButtonPrimaryOutline(
        labelColor: labelColor ?? ForestColorsOld.colorForest800,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height,
        borderWidth: borderWidth,
        isLoading: isLoading,
        isDisabled: isDisabled,
        icon: icon,
        showIcon: showIcon,
        borderColor: borderColor,
        iconColor: iconColor,
        isExpanded: isExpanded,
        svgSize: svgSize,
        svgUrl: svgUrl,
        iconIsSvg: iconIsSvg,
        svgColor: svgColor,
        buttonColor: buttonColor,
      ),
    );
  }
}
