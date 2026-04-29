import 'package:design_system/src/foundations/button/button_size.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:flutter/material.dart';

enum AlertType {
  success,
  info,
  warning,
  error,
  secondary,
  normal,
}

class ForestAlertInterface {
  ForestAlertInterface({
    required this.alertColor,
    required this.titleColor,
    required this.alertType,
    this.subtitleColor,
    this.titleFontWeight,
    this.subtitleFontWeight,
    this.showIcon = true,
    this.showButtonIcon = false,
    this.labelButton,
    this.labelButtonColor,
    this.hasBorder = false,
    this.borderColor = ForestColorsOld.colorForest900,
    this.iconColor = ForestColorsOld.colorWood0,
    this.iconSize = 9,
    this.iconIsSvg = false,
    this.svgUrl = '',
    this.svgSize = 9,
    this.svgColor,
    this.showIconAtRight = false,
    this.showShadow = false,
    this.iconMargin = 8,
    this.buttonSize = OldForestButtonSize.bodySBold,
    this.buttonBorderRadius = 25.0,
    this.height = 48,
    this.borderWidth = 1,
    this.isLoading = false,
    this.isDisabled = false,
    this.isExpanded = true,
    this.borderRadius = 8,
    this.padding = 16,
    this.buttonCounter = 0,
    this.hasButton = false,
    this.bottomBorderWidth = 0,
    this.showXMark = false,
  });

  Color alertColor;
  Color titleColor;
  Color? subtitleColor;
  bool isLoading;
  bool isDisabled;
  final Color? labelButtonColor;
  final String? labelButton;
  final AlertType alertType;
  final FontWeight? titleFontWeight;
  final FontWeight? subtitleFontWeight;
  final bool showIcon;
  final bool showButtonIcon;
  final bool hasBorder;
  final Color borderColor;
  final Color? iconColor;
  final double iconSize;
  final bool iconIsSvg;
  final String svgUrl;
  final double svgSize;
  final Color? svgColor;
  final bool showIconAtRight;
  final bool showShadow;
  final double iconMargin;
  final ButtonSize buttonSize;
  final double buttonBorderRadius;
  final double? height;
  final double borderWidth;
  final bool isExpanded;
  final double borderRadius;
  final double padding;
  final bool hasButton;
  final int buttonCounter;
  final double bottomBorderWidth;
  final bool showXMark;
}
