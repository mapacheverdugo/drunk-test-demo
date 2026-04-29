import 'package:libphonenumber_platform_interface/libphonenumber_platform_interface.dart';
import 'package:libphonenumber_plugin/libphonenumber_plugin.dart' as p;

/// A wrapper for a library providing validation and formating methods for phone numbers.
///
/// This is implemented with the libphonenumber library, which itself switches
/// between plugin available for `Web` or `Android or IOS` and `Other platforms` when available
class PhoneLibraryWrapper {
  Future<bool?> isValidPhoneNumber(String phoneNumber, String isoCode) {
    return p.PhoneNumberUtil.isValidPhoneNumber(phoneNumber, isoCode);
  }

  Future<String?> normalizePhoneNumber(
    String phoneNumber,
    String isoCode, [
    p.PhoneNumberFormat format = p.PhoneNumberFormat.E164,
  ]) {
    return p.PhoneNumberUtil.normalizePhoneNumber(phoneNumber, isoCode);
  }

  Future<RegionInfo> getRegionInfo(String phoneNumber, String isoCode) {
    return p.PhoneNumberUtil.getRegionInfo(phoneNumber, isoCode);
  }

  Future<PhoneNumberType> getNumberType(String phoneNumber, String isoCode) {
    return p.PhoneNumberUtil.getNumberType(phoneNumber, isoCode);
  }

  Future<String?> formatAsYouType(String phoneNumber, String isoCode) {
    return p.PhoneNumberUtil.formatAsYouType(phoneNumber, isoCode);
  }
}
