import 'package:design_system/src/foundations/button/button_interface.dart';
import 'package:design_system/src/foundations/button/button_size.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'types/borderless.dart';
part 'types/danger.dart';
part 'types/light.dart';
part 'types/light_outline.dart';
part 'types/primary.dart';
part 'types/primary_outline.dart';
part 'types/warning.dart';

class _ForestButtonGeneric extends StatelessWidget {
  const _ForestButtonGeneric({
    required this.label,
    required this.onTap,
    required this.buttonSize,
    required this.buttonType,
    this.borderRadiusGeometry,
    this.paddingInsets,
    this.loadingColor,
  });

  final String label;
  final GestureTapCallback? onTap;
  final ButtonSize buttonSize;
  final ForestButtonInterface buttonType;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final EdgeInsets? paddingInsets;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonType.isDisabled ? null : onTap,
      child: ColoredBox(
        color: Colors.transparent,
        child: Row(
          children: [
            if (buttonType.isExpanded)
              Flexible(
                child: _Button(
                  buttonSize: buttonSize,
                  buttonType: buttonType,
                  borderRadiusGeometry: borderRadiusGeometry,
                  paddingInsets: paddingInsets,
                  label: label,
                  loadingColor: loadingColor,
                ),
              )
            else
              _Button(
                buttonSize: buttonSize,
                buttonType: buttonType,
                borderRadiusGeometry: borderRadiusGeometry,
                paddingInsets: paddingInsets,
                label: label,
                loadingColor: loadingColor,
              ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.buttonSize,
    required this.buttonType,
    required this.label,
    this.borderRadiusGeometry,
    this.paddingInsets,
    this.loadingColor,
  });

  final ButtonSize buttonSize;
  final ForestButtonInterface buttonType;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final EdgeInsets? paddingInsets;
  final String label;
  final Color? loadingColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: paddingInsets ??
          EdgeInsets.symmetric(
            horizontal: buttonSize.paddingH,
            vertical: buttonSize.paddingV,
          ),
      height: buttonType.height,
      decoration: BoxDecoration(
        borderRadius: borderRadiusGeometry ??
            BorderRadius.circular(buttonType.buttonBorderRadius),
        color: buttonType.isDisabled
            ? ForestColorsOld.colorWood100
            : buttonType.buttonColor,
        border: Border.all(
          color: buttonType.isDisabled
              ? ForestColorsOld.colorWood200
              : buttonType.borderColor,
          width: buttonType.borderWidth ?? 1.5,
        ),
      ),
      child: (buttonType.isLoading)
          ? Center(
              child: SizedBox(
                width: ForestSpacing.spaceX3,
                height: ForestSpacing.spaceY3,
                child: CircularProgressIndicator(
                  color: loadingColor ?? ForestColorsOld.colorWood0,
                ),
              ),
            )
          : Center(
              child: buttonType.showIcon
                  ? _LabelTextWithIcon(
                      label: label,
                      buttonSize: buttonSize,
                      buttonType: buttonType,
                    )
                  : _LabelText(
                      label: label,
                      buttonSize: buttonSize,
                      buttonType: buttonType,
                    ),
            ),
    );
  }
}

class _LabelText extends StatelessWidget {
  const _LabelText({
    required this.buttonSize,
    required this.buttonType,
    required this.label,
  });

  final ButtonSize buttonSize;
  final ForestButtonInterface buttonType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return buttonSize.text(
      label: label,
      fontWeight: buttonType.labelFontWeight,
      textAlign: TextAlign.center,
      color: buttonType.isDisabled
          ? ForestColorsOld.colorWood500
          : buttonType.labelColor,
    );
  }
}

class _LabelTextWithIcon extends StatelessWidget {
  const _LabelTextWithIcon({
    required this.buttonType,
    required this.label,
    required this.buttonSize,
  });

  final String label;
  final ForestButtonInterface buttonType;
  final ButtonSize buttonSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (!buttonType.showIconAtRight)
          Flexible(
            child: Container(
              margin: EdgeInsets.only(right: buttonType.iconMargin),
              child: _BuildIcon(
                buttonType: buttonType,
              ),
            ),
          )
        else
          const SizedBox.shrink(),
        _LabelText(
          label: label,
          buttonType: buttonType,
          buttonSize: buttonSize,
        ),
        if (buttonType.showIconAtRight)
          Container(
            margin: EdgeInsets.only(left: buttonType.iconMargin),
            child: _BuildIcon(
              buttonType: buttonType,
            ),
          )
        else
          const SizedBox.shrink(),
      ],
    );
  }
}

class _BuildIcon extends StatelessWidget {
  const _BuildIcon({required this.buttonType});

  final ForestButtonInterface buttonType;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      buttonType.svgUrl ?? '',
      width: buttonType.svgSize,
      colorFilter: buttonType.svgColor != null
          ? ColorFilter.mode(buttonType.svgColor!, BlendMode.srcIn)
          : null,
    );
  }
}
