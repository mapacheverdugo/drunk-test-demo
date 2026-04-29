import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForestPhoneInput extends StatefulWidget {
  const ForestPhoneInput({
    required this.onUnFocus,
    required this.onInputChanged,
    required this.isValid,
    required this.phoneNumberUtil,
    super.key,
    this.showMessageIcon = true,
    this.labelText = '',
    this.messageText = '',
    this.textFieldController,
    this.autoFocus = false,
    this.errorIconSize = 7.5,
  });

  final String labelText;
  final void Function() onUnFocus;
  final ValueChanged<PhoneNumber> onInputChanged;
  final String messageText;
  final bool showMessageIcon;
  final bool isValid;
  final TextEditingController? textFieldController;
  final bool autoFocus;
  final double errorIconSize;
  final PhoneNumberUtil phoneNumberUtil;

  @override
  State<ForestPhoneInput> createState() => _ForestPhoneInputState();
}

class _ForestPhoneInputState extends State<ForestPhoneInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText.isNotEmpty) ...[
          ForestText.textBodyM(
            label: widget.labelText,
            color: ForestColorsOld.colorWood900,
          ),
          const SizedBox(height: ForestSpacing.spaceY1),
        ],
        InternationalPhoneNumberInput(
          fieldKey: const ValueKey('phone'),
          selectorConfig: const SelectorConfig(
            setSelectorButtonAsPrefixIcon: true,
            selectorType: PhoneInputSelectorType.dialog,
            useEmoji: true,
            trailingSpace: false,
          ),
          phoneNumberUtil: widget.phoneNumberUtil,
          autoFocus: widget.autoFocus,
          inputDecoration: InputDecoration(
            filled: true,
            hintText: '175 369 328',
            contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 14),
            fillColor: ForestColorsOld.colorWood0,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff002A24)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xff002A24)),
            ),
          ),
          onTap: () {},
          onInputChanged: widget.onInputChanged,
        ),
        if (widget.messageText.isNotEmpty) ...[
          const SizedBox(height: ForestSpacing.spaceY1),
          Row(
            children: [
              if (widget.showMessageIcon) ...[
                if (widget.isValid)
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
                    height: widget.errorIconSize,
                    colorFilter: const ColorFilter.mode(
                      ForestColors.mappleRed,
                      BlendMode.srcIn,
                    ),
                  ),
                const SizedBox(width: ForestSpacing.spaceX1),
                Flexible(
                  child: ForestText.textBodyS(
                    label: widget.messageText,
                    color: (widget.isValid)
                        ? ForestColorsOld.colorForest700
                        : ForestColors.mappleRed,
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
