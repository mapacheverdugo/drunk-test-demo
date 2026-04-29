import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../strings.dart';

class ClearNameDialog extends StatelessWidget {
  const ClearNameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ForestSpacing.spaceX3,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: ForestSpacing.spaceX3),
              Container(
                padding: const EdgeInsets.all(ForestSpacing.spaceX2),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ForestColors.darkestForest,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/svg/triangle_exclamation.svg',
                  width: 32,
                  colorFilter: ColorFilter.mode(
                    ForestColors.aspenYellow,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: ForestSpacing.spaceY3),
              SizedBox(
                width: double.infinity,
                child: ForestText.textBodyLBold(
                  textAlign: TextAlign.left,
                  label: Strings.clearNameDialogTitle.toUpperCase(),
                  fontFamily: 'Mohr',
                  color: ForestColors.darkestForest,
                ),
              ),
              const SizedBox(height: ForestSpacing.spaceY1),
              SizedBox(
                width: double.infinity,
                child: ForestText.textBodyM(
                  label: Strings.clearNameDialogDescription,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: ForestSpacing.spaceY3),
              ForestButton.primary(
                size: ForestButtonSize.lg,
                label: Strings.clearNameDialogConfirm.toUpperCase(),
                expanded: true,
                elevated: false,
                onPressed: () => Navigator.of(context).pop(true),
              ),
              const SizedBox(height: ForestSpacing.spaceY1),
              ForestButton.light(
                size: ForestButtonSize.lg,
                label: Strings.clearNameDialogCancel,
                expanded: true,
                elevated: false,
                onPressed: () => Navigator.of(context).pop(false),
              ),
              const SizedBox(height: ForestSpacing.spaceY3),
            ],
          ),
        ),
      ],
      ),
    );
  }
}
