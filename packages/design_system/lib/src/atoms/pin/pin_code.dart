import 'package:design_system/src/atoms/text/text.dart';
import 'package:design_system/src/foundations/borders/borders.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:design_system/src/foundations/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    required this.isValid,
    required this.onCompleted,
    required this.onChanged,
    super.key,
    this.labelText = '',
    this.messageText = '',
    this.showMessageIcon = true,
    this.controller,
  });

  final void Function(String)? onCompleted;
  final void Function(String)? onChanged;
  final String messageText;
  final bool showMessageIcon;
  final bool isValid;
  final String labelText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 43,
      height: 57,
      textStyle: const TextStyle(
        fontSize: ForestTypography.textBodyL,
        color: ForestColorsOld.colorWood900,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ForestColorsOld.colorWood900,
        ),
        borderRadius: BorderRadius.circular(
          ForestBorder.radiusS,
        ),
        color: ForestColorsOld.colorWood0,
      ),
    );

    final focusedPinTheme = PinTheme(
      width: 43,
      height: 57,
      textStyle: const TextStyle(
        fontSize: ForestTypography.textBodyL,
        color: ForestColorsOld.colorWood900,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ForestColorsOld.colorWood900,
        ),
        borderRadius: BorderRadius.circular(
          ForestBorder.radiusS,
        ),
        color: ForestColorsOld.colorWood0,
      ),
    );

    final errorPinTheme = PinTheme(
      width: 43,
      height: 57,
      textStyle: const TextStyle(
        fontSize: ForestTypography.textBodyL,
        color: ForestColorsOld.colorWood900,
        fontWeight: FontWeight.w400,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: ForestColorsOld.colorRowan500),
        borderRadius: BorderRadius.circular(
          ForestBorder.radiusS,
        ),
        color: ForestColorsOld.colorWood0,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText.isNotEmpty) ...[
          ForestText.textBodyM(
            label: labelText,
            color: ForestColorsOld.colorWood900,
          ),
          const SizedBox(height: ForestSpacing.spaceY1),
        ],
        Pinput(
          length: 6,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          errorPinTheme: errorPinTheme,
          separatorBuilder: (index) {
            return const SizedBox(width: ForestSpacing.spaceX2);
          },
          onCompleted: onCompleted,
          onChanged: onChanged,
          controller: controller,
          forceErrorState: !isValid && messageText.isNotEmpty,
        ),
        if (messageText.isNotEmpty) ...[
          const SizedBox(height: ForestSpacing.spaceY1),
          Row(
            children: [
              if (showMessageIcon) ...[
                if (isValid)
                  SvgPicture.asset(
                    'assets/src/svg/check.svg',
                    height: 7.5,
                    colorFilter: const ColorFilter.mode(
                      ForestColorsOld.colorForest500,
                      BlendMode.srcIn,
                    ),
                  )
                else
                  SvgPicture.asset(
                    'assets/src/svg/xmark.svg',
                    height: 7.5,
                    colorFilter: const ColorFilter.mode(
                      ForestColorsOld.colorRowan500,
                      BlendMode.srcIn,
                    ),
                  ),
                const SizedBox(width: ForestSpacing.spaceX1),
                Flexible(
                  child: ForestText.textBodyS(
                    label: messageText,
                    color: isValid
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
