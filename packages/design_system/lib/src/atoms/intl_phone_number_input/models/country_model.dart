import 'package:design_system/src/atoms/intl_phone_number_input/models/country_list.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

/// A [Country] model represents an instance of a country which contains
/// information about the country
class Country extends Equatable {
  const Country({
    required this.name,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.dialCode,
    required this.flagUri,
    this.nameTranslations,
  });

  /// Convert [Countries.countryList] to [Country] model
  factory Country.fromJson(Map<String, dynamic> data) {
    return Country(
      name: data['en_short_name'] as String?,
      alpha2Code: data['alpha_2_code'] as String?,
      alpha3Code: data['alpha_3_code'] as String?,
      dialCode: data['dial_code'] as String?,
      flagUri:
          'assets/flags/${data['alpha_2_code'].toString().toLowerCase()}.png',
      nameTranslations: data['nameTranslations'] != null
          ? Map<String, String>.from(data['nameTranslations'] as Map)
          : null,
    );
  }

  /// The name of the [Country]
  final String? name;

  /// The alpha 2 isoCode of the [Country]
  final String? alpha2Code;

  /// The alpha 3 isoCode of the [Country]
  final String? alpha3Code;

  /// The dialCode of the [Country]
  final String? dialCode;

  /// The flagUri which links to the flag for the [Country] in the library assets
  final String flagUri;

  /// The nameTranslation for translation
  final Map<String, String>? nameTranslations;

  @override
  String toString() => '[Country] { '
      'name: $name, '
      'alpha2: $alpha2Code, '
      'alpha3: $alpha3Code, '
      'dialCode: $dialCode '
      '}';

  @override
  List<Object?> get props => [alpha2Code, alpha3Code, dialCode];
}
