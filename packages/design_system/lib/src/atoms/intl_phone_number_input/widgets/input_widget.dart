import 'dart:async';

import 'package:design_system/src/atoms/intl_phone_number_input/models/country_list.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/models/country_model.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/providers/country_provider.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/phone_number.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/phone_number/phone_number_util.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/selector_config.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/util.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/utils/widget_view.dart';
import 'package:design_system/src/atoms/intl_phone_number_input/widgets/selector_button.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/typography/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Enum for [SelectorButton] types.
///
/// Available type includes:
///   * [PhoneInputSelectorType.dropdown]
///   * [PhoneInputSelectorType.bottomSheet]
///   * [PhoneInputSelectorType.dialog]
///   * [PhoneInputSelectorType.page]
enum PhoneInputSelectorType {
  dropdown,
  bottomSheet,
  dialog,
  page,
}

/// A [TextFormField] for [InternationalPhoneNumberInput].
///
/// [initialValue] accepts a [PhoneNumber] this is used to set initial values
/// for phone the input field and the selector button
///
/// [selectorButtonOnErrorPadding] is a double which is used to align the selector
/// button with the input field when an error occurs
///
/// [locale] accepts a country locale which will be used to translation, if the
/// translation exist
///
/// [countries] accepts list of string on Country isoCode, if specified filters
/// available countries to match the [countries] specified.
class InternationalPhoneNumberInput extends StatefulWidget {
  const InternationalPhoneNumberInput({
    required this.onInputChanged,
    required this.onTap,
    required this.phoneNumberUtil,
    super.key,
    this.selectorConfig = const SelectorConfig(),
    this.onInputValidated,
    this.onSubmit,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.fieldKey,
    this.textFieldController,
    this.keyboardAction,
    this.keyboardType = TextInputType.phone,
    this.initialValue,
    this.hintText = 'Phone number',
    this.errorMessage = 'Invalid phone number',
    this.selectorButtonOnErrorPadding = 24,
    this.spaceBetweenSelectorAndTextField = 12,
    this.maxLength = 15,
    this.isEnabled = true,
    this.formatInput = true,
    this.autoFocus = false,
    this.autoFocusSearch = false,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.ignoreBlank = false,
    this.countrySelectorScrollControlled = true,
    this.locale,
    this.textStyle,
    this.selectorTextStyle,
    this.inputBorder,
    this.inputDecoration,
    this.searchBoxDecoration,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.scrollPadding = const EdgeInsets.all(20),
    this.focusNode,
    this.cursorColor,
    this.autofillHints,
    this.countries,
    this.currentPhoneNumber,
  });

  final SelectorConfig selectorConfig;

  final ValueChanged<PhoneNumber>? onInputChanged;
  final ValueChanged<bool>? onInputValidated;

  final VoidCallback? onSubmit;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final ValueChanged<PhoneNumber>? onSaved;

  final Key? fieldKey;
  final TextEditingController? textFieldController;
  final TextInputType keyboardType;
  final TextInputAction? keyboardAction;

  final PhoneNumber? initialValue;
  final String? hintText;
  final String? errorMessage;

  final double selectorButtonOnErrorPadding;

  /// Ignored if [setSelectorButtonAsPrefixIcon = true]
  final double spaceBetweenSelectorAndTextField;
  final int maxLength;

  final bool isEnabled;
  final bool formatInput;
  final bool autoFocus;
  final bool autoFocusSearch;
  final AutovalidateMode autoValidateMode;
  final bool ignoreBlank;
  final bool countrySelectorScrollControlled;

  final String? locale;

  final TextStyle? textStyle;
  final TextStyle? selectorTextStyle;
  final InputBorder? inputBorder;
  final InputDecoration? inputDecoration;
  final InputDecoration? searchBoxDecoration;
  final Color? cursorColor;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets scrollPadding;

  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;

  final List<String>? countries;
  final VoidCallback onTap;
  final PhoneNumber? currentPhoneNumber;

  final PhoneNumberUtil phoneNumberUtil;

