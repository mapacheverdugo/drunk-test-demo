import 'package:design_system/src/foundations/button/button_size.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:flutter/material.dart';

class ForestFloatingButtonInterface {
  ForestFloatingButtonInterface({
    required this.buttonColor,
    required this.labelColor,
    this.depth = 4,
    this.labelFontWeight,
    this.showIcon = false,
    this.hasBorder = false,
    this.borderColor = ForestColorsOld.colorForest900,
    this.iconColor = ForestColorsOld.colorWood0,
    this.iconSize = 9,
    this.iconIsSvg = false,
    this.svgUrl,
    this.svgSize = 9,
    this.svgColor,
    this.showIconAtRight = false,
    this.showShadow = false,
    this.iconMargin = 12,
    this.buttonSize = OldForestButtonSize.bodySBold,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.buttonBorderRadius = 999,
    this.height = 48,
    this.width = 48,
    this.borderWidth = 1.5,
    this.isLoading = false,
    this.isDisabled = false,
  });

  Color buttonColor;
  Color labelColor;
  bool isLoading;
  bool isDisabled;
  final double depth;
  final FontWeight? labelFontWeight;
  final bool showIcon;
  final bool hasBorder;
  final Color borderColor;
  final Color? iconColor;
  final double iconSize;
  final bool iconIsSvg;
  final String? svgUrl;
  final double svgSize;
  final Color? svgColor;
  final bool showIconAtRight;
  final bool showShadow;
  final double iconMargin;
  final ButtonSize buttonSize;
  final double buttonBorderRadius;
  final double? height;
  final double? borderWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final double? width;
}
