import 'package:design_system/src/atoms/intl_phone_number_input/models/country_model.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/util.dart';
import 'package:design_system/src/atoms/text/text.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
    this.country,
    this.showFlag,
    this.useEmoji,
    this.textStyle,
    this.withCountryNames = false,
    this.leadingPadding = 12,
    this.trailingSpace = true,
  });
  final Country? country;
  final bool? showFlag;
  final bool? useEmoji;
  final TextStyle? textStyle;
  final bool withCountryNames;
  final double? leadingPadding;
  final bool trailingSpace;

  @override
  Widget build(BuildContext context) {
    var dialCode = country?.dialCode ?? '';
    if (trailingSpace) {
      dialCode = dialCode.padRight(5, '   ');
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(width: ForestSpacing.spaceX2),
        _Flag(
          country: country,
          showFlag: showFlag,
          useEmoji: useEmoji,
        ),
        const SizedBox(width: ForestSpacing.spaceX1),
        ForestText.textBodyM(
          label: dialCode,
          color: ForestColorsOld.colorWood900,
        ),
        const SizedBox(width: ForestSpacing.spaceX1),
        SvgPicture.asset(
          'assets/src/svg/chevron_down.svg',
          height: 10,
          colorFilter: const ColorFilter.mode(
            ForestColorsOld.colorWood900,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: ForestSpacing.spaceX1),
        Container(
          width: 1,
          height: 24,
          color: ForestColorsOld.colorWood300,
        ),
      ],
    );
  }
}

class _Flag extends StatelessWidget {
  const _Flag({this.country, this.showFlag, this.useEmoji});

  final Country? country;
  final bool? showFlag;
  final bool? useEmoji;

  @override
  Widget build(BuildContext context) {
    return country != null && showFlag!
        ? Container(
            child: useEmoji!
                ? ForestText.textBodyL(
                    label: Utils.generateFlagEmojiUnicode(
                      country?.alpha2Code ?? '',
                    ),
                  )
                : Image.asset(
                    country!.flagUri,
                    width: 32,
                    package: 'intl_phone_number_input',
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox.shrink();
                    },
                  ),
          )
        : const SizedBox.shrink();
  }
}
