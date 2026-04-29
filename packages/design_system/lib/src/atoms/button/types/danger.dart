part of '../button.dart';

class _ForestButtonDanger extends ForestButtonInterface {
  _ForestButtonDanger({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.isDisabled,
    super.height = null,
    double? borderWidth,
    super.icon,
    super.iconColor = null,
    super.showIcon,
    super.isExpanded,
    super.iconIsSvg = true,
    super.svgUrl,
    super.svgSize,
    super.svgColor,
    Color buttonColor = ForestColorsOld.colorRowan500,
  }) : super(
          buttonColor: ForestColorsOld.colorRowan500,
          borderWidth: 1.5,
          iconSize: 14,
        );
}

class ForestButtonDanger extends StatelessWidget {
  const ForestButtonDanger({
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
    this.borderColor = ForestColorsOld.colorRowan900,
    this.iconColor,
    this.showIcon = false,
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
  final Color? iconColor;
  final bool showIcon;
  final Color borderColor;
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
      buttonType: _ForestButtonDanger(
        labelColor: labelColor ?? ForestColorsOld.colorWood0,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height ?? 48,
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
        buttonColor: buttonColor,
      ),
    );
  }
}
