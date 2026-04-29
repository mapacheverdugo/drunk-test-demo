import 'package:design_system/src/atoms/input/field.dart';
import 'package:design_system/src/atoms/text/text.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ForestTextField extends StatefulWidget {
  const ForestTextField({
    required this.isValid,
    super.key,
    this.textEditingController,
    this.labelText = '',
    this.labelSuffixText = '',
    this.showMessageIcon = true,
    this.messageText = '',
    this.hintText,
    this.initialValue,
    this.keyboardType = TextInputType.text,
    this.textInputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.maxLength,
    this.hintMaxLines,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
    this.minLines,
    this.onTap,
    this.readOnly = false,
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.isPasswordType = false,
    this.labelTextColor = ForestColorsOld.colorWood900,
    this.initialFocus = false,
    this.textInputAction,
    this.autofillHints,
    this.svgAsset,
    this.svgColor = ForestColorsOld.colorWood900,
    this.enabled = true,
    this.inputTextStyle,
  });

  final bool isValid;
  final String labelText;
  final String labelSuffixText;
  final bool showMessageIcon;
  final String messageText;

  /// Parameters used on Field.
  final TextEditingController? textEditingController;
  final String? hintText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? textInputFormatters;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final String? initialValue;
  final int? maxLength;
  final int? hintMaxLines;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? minLines;
  final VoidCallback? onTap;
  final bool readOnly;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final bool isPasswordType;
  final Color? labelTextColor;
  final bool initialFocus;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final String? svgAsset;
  final Color svgColor;
  final bool enabled;
  final TextStyle? inputTextStyle;

  @override
  State<ForestTextField> createState() => _ForestTextFieldState();
}

class _ForestTextFieldState extends State<ForestTextField> {
  bool isVisiblePassword = false;
  bool obscureText = false;

  void _onToggleVisiblePassword() {
    if (mounted) {
      setState(() {
        isVisiblePassword = !isVisiblePassword;
        obscureText = !obscureText;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    if (widget.isPasswordType) {
      obscureText = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          Row(
            mainAxisAlignment: (widget.labelSuffixText.isNotEmpty)
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            children: [
              ForestText.textBodyM(
                label: widget.labelText,
                color: widget.labelTextColor,
              ),
              if (widget.labelSuffixText.isNotEmpty)
                ForestText.textBodyS(
                  label: widget.labelSuffixText,
                  color: ForestColorsOld.colorWood700,
                ),
            ],
          ),
          const SizedBox(height: ForestSpacing.spaceY1),
        ],
        ForestField(
          key: widget.key,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          hintText: widget.hintText,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          initialValue: widget.initialValue,
          controller: widget.textEditingController,
          autofillHints: widget.autofillHints,
          inputTextStyle: widget.inputTextStyle,
          textAlignVertical: TextAlignVertical.center,
          readOnly: widget.readOnly,
          textCapitalization: widget.textCapitalization,
          contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 14),
          filled: true,
          fillColor: ForestColorsOld.colorWood0,
          onTap: () {
            if (widget.readOnly) {
              widget.onTap?.call();
            }
          },
          suffixIcon: widget.isPasswordType
              ? !isVisiblePassword
                  ? GestureDetector(
                      onTap: _onToggleVisiblePassword,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: ForestSpacing.spaceX2,
                        ),
                        child: SvgPicture.asset(
                          'assets/src/svg/eye_slash.svg',
                          colorFilter: const ColorFilter.mode(
                            ForestColorsOld.colorWood900,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: _onToggleVisiblePassword,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: ForestSpacing.spaceX2,
                        ),
                        child: SvgPicture.asset(
                          'assets/src/svg/eye.svg',
                          colorFilter: const ColorFilter.mode(
                            ForestColorsOld.colorWood900,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
              : widget.suffixIcon,
          obscureText: obscureText,
          keyboardType: widget.keyboardType,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xff002A24),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xff002A24),
            ),
          ),
        ),
        if (widget.messageText.isNotEmpty) ...[
          const SizedBox(height: ForestSpacing.spaceY1),
          Row(
            children: [
              if (widget.showMessageIcon) ...[
                if (widget.isValid)
                  SvgPicture.asset(
                    'assets/src/svg/check.svg',
                    colorFilter: const ColorFilter.mode(
                      ForestColorsOld.colorForest500,
                      BlendMode.srcIn,
                    ),
                  )
                else
                  SvgPicture.asset(
                    'assets/src/svg/xmark.svg',
                    colorFilter: const ColorFilter.mode(
                      ForestColorsOld.colorRowan500,
                      BlendMode.srcIn,
                    ),
                  ),
                const SizedBox(width: ForestSpacing.spaceX1),
                Flexible(
                  child: ForestText.textBodyS(
                    label: widget.messageText,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    color: (widget.isValid)
                        ? ForestColorsOld.colorForest700
                        : ForestColorsOld.colorRowan700,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
