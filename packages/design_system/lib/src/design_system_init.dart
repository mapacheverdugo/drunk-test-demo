import 'package:design_system/src/foundations/colors/colors_interface.dart';
import 'package:design_system/src/foundations/typography/typography_interface.dart';

class ForestDs {
  const ForestDs._();

  static ForestColorsInterface colors = const ForestColorsInterface();
  static ForestTypographyInterface typography =
      const ForestTypographyInterface();

  static void init({
    required ForestColorsInterface forestColors,
    required ForestTypographyInterface forestTypography,
  }) {
    colors = forestColors;
    typography = forestTypography;
  }
}
