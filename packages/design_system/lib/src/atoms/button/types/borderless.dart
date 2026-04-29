part of '../button.dart';

class _ForestButtonBorderless extends ForestButtonInterface {
  _ForestButtonBorderless({
    required super.labelColor,
    required super.labelFontWeight,
    required super.isLoading,
    super.isDisabled,
    double? height,
    double? borderWidth,
    super.icon,
    super.showIcon,
  }) : super(
          buttonColor: Colors.transparent,
          height: 48,
          borderWidth: 0,
          borderColor: Colors.transparent,
        );
}

class ForestButtonBorderless extends StatelessWidget {
  const ForestButtonBorderless({
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

  @override
  Widget build(BuildContext context) {
    return _ForestButtonGeneric(
      label: label,
      onTap: onTap,
      buttonSize: buttonSize,
      borderRadiusGeometry: borderRadius,
      buttonType: _ForestButtonBorderless(
        labelColor: labelColor ?? ForestColorsOld.colorWood0,
        labelFontWeight: labelFontWeight ?? FontWeight.w500,
        height: height,
        borderWidth: borderWidth,
        isLoading: isLoading,
        isDisabled: isDisabled,
        icon: icon,
        showIcon: showIcon,
      ),
    );
  }
}
