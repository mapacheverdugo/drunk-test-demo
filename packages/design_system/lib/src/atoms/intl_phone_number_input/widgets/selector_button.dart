import 'package:design_system/src/atoms/intl_phone_number_input/models/country_model.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/selector_config.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/widgets/countries_search_list_widget.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/widgets/input_widget.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/widgets/item.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:flutter/material.dart';

/// [SelectorButton]
class SelectorButton extends StatelessWidget {
  const SelectorButton({
    required this.countries,
    required this.country,
    required this.selectorConfig,
    required this.selectorTextStyle,
    required this.searchBoxDecoration,
    required this.autoFocusSearchField,
    required this.locale,
    required this.onCountryChanged,
    required this.isEnabled,
    required this.isScrollControlled,
    super.key,
  });
  final List<Country> countries;
  final Country? country;
  final SelectorConfig selectorConfig;
  final TextStyle? selectorTextStyle;
  final InputDecoration? searchBoxDecoration;
  final bool autoFocusSearchField;
  final String? locale;
  final bool isEnabled;
  final bool isScrollControlled;

  final ValueChanged<Country?> onCountryChanged;

  @override
  Widget build(BuildContext context) {
    return selectorConfig.selectorType == PhoneInputSelectorType.dropdown
        ? countries.isNotEmpty && countries.length > 1
            ? DropdownButtonHideUnderline(
                child: DropdownButton<Country>(
                  hint: Item(
                    country: country,
                    showFlag: selectorConfig.showFlags,
                    useEmoji: selectorConfig.useEmoji,
                    leadingPadding: selectorConfig.leadingPadding,
                    trailingSpace: selectorConfig.trailingSpace,
                    textStyle: selectorTextStyle,
                  ),
                  value: country,
                  items: mapCountryToDropdownItem(countries),
                  onChanged: isEnabled ? onCountryChanged : null,
                ),
              )
            : Item(
                country: country,
                showFlag: selectorConfig.showFlags,
                useEmoji: selectorConfig.useEmoji,
                leadingPadding: selectorConfig.leadingPadding,
                trailingSpace: selectorConfig.trailingSpace,
                textStyle: selectorTextStyle,
              )
        : MaterialButton(
            padding: EdgeInsets.zero,
            minWidth: 0,
            onPressed: countries.isNotEmpty && countries.length > 1 && isEnabled
                ? () async {
                    Country? selected;
                    if (selectorConfig.selectorType ==
                        PhoneInputSelectorType.bottomSheet) {
                      selected = await showCountrySelectorBottomSheet(
                        context,
                        countries,
                      );
                    } else {
                      selected =
                          await showCountrySelectorDialog(context, countries);
                    }

                    if (selected != null) {
                      onCountryChanged(selected);
                    }
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Item(
                country: country,
                showFlag: selectorConfig.showFlags,
                useEmoji: selectorConfig.useEmoji,
                leadingPadding: selectorConfig.leadingPadding,
                trailingSpace: selectorConfig.trailingSpace,
                textStyle: selectorTextStyle,
              ),
            ),
          );
  }

  /// Converts the list [countries] to `DropdownMenuItem`
  List<DropdownMenuItem<Country>> mapCountryToDropdownItem(
    List<Country> countries,
  ) {
    return countries.map((country) {
      return DropdownMenuItem<Country>(
        value: country,
        child: Item(
          country: country,
          showFlag: selectorConfig.showFlags,
          useEmoji: selectorConfig.useEmoji,
          textStyle: selectorTextStyle,
          trailingSpace: selectorConfig.trailingSpace,
        ),
      );
    }).toList();
  }

  /// shows a Dialog with list [countries] if the [PhoneInputSelectorType.dialog] is selected
  Future<Country?> showCountrySelectorDialog(
    BuildContext inheritedContext,
    List<Country> countries,
  ) {
    return showDialog(
      context: inheritedContext,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      useSafeArea: false,
      routeSettings: const RouteSettings(
        name: '/country_selector_dialog',
      ),
      builder: (BuildContext context) => Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          backgroundColor: ForestColorsOld.colorWood0,
          elevation: 0,
          leading: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: ForestColorsOld.colorWood900,
                ),
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: double.maxFinite,
          child: CountrySearchListWidget(
            countries,
            locale,
            searchBoxDecoration: searchBoxDecoration,
            showFlags: selectorConfig.showFlags,
            useEmoji: selectorConfig.useEmoji,
            autoFocus: autoFocusSearchField,
          ),
        ),
      ),
    );
  }

  /// shows a Dialog with list [countries] if the [PhoneInputSelectorType.bottomSheet] is selected
  Future<Country?> showCountrySelectorBottomSheet(
    BuildContext inheritedContext,
    List<Country> countries,
  ) {
    return showModalBottomSheet(
      context: inheritedContext,
      routeSettings: const RouteSettings(
        name: '/country_selector_bottom_sheet',
      ),
      clipBehavior: Clip.hardEdge,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                builder: (BuildContext context, ScrollController controller) {
                  return Directionality(
                    textDirection: Directionality.of(inheritedContext),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Theme.of(context).canvasColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                        ),
                      ),
                      child: CountrySearchListWidget(
                        countries,
                        locale,
                        searchBoxDecoration: searchBoxDecoration,
                        scrollController: controller,
                        showFlags: selectorConfig.showFlags,
                        useEmoji: selectorConfig.useEmoji,
                        autoFocus: autoFocusSearchField,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
