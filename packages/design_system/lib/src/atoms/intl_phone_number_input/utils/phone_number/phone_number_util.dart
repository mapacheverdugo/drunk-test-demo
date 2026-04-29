import 'package:collection/collection.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/models/country_list.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/phone_number.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/phone_number/phone_library_wrapper.dart';

/// A collection of util methods for phone numbers.
class PhoneNumberUtil {
  PhoneNumberUtil({required this.phoneLibraryWrapper});

  PhoneLibraryWrapper phoneLibraryWrapper;

  /// [isValidNumber] checks if a [phoneNumber] is valid.
  /// Accepts [phoneNumber] and [isoCode]
  /// Returns [Future<bool>].
  Future<bool?> isValidNumber({
    required String phoneNumber,
    required String isoCode,
  }) async {
    if (phoneNumber.length < 2) {
      return false;
    }
    return phoneLibraryWrapper.isValidPhoneNumber(phoneNumber, isoCode);
  }

  /// [normalizePhoneNumber] normalizes a string of characters representing a phone number
  /// Accepts [phoneNumber] and [isoCode]
  /// Returns [Future<String>]
  Future<String?> normalizePhoneNumber({
    required String phoneNumber,
    required String isoCode,
  }) async {
    return phoneLibraryWrapper.normalizePhoneNumber(phoneNumber, isoCode);
  }

  /// Accepts [phoneNumber] and [isoCode]
  /// Returns [Future<RegionInfo>] of all information available about the [phoneNumber]
  Future<RegionInfo> _getRegionInfo({
    required String phoneNumber,
    required String isoCode,
  }) async {
    final response =
        await phoneLibraryWrapper.getRegionInfo(phoneNumber, isoCode);

    return RegionInfo(
      regionPrefix: response.regionPrefix,
      isoCode: response.isoCode,
      formattedPhoneNumber: response.formattedPhoneNumber,
    );
  }

  /// Accepts [phoneNumber] and [isoCode]
  /// Returns [Future<PhoneNumberType>] type of phone number
  Future<PhoneNumberType> _getNumberType({
    required String phoneNumber,
    required String isoCode,
  }) async {
    final type = await phoneLibraryWrapper.getNumberType(phoneNumber, isoCode);

    return PhoneNumberTypeUtil.getType(type.index as int?);
  }

  /// [formatAsYouType] uses Google's libphonenumber input format as you type.
  /// Accepts [phoneNumber] and [isoCode]
  /// Returns [Future<String>]
  Future<String?> formatAsYouType({
    required String phoneNumber,
    required String isoCode,
  }) async {
    return phoneLibraryWrapper.formatAsYouType(phoneNumber, isoCode);
  }

  /// Returns [PhoneNumber] which contains region information about
  /// the [phoneNumber] and [isoCode] passed.
  Future<PhoneNumber> getRegionInfoFromPhoneNumber(
    String phoneNumber, [
    String isoCode = '',
  ]) async {
    final regionInfo = await _getRegionInfo(
      phoneNumber: phoneNumber,
      isoCode: isoCode,
    );

    final internationalPhoneNumber = await normalizePhoneNumber(
      phoneNumber: phoneNumber,
      isoCode: regionInfo.isoCode ?? isoCode,
    );

    return PhoneNumber(
      phoneNumber: internationalPhoneNumber,
      dialCode: regionInfo.regionPrefix,
      isoCode: regionInfo.isoCode,
    );
  }

  /// Accepts a [PhoneNumber] object and returns a formatted phone number String
  Future<String> getParsableNumber(PhoneNumber phoneNumber) async {
    if (phoneNumber.isoCode != null) {
      final number = await getRegionInfoFromPhoneNumber(
        phoneNumber.phoneNumber!,
        phoneNumber.isoCode!,
      );
      final formattedNumber = await formatAsYouType(
        phoneNumber: number.phoneNumber!,
        isoCode: number.isoCode!,
      );

      return formattedNumber!.replaceAll(
        RegExp('^([\\+]?${number.dialCode}[\\s]?)'),
        '',
      );
    } else {
      throw Exception('ISO Code is "${phoneNumber.isoCode}"');
    }
  }