  @override
  State<StatefulWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InternationalPhoneNumberInput> {
  TextEditingController? controller;
  double selectorButtonBottomPadding = 0;

  Country? country;
  List<Country> countries = [];
  bool isNotValid = true;

  @override
  void initState() {
    super.initState();
    loadCountries();
    controller = widget.textFieldController ?? TextEditingController();
    initialiseWidget();
  }

  @override
  void setState(void Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _InputWidgetView(
      key: null,
      state: this,
      onTap: widget.onTap,
    );
  }

  @override
  void didUpdateWidget(InternationalPhoneNumberInput oldWidget) {
    loadCountries(previouslySelectedCountry: country);
    if (oldWidget.initialValue?.hash != widget.initialValue?.hash) {
      if (country!.alpha2Code != widget.initialValue?.isoCode) {
        loadCountries();
      }
      initialiseWidget();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// [initialiseWidget] sets initial values of the widget
  Future<void> initialiseWidget() async {
    if (widget.initialValue != null) {
      if (widget.initialValue!.phoneNumber != null &&
          widget.initialValue!.phoneNumber!.isNotEmpty &&
          (await widget.phoneNumberUtil.isValidNumber(
            phoneNumber: widget.initialValue!.phoneNumber!,
            isoCode: widget.initialValue!.isoCode!,
          ))!) {
        final phoneNumber = await widget.phoneNumberUtil
            .getParsableNumber(widget.initialValue!);

        controller!.text = widget.formatInput
            ? phoneNumber
            : phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

        phoneNumberControllerListener();
      }
    }
  }

  /// loads countries from [Countries.countryList] and selected Country
  void loadCountries({Country? previouslySelectedCountry}) {
    if (mounted) {
      var countries =
          CountryProvider.getCountriesData(countries: widget.countries);

      final country = previouslySelectedCountry ??
          Utils.getInitialSelectedCountry(
            countries,
            widget.initialValue?.isoCode ?? 'GB',
          );

      // Remove potential duplicates
      countries = countries.toSet().toList();

      final countryComparator = widget.selectorConfig.countryComparator;
      if (countryComparator != null) {
        countries.sort(countryComparator);
      }

      setState(() {
        this.countries = countries;
        this.country = country;
      });
    }
  }

  /// Listener that validates changes from the widget, returns a bool to
  /// the `ValueCallback` [this.onInputValidated]
  void phoneNumberControllerListener() {
    if (mounted) {
      final parsedPhoneNumberString =
          controller!.text.replaceAll(RegExp(r'[^\d+]'), '');
      getParsedPhoneNumber(parsedPhoneNumberString, country?.alpha2Code)
          .then((phoneNumber) {
        if (phoneNumber == null) {
          final phoneNumber = '${country?.dialCode}$parsedPhoneNumberString';

          widget.onInputChanged?.call(
            PhoneNumber(
              phoneNumber: phoneNumber,
              isoCode: country?.alpha2Code,
              dialCode: country?.dialCode,
            ),
          );

          widget.onInputValidated?.call(false);

          isNotValid = true;
        } else {
          widget.onInputChanged?.call(
            PhoneNumber(
              phoneNumber: phoneNumber,
              isoCode: country?.alpha2Code,
              dialCode: country?.dialCode,
            ),
          );

          widget.onInputValidated?.call(true);

          isNotValid = false;
        }
      });
    }
  }

  /// Returns a formatted String of [phoneNumber] with [isoCode], returns `null`
  /// if [phoneNumber] is not valid or if an [Exception] is caught.
  Future<String?> getParsedPhoneNumber(
    String phoneNumber,
    String? isoCode,
  ) async {
    if (phoneNumber.isNotEmpty && isoCode != null) {
      try {
        final isValidPhoneNumber = await widget.phoneNumberUtil.isValidNumber(
          phoneNumber: phoneNumber,
          isoCode: isoCode,
        );

        if (isValidPhoneNumber!) {
          return await widget.phoneNumberUtil.normalizePhoneNumber(
            phoneNumber: phoneNumber,
            isoCode: isoCode,
          );
        }
      } on Exception {
        return null;
      }
    }
    return null;
  }

  /// Creates or Select [InputDecoration]
  InputDecoration getInputDecoration(InputDecoration? decoration) {
    final value = decoration ??
        InputDecoration(
          border: widget.inputBorder ?? const UnderlineInputBorder(),
          hintText: widget.hintText,
        );

    if (widget.selectorConfig.setSelectorButtonAsPrefixIcon) {
      return value.copyWith(
        prefixIcon: SelectorButton(
          country: country,
          countries: countries,
          onCountryChanged: onCountryChanged,
          selectorConfig: widget.selectorConfig,
          selectorTextStyle: widget.selectorTextStyle,
          searchBoxDecoration: widget.searchBoxDecoration,
          locale: locale,
          isEnabled: widget.isEnabled,
          autoFocusSearchField: widget.autoFocusSearch,
          isScrollControlled: widget.countrySelectorScrollControlled,
        ),
      );
    }

    return value;
  }

  /// Validate the phone number when a change occurs
  void onChanged(String value) {
    phoneNumberControllerListener();
  }

  /// Validate and returns a validation error when [FormState] validate is called.
  ///
  /// Also updates [selectorButtonBottomPadding]
  String? validator(String? value) {
    final isValid =
        isNotValid && (value!.isNotEmpty || widget.ignoreBlank == false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isValid && widget.errorMessage != null) {
        setState(() {
          selectorButtonBottomPadding = widget.selectorButtonOnErrorPadding;
        });
      } else {
        setState(() {
          selectorButtonBottomPadding = 0;
        });
      }
    });

    return isValid ? widget.errorMessage : null;
  }

  /// Changes Selector Button Country and Validate Change.
  void onCountryChanged(Country? country) {
    setState(() {
      this.country = country;
    });
    phoneNumberControllerListener();
  }

  void _phoneNumberSaved() {
    if (mounted) {
      final parsedPhoneNumberString =
          controller!.text.replaceAll(RegExp(r'[^\d+]'), '');

      final phoneNumber = '${country?.dialCode ?? ''}$parsedPhoneNumberString';

      widget.onSaved?.call(
        PhoneNumber(
          phoneNumber: phoneNumber,
          isoCode: country?.alpha2Code,
          dialCode: country?.dialCode,
        ),
      );
    }
  }

  /// Saved the phone number when form is saved
  void onSaved(String? value) {
    _phoneNumberSaved();
  }

  /// Corrects duplicate locale
  String? get locale {
    if (widget.locale == null) return null;

    if (widget.locale!.toLowerCase() == 'nb' ||
        widget.locale!.toLowerCase() == 'nn') {
      return 'no';
    }
    return widget.locale;
  }
}

class _InputWidgetView
    extends WidgetView<InternationalPhoneNumberInput, _InputWidgetState> {
  const _InputWidgetView({
    required this.state,
    required this.onTap,
    required super.key,
  }) : super(state: state);

  @override
  // ignore: overridden_fields
  final _InputWidgetState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (!widget.selectorConfig.setSelectorButtonAsPrefixIcon) ...[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SelectorButton(
                country: state.country,
                countries: state.countries,
                onCountryChanged: state.onCountryChanged,
                selectorConfig: widget.selectorConfig,
                selectorTextStyle: widget.selectorTextStyle,
                searchBoxDecoration: widget.searchBoxDecoration,
                locale: state.locale,
                isEnabled: widget.isEnabled,
                autoFocusSearchField: widget.autoFocusSearch,
                isScrollControlled: widget.countrySelectorScrollControlled,
              ),
              SizedBox(
                height: state.selectorButtonBottomPadding,
              ),
            ],
          ),
          SizedBox(width: widget.spaceBetweenSelectorAndTextField),
        ],
        Flexible(
          child: TextFormField(
            textDirection: TextDirection.ltr,
            controller: state.controller,
            // cursorColor: widget.cursorColor,
            cursorColor: ForestColorsOld.colorForest400,
            focusNode: widget.focusNode,
            enabled: widget.isEnabled,
            autofocus: widget.autoFocus,
            keyboardType: widget.keyboardType,
            textInputAction: widget.keyboardAction,
            // style: widget.textStyle,
            style: const TextStyle(
              fontFamily: ForestTypography.gt,
              fontSize: 16,
              color: ForestColorsOld.colorWood900,
              fontWeight: FontWeight.w400,
            ),
            decoration: state.getInputDecoration(widget.inputDecoration),
            textAlign: widget.textAlign,
            textAlignVertical: widget.textAlignVertical,
            onEditingComplete: widget.onSubmit,
            onFieldSubmitted: widget.onFieldSubmitted,
            autovalidateMode: widget.autoValidateMode,
            autofillHints: widget.autofillHints,
            validator: widget.validator ?? state.validator,
            onSaved: state.onSaved,
            scrollPadding: widget.scrollPadding,
            onTap: onTap,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.maxLength),
            ],
            onChanged: state.onChanged,
          ),
        ),
      ],
    );
  }
}
