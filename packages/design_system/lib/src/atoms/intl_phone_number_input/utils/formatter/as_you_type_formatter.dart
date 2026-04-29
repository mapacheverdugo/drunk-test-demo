import 'package:design_system/src/atoms/intl_phone_number_input/utils/phone_number/phone_number_util.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/countries.dart';

typedef OnInputFormatted<T> = void Function(T value);

/// [AsYouTypeFormatter] is a custom formatter that extends [TextInputFormatter]
/// which provides as you type validation and formatting for phone number inputted.
class AsYouTypeFormatter extends TextInputFormatter {
  AsYouTypeFormatter({
    required this.isoCode,
    required this.dialCode,
    required this.onInputFormatted,
    required this.phoneNumberUtil,
  });

  final PhoneNumberUtil phoneNumberUtil;

  /// Contains characters allowed as seperators.
  final RegExp separatorChars = RegExp(r'[^\d]+');

  /// The [allowedChars] contains [RegExp] for allowable phone number characters.
  final RegExp allowedChars = RegExp(r'[\d+]');

  /// The [isoCode] of the [Country] formatting the phone number to
  final String isoCode;

  /// The [dialCode] of the [Country] formatting the phone number to
  final String dialCode;

  /// [onInputFormatted] is a callback that passes the formatted phone number
  final OnInputFormatted<TextEditingValue> onInputFormatted;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldValueLength = oldValue.text.length;
    final newValueLength = newValue.text.length;

    if (newValueLength > 0 && newValueLength > oldValueLength) {
      final newValueText = newValue.text;
      final rawText = newValueText.replaceAll(separatorChars, '');
      final textToParse = dialCode + rawText;

      final _ = newValueText
          .substring(
            oldValue.selection.start == -1 ? 0 : oldValue.selection.start,
            newValue.selection.end == -1 ? 0 : newValue.selection.end,
          )
          .replaceAll(separatorChars, '');

      formatAsYouType(input: textToParse).then(
        (String? value) {
          final parsedText = parsePhoneNumber(value);

          var offset =
              newValue.selection.end == -1 ? 0 : newValue.selection.end;

          if (separatorChars.hasMatch(parsedText)) {
            final indice = offset - 1;

            if (indice >= parsedText.length) return;

            final valueInInputIndex = parsedText[indice];

            if (offset < parsedText.length) {
              final offsetDifference = parsedText.length - offset;

              if (offsetDifference < 2) {
                if (separatorChars.hasMatch(valueInInputIndex)) {
                  offset += 1;
                } else {
                  bool isLastChar;
                  try {
                    if (newValue.selection.end > newValueText.length) {
                      isLastChar = true;
                    } else {
                      isLastChar = false;
                    }
                    // ignore: avoid_catching_errors
                  } on RangeError {
                    isLastChar = true;
                  }

                  if (isLastChar) {
                    offset += offsetDifference;
                  }
                }
              } else {
                if (parsedText.length > indice) {
                  if (separatorChars.hasMatch(valueInInputIndex)) {
                    offset += 1;
                  }
                }
              }
            }

            onInputFormatted(
              TextEditingValue(
                text: parsedText,
                selection: TextSelection.collapsed(offset: offset),
              ),
            );
          }
        },
      );
    }
    return newValue;
  }

  /// Accepts [input], unformatted phone number and
  /// returns a [Future<String>] of the formatted phone number.
  Future<String?> formatAsYouType({required String input}) async {
    try {
      final formattedPhoneNumber = await phoneNumberUtil.formatAsYouType(
        phoneNumber: input,
        isoCode: isoCode,
      );
      return formattedPhoneNumber;
    } on Exception {
      return '';
    }
  }

  /// Accepts a formatted [phoneNumber]
  /// returns a [String] of `phoneNumber` with the dialCode replaced with an empty String
  String parsePhoneNumber(String? phoneNumber) {
    if (dialCode.length > 4) {
      if (isPartOfNorthAmericanNumberingPlan(dialCode)) {
        const northAmericaDialCode = '+1';
        final countryDialCodeWithSpace =
            '$northAmericaDialCode ${dialCode.replaceFirst(northAmericaDialCode, '')}';

        return phoneNumber!
            .replaceFirst(countryDialCodeWithSpace, '')
            .replaceFirst(separatorChars, '')
            .trim();
      }
    }
    return phoneNumber!.replaceFirst(dialCode, '').trim();
  }

  /// Accepts a [dialCode]
  /// returns a [bool], true if the `dialCode` is part of North American Numbering Plan
  bool isPartOfNorthAmericanNumberingPlan(String dialCode) {
    return dialCode.contains('+1');
  }
}
