import 'package:design_system/src/foundations/button/button_floating_interface.dart';
import 'package:design_system/src/foundations/button/button_size.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'types/custom.dart';
part 'types/light.dart';
part 'types/light_outline.dart';
part 'types/primary.dart';

class _ForestFloatingButtonGeneric extends StatelessWidget {
  const _ForestFloatingButtonGeneric({
    required this.onTap,
    required this.buttonSize,
    required this.buttonType,
    this.label,
  });

  final String? label;
  final GestureTapCallback? onTap;
  final ButtonSize buttonSize;
  final ForestFloatingButtonInterface buttonType;

  @override
  Widget build(BuildContext context) {
    if (buttonType.svgUrl?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: buttonType.isDisabled ? null : onTap,
      child: Container(
        height: buttonType.height,
        width: buttonType.height,
        padding: EdgeInsets.symmetric(
          horizontal: buttonSize.paddingH,
          vertical: buttonSize.paddingV,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: buttonType.isDisabled
                ? ForestColorsOld.colorWood200
                : buttonType.borderColor,
            width: buttonType.borderWidth ?? 1.5,
          ),
          color: buttonType.isDisabled
              ? ForestColorsOld.colorWood100
              : buttonType.buttonColor,
        ),
        child: (buttonType.svgUrl?.isEmpty ?? true)
            ? const SizedBox.shrink()
            : SvgPicture.asset(
                buttonType.svgUrl ?? '',
                key: ValueKey(buttonType.svgUrl),
                width: buttonType.svgSize,
                colorFilter: buttonType.svgColor != null
                    ? ColorFilter.mode(
                        buttonType.isDisabled
                            ? ForestColorsOld.colorWood400
                            : buttonType.svgColor!,
                        BlendMode.srcIn,
                      )
                    : null,
              ),
      ),
    );
  }
}
