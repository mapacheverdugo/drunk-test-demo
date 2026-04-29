part of '../button.dart';

class _ForestButtonPrimary extends ForestButtonInterface {
  _ForestButtonPrimary({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.isDisabled,
    super.height = null,
    bool isExpanded = true,
    double? borderWidth,
    super.icon,
    super.showIcon,
  }) : super(
          buttonColor: ForestColorsOld.colorForest500,
          borderWidth: 1.5,
        );
}

class ForestButtonPrimary extends StatelessWidget {
  const ForestButtonPrimary({
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
    this.isExpanded = true,
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
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return _ForestButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      borderRadiusGeometry: borderRadius,
      buttonType: _ForestButtonPrimary(
        labelColor: labelColor ?? ForestColorsOld.colorWood0,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height ?? 48,
        borderWidth: borderWidth,
        isLoading: isLoading,
        isDisabled: isDisabled,
        icon: icon,
        showIcon: showIcon,
        isExpanded: isExpanded,
      ),
    );
  }
}
