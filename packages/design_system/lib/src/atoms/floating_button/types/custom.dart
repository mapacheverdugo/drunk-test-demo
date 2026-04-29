part of '../floating_button.dart';

class _ForestFloatingButtonCustom extends ForestFloatingButtonInterface {
  _ForestFloatingButtonCustom({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    required super.buttonColor,
    required Color super.iconColor,
    required super.borderColor,
    super.isDisabled,
    super.height = null,
    super.borderWidth = null,
    super.showIcon,
    super.iconIsSvg = true,
    super.svgUrl,
    super.svgSize,
    super.svgColor,
  }) : super(
          iconSize: 15,
        );
}

class ForestFloatingButtonCustom extends StatelessWidget {
  const ForestFloatingButtonCustom({
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
    this.borderColor = ForestColorsOld.colorWood0,
    this.buttonColor = ForestColorsOld.colorWood0,
    this.iconColor = ForestColorsOld.colorWood0,
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
  final Color borderColor;
  final Color iconColor;
  final Color buttonColor;
  final Color? svgColor;

  @override
  Widget build(BuildContext context) {
    return _ForestFloatingButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      buttonType: _ForestFloatingButtonCustom(
        borderColor: borderColor,
        iconColor: iconColor,
        buttonColor: buttonColor,
        labelColor: labelColor ?? ForestColorsOld.colorWood0,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height,
        borderWidth: borderWidth,
        isLoading: isLoading,
        isDisabled: isDisabled,
        showIcon: showIcon,
        svgSize: svgSize,
        svgUrl: svgUrl,
        iconIsSvg: iconIsSvg,
        svgColor: svgColor,
      ),
    );
  }
}