  /// For predefined phone number returns Country's isoCode from the dial code,
  /// Returns null if not found.
  String? getISO2CodeByPrefix(String prefix) {
    if (prefix.isNotEmpty) {
      final prefixCopy = prefix.startsWith('+') ? prefix : '+$prefix';
      final country = Countries.countryList
          .firstWhereOrNull((country) => country['dial_code'] == prefixCopy);
      if (country != null && country['alpha_2_code'] != null) {
        return country['alpha_2_code'] as String?;
      }
    }
    return null;
  }

  /// Returns [PhoneNumberType] which is the type of phone number
  /// Accepts [phoneNumber] and [isoCode] and r
  Future<PhoneNumberType> getPhoneNumberType(
    String phoneNumber,
    String isoCode,
  ) async {
    final type = await _getNumberType(
      phoneNumber: phoneNumber,
      isoCode: isoCode,
    );

    return type;
  }
}

/// [RegionInfo] contains regional information about a phone number.
/// [isoCode] current region/country code of the phone number
/// [regionPrefix] dialCode of the phone number
/// [formattedPhoneNumber] national level formatting rule apply to the phone number
class RegionInfo {
  RegionInfo({this.regionPrefix, this.isoCode, this.formattedPhoneNumber});

  RegionInfo.fromJson(Map<String, dynamic> json) {
    regionPrefix = json['regionCode'] as String?;
    isoCode = json['isoCode'] as String?;
    formattedPhoneNumber = json['formattedPhoneNumber'] as String?;
  }

  String? regionPrefix;
  String? isoCode;
  String? formattedPhoneNumber;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['regionCode'] = regionPrefix;
    data['isoCode'] = isoCode;
    data['formattedPhoneNumber'] = formattedPhoneNumber;
    return data;
  }

  @override
  String toString() {
    return '[RegionInfo prefix=$regionPrefix, iso=$isoCode, formatted=$formattedPhoneNumber]';
  }
}

/// [PhoneNumberTypeUtil] helper class for `PhoneNumberType`
class PhoneNumberTypeUtil {
  /// Returns [PhoneNumberType] for index [value]
  static PhoneNumberType getType(int? value) {
    switch (value) {
      case 0:
        return PhoneNumberType.fixedLine;
      case 1:
        return PhoneNumberType.mobile;
      case 2:
        return PhoneNumberType.fixedLineOrMobile;
      case 3:
        return PhoneNumberType.tollFree;
      case 4:
        return PhoneNumberType.premiumRate;
      case 5:
        return PhoneNumberType.sharedCost;
      case 6:
        return PhoneNumberType.voip;
      case 7:
        return PhoneNumberType.personalNumber;
      case 8:
        return PhoneNumberType.pager;
      case 9:
        return PhoneNumberType.uan;
      case 10:
        return PhoneNumberType.voicemail;
      default:
        return PhoneNumberType.unknown;
    }
  }
}

/// Extension on PhoneNumberType
extension PhoneNumberTypeProperties on PhoneNumberType {
  /// Returns the index [int] of the current `PhoneNumberType`
  int get value {
    switch (this) {
      case PhoneNumberType.fixedLine:
        return 0;
      case PhoneNumberType.mobile:
        return 1;
      case PhoneNumberType.fixedLineOrMobile:
        return 2;
      case PhoneNumberType.tollFree:
        return 3;
      case PhoneNumberType.premiumRate:
        return 4;
      case PhoneNumberType.sharedCost:
        return 5;
      case PhoneNumberType.voip:
        return 6;
      case PhoneNumberType.personalNumber:
        return 7;
      case PhoneNumberType.pager:
        return 8;
      case PhoneNumberType.uan:
        return 9;
      case PhoneNumberType.voicemail:
        return 10;
      case PhoneNumberType.unknown:
        return -1;
    }
  }
}
