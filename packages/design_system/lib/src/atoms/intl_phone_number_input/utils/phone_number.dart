import 'dart:math';

import 'package:shared_dependencies/shared_dependencies.dart';

/// Type of phone numbers.
enum PhoneNumberType {
  fixedLine, // : 0,
  mobile, //: 1,
  fixedLineOrMobile, //: 2,
  tollFree, //: 3,
  premiumRate, //: 4,
  sharedCost, //: 5,
  voip, //: 6,
  personalNumber, //: 7,
  pager, //: 8,
  uan, //: 9,
  voicemail, //: 10,
  unknown, //: -1
}

/// [PhoneNumber] contains detailed information about a phone number
class PhoneNumber extends Equatable {
  PhoneNumber({
    this.phoneNumber,
    this.dialCode,
    this.isoCode,
  }) : _hash = 1000 + Random().nextInt(99999 - 1000);

  /// Either formatted or unformatted String of the phone number
  final String? phoneNumber;

  /// The Country [dialCode] of the phone number
  final String? dialCode;

  /// Country [isoCode] of the phone number
  final String? isoCode;

  /// [_hash] is used to compare instances of [PhoneNumber] object.
  final int _hash;

  /// Returns an integer generated after the object was initialised.
  /// Used to compare different instances of [PhoneNumber]
  int get hash => _hash;

  @override
  List<Object?> get props => [phoneNumber, isoCode, dialCode];

  @override
  String toString() {
    return 'PhoneNumber(phoneNumber: $phoneNumber, dialCode: $dialCode, isoCode: $isoCode)';
  }

  /// Returns a String of [phoneNumber] without [dialCode]
  String parseNumber() {
    return phoneNumber!.replaceAll('$dialCode', '');
  }
}
