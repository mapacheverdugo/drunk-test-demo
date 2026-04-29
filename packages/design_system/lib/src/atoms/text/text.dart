import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ForestText {
  ForestText._();

  /// [Widget] - FontSize 64 - textHeadingXL
  static Widget textHeadingXXL({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textHeadingXXL,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 48 - textHeadingXML
  static Widget textHeadingXML({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textHeadingXML,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 40 - textHeadingXL
  static Widget textHeadingXL({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textHeadingXL,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
      );

  /// [Widget] - FontSize 28 - textHeadingL
  static Widget textHeadingL({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
    double? height,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textHeadingL,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
        height: height,
      );

  /// [Widget] - FontSize 24 - textHeadingM
  static Widget textHeadingM({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
    double? height,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textHeadingM,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
        height: height,
      );

  /// [Widget] - FontSize 22 - textHeadingS
  static Widget textHeadingS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textHeadingS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 20 - textHeadingXS
  static Widget textHeadingXS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
    double? height,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textHeadingXS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
        height: height,
      );

  /// [Widget] - FontSize 18 - textBodyLBold
  static Widget textBodyLBold({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
    double? height,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyLBold,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
        height: height,
      );

  /// [Widget] - FontSize 18 - textBodyL
  static Widget textBodyL({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyL,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 16 - textBodyMBold
  static Widget textBodyMBold({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    List<FontFeature>? fontFeature,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyMBold,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFeature: fontFeature,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 16 - textBodyM
  static Widget textBodyM({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    double? height,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyM,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
        height: height,
      );

  /// [Widget] - FontSize 16 - textBodyM
  static Widget textBodyMMohr({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.mohr,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyM,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 14 - textBodySBold
  static Widget textBodySBold({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    FontStyle fontStyle = FontStyle.normal,
    String? fontFamily = ForestTypography.gt,
    double? height,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodySBold,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: fontStyle,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        letterSpacing: letterSpacing,
        textOverflow: textOverflow,
        maxLines: maxLines,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
        height: height,
      );

  /// [Widget] - FontSize 14 - textBodyM
  static Widget textBodySMohr({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.mohr,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 14 - textBodyS
  static Widget textBodyS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    double? height,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        height: height,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 12 - textBodyXSBold
  static Widget textBodyXSBold({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    FontStyle? fontStyle,
    String? fontFamily = ForestTypography.gt,
    double? height,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyXSBold,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
        height: height,
      );

  /// [Widget] - FontSize 12 - textBodyXS
  static Widget textBodyXS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
    double? height,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyXS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
        height: height,
      );

  /// [Widget] - FontSize 10 - textBodyXXS
  static Widget textBodyXXS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textBodyXXS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 18 - textlinkL
  static Widget textlinkL({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textlinkL,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 16 - textlinkL
  static Widget textlinkM({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textlinkM,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 14 - textlinkS
  static Widget textlinkS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textlinkS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 12 - textlinkXS
  static Widget textlinkXS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textlinkXS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 18 - textButtonL
  static Widget textButtonL({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textButtonL,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 16 - textButtonM
  static Widget textButtonM({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textButtonM,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 14 - textButtonS
  static Widget textButtonS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textButtonS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 16 - textInputMBold
  static Widget textInputMBold({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textInputMBold,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 16 - textInputM
  static Widget textInputM({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textInputM,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 14 - textInputSBold
  static Widget textInputSBold({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textInputSBold,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w700,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  /// [Widget] - FontSize 14 - textInputS
  static Widget textInputS({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
    TextDecoration? textDecoration,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: ForestTypography.textInputS,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        maxLines: maxLines,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        fontFamily: fontFamily,
      );

  static Widget textCustomSize({
    required String label,
    required double fontSize,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
    TextDecoration? textDecoration,
    double? height,
    String? fontFamily = ForestTypography.gt,
  }) =>
      _TextGeneric(
        key: key,
        label: label,
        fontSize: fontSize,
        color: color ?? ForestDs.colors.colorText,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.w400,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
        maxLines: maxLines,
        textDecoration: textDecoration,
        height: height,
        fontFamily: fontFamily,
      );

  static TextStyle style({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    TextDecoration? textDecoration,
    double? height,
    String? fontFamily = ForestTypography.gt,
    List<FontFeature>? fontFeatures,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
        decoration: textDecoration,
        decorationColor: color,
        height: height,
        fontFeatures: fontFeatures,
      );
}

class _TextGeneric extends StatelessWidget {
  const _TextGeneric({
    required this.label,
    required this.fontSize,
    super.key,
    this.color,
    this.fontStyle,
    this.fontWeight,
    this.textOverflow,
    this.textAlign,
    this.letterSpacing,
    this.maxLines,
    this.textDecoration,
    this.height,
    this.fontFamily = ForestTypography.gt,
    this.fontFeature,
  });

  final String label;
  final double fontSize;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final double? height;
  final String? fontFamily;
  final List<FontFeature>? fontFeature;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: ForestText.style(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
        textDecoration: textDecoration,
        height: height,
        fontFamily: fontFamily,
        fontFeatures: fontFeature,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
