part of '../button.dart';

class _ForestButtonLightOutline extends ForestButtonInterface {
  _ForestButtonLightOutline({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.borderColor = ForestColorsOld.colorWood50,
    super.isDisabled,
    super.height = null,
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
          buttonColor: Colors.transparent,
          borderWidth: 1,
          iconSize: 14,
        );
}

class ForestButtonLightOutline extends StatelessWidget {
  const ForestButtonLightOutline({
    required this.label,
    required this.onTap,
    super.key,
    this.borderColor = ForestColorsOld.colorWood50,
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
  final String? svgUrl;
  final double svgSize;
  final Color? svgColor;
  final bool iconIsSvg;
  final EdgeInsets? paddingInsets;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return _ForestButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      borderRadiusGeometry: borderRadius,
      loadingColor: loadingColor,
      buttonType: _ForestButtonLightOutline(
        labelColor: labelColor ?? ForestColorsOld.colorWood50,
        labelFontWeight: labelFontWeight ?? FontWeight.w700,
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
      ),
      paddingInsets: paddingInsets,
    );
  }
}
