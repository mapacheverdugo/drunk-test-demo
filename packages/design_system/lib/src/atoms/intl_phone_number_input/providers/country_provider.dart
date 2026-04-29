import 'package:design_system/src/atoms/intl_phone_number_input/models/country_list.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/models/country_model.dart';

const String propertyName = 'alpha_2_code';

/// [CountryProvider] provides helper classes that involves manipulations.
/// of Countries from [Countries.countryList]
class CountryProvider {
  /// Get data of Countries.
  ///
  /// Returns List of [Country].
  ///
  ///  * If [countries] is `null` or empty it returns a list of all [Countries.countryList].
  ///  * If [countries] is not empty it returns a filtered list containing
  ///    counties as specified.
  static List<Country> getCountriesData({required List<String>? countries}) {
    final jsonList = Countries.countryList;

    if (countries == null || countries.isEmpty) {
      return jsonList.map(Country.fromJson).toList();
    }
    final filteredList = jsonList.where((country) {
      return countries.contains(country[propertyName]);
    }).toList();

    return filteredList.map(Country.fromJson).toList();
  }
}
