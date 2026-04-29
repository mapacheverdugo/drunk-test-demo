import 'package:design_system/design_system.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/models/country_model.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/util.dart';
import 'package:flutter/material.dart';

class CountrySearchListWidget extends StatefulWidget {
  const CountrySearchListWidget(
    this.countries,
    this.locale, {
    super.key,
    this.searchBoxDecoration,
    this.scrollController,
    this.showFlags,
    this.useEmoji,
    this.autoFocus = false,
  });
  final List<Country> countries;
  final InputDecoration? searchBoxDecoration;
  final String? locale;
  final ScrollController? scrollController;
  final bool autoFocus;
  final bool? showFlags;
  final bool? useEmoji;

  @override
  State<CountrySearchListWidget> createState() =>
      _CountrySearchListWidgetState();
}

class _CountrySearchListWidgetState extends State<CountrySearchListWidget> {
  late final TextEditingController _searchController = TextEditingController();
  late List<Country> filteredCountries;

  @override
  void initState() {
    final value = _searchController.text.trim();
    filteredCountries = Utils.filterCountries(
      countries: widget.countries,
      locale: widget.locale,
      value: value,
    );
    FocusManager.instance.primaryFocus?.unfocus();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  InputDecoration getSearchBoxDecoration() {
    return widget.searchBoxDecoration ??
        const InputDecoration(labelText: 'Search by country name or dial code');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ForestSpacing.spaceX3,
              vertical: ForestSpacing.spaceY4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ForestText.textBodyM(
                  // label: Lt.of(context).SearchCountry__Label,
                  label: 'Search country',
                  color: ForestColorsOld.colorWood900,
                ),
                const SizedBox(height: ForestSpacing.spaceX1),
                ForestField(
                  key: widget.key,
                  controller: _searchController,
                  onChanged: (value) {
                    final value = _searchController.text.trim();
                    return setState(
                      () => filteredCountries = Utils.filterCountries(
                        countries: widget.countries,
                        locale: widget.locale,
                        value: value,
                      ),
                    );
                  },
                  onTap: () {},
                  filled: true,
                  hintText: 'Country',
                  textAlignVertical: TextAlignVertical.center,
                  fillColor: ForestColorsOld.colorWood0,
                  contentPadding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ],
            ),
          ),
          if (filteredCountries.isEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ForestSpacing.spaceX3,
              ),
              child: Row(
                children: [
                  Flexible(
                    child: ForestText.textBodyL(
                      label:
                          'Not results found for “${_searchController.text}”',
                    ),
                  ),
                ],
              ),
            ),
          ],
          Flexible(
            child: ListView.builder(
              controller: widget.scrollController,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: ForestSpacing.spaceX3,
              ),
              itemCount: filteredCountries.length,
              itemBuilder: (BuildContext context, int index) {
                final country = filteredCountries[index];

                return DirectionalCountryListTile(
                  country: country,
                  locale: widget.locale,
                  showFlags: widget.showFlags!,
                  useEmoji: widget.useEmoji!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void setState(void Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}

class DirectionalCountryListTile extends StatelessWidget {
  const DirectionalCountryListTile({
    required this.country,
    required this.locale,
    required this.showFlags,
    required this.useEmoji,
    super.key,
  });

  final Country country;
  final String? locale;
  final bool showFlags;
  final bool useEmoji;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(country),
      child: Container(
        color: const Color(0xffF5F5F5),
        padding: const EdgeInsets.only(bottom: ForestSpacing.spaceY4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showFlags) _Flag(country: country, useEmoji: useEmoji),
            const SizedBox(width: ForestSpacing.spaceX1),
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: ForestText.textBodyL(
                      label: '${Utils.getCountryName(country, locale)}',
                      color: ForestColorsOld.colorWood900,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: ForestSpacing.spaceX05),
            ForestText.textBodyL(
              label: country.dialCode ?? '',
              color: ForestColorsOld.colorWood900,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}

class _Flag extends StatelessWidget {
  const _Flag({this.country, this.useEmoji});

  final Country? country;
  final bool? useEmoji;

  @override
  Widget build(BuildContext context) {
    return country != null
        ? Container(
            child: useEmoji!
                ? Text(
                    Utils.generateFlagEmojiUnicode(country?.alpha2Code ?? ''),
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                : country?.flagUri != null
                    ? CircleAvatar(
                        backgroundImage: AssetImage(
                          country!.flagUri,
                          package: 'intl_phone_number_input',
                        ),
                      )
                    : const SizedBox.shrink(),
          )
        : const SizedBox.shrink();
  }
}
