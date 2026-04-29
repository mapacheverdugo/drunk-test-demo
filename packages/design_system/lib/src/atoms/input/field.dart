import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForestField extends StatelessWidget {
  const ForestField({
    required this.onTap,
    super.key,
    this.controller,
    this.hintText,
    this.initialValue,
    this.isDense = true,
    this.keyboardType = TextInputType.text,
    this.textInputFormatters,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.contentPadding,
    this.onChanged,
    this.maxLines = 1,
    this.hintMaxLines = 1,
    this.readOnly = false,
    this.inputTextStyle,
    this.hintTextStyle,
    this.labelTextStyle,
    this.borderRadius,
    this.maxLength,
    this.minLines = 1,
    this.textAlign,
    this.counterText = '',
    this.fillColor,
    this.filled,
    this.enabled = true,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.textAlignVertical,
    this.disabledBorder,
    this.errorBorder,
    this.errorStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.alignLabelWithHint = false,
    this.focusedErrorBorder,
    this.scrollPadding = const EdgeInsets.all(20),
    this.onEditingComplete,
    this.obscureText = false,
    this.inputDecoration,
    this.textInputAction,
    this.autofillHints,
  });
  final TextEditingController? controller;
  final String? hintText;
  final String? initialValue;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? textInputFormatters;
  final bool autofocus;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode autovalidateMode;
  final EdgeInsets? contentPadding;
  final void Function(String)? onChanged;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final BorderRadius? borderRadius;
  final int? maxLength;
  final int? hintMaxLines;
  final TextAlign? textAlign;
  final String? counterText;
  final Color? fillColor;
  final bool? filled;
  final bool enabled;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final void Function() onTap;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final TextAlignVertical? textAlignVertical;
  final InputBorder? disabledBorder;
  final TextStyle? errorStyle;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final bool isDense;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool? alignLabelWithHint;
  final EdgeInsets scrollPadding;
  final bool obscureText;
  final InputDecoration? inputDecoration;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      initialValue: initialValue,
      controller: controller,
      keyboardType: keyboardType,
      autofocus: autofocus,
      textCapitalization: textCapitalization,
      focusNode: focusNode,
      enabled: enabled,
      textAlignVertical: textAlignVertical,
      inputFormatters: textInputFormatters,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      autovalidateMode: autovalidateMode,
      obscureText: obscureText,
      style: inputTextStyle ??
          const TextStyle(
            color: ForestColorsOld.colorWood900,
            fontSize: ForestTypography.textBodyM,
            fontFamily: ForestTypography.gt,
            fontWeight: FontWeight.w400,
          ),
      onChanged: onChanged,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      textInputAction: textInputAction,
      readOnly: readOnly,
      scrollPadding: scrollPadding,
      cursorColor: ForestColorsOld.colorForest400,
      autofillHints: autofillHints,
      decoration: inputDecoration ??
          InputDecoration(
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                suffixIcon ?? const SizedBox.shrink(),
              ],
            ),
            alignLabelWithHint: alignLabelWithHint,
            isDense: isDense,
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            contentPadding: contentPadding,
            counterText: counterText,
            filled: filled,
            fillColor: fillColor,
            hintText: hintText,
            hintMaxLines: hintMaxLines,
            hintStyle: hintTextStyle ??
                const TextStyle(
                  color: ForestColorsOld.colorWood300,
                  fontSize: ForestTypography.textBodyM,
                  fontFamily: ForestTypography.gt,
                  fontWeight: FontWeight.w400,
                ),
            border: InputBorder.none,
            focusedBorder: focusedBorder,
            enabledBorder: enabledBorder,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            labelStyle: labelTextStyle ??
                const TextStyle(
                  color: ForestColorsOld.colorWood900,
                  fontSize: ForestTypography.textBodyM,
                  fontFamily: ForestTypography.gt,
                  fontWeight: FontWeight.w400,
                ),
            errorStyle: errorStyle,
          ),
    );
  }
}
