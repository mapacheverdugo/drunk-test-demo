import 'package:blur/blur.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ForestDialogBase extends StatelessWidget {
  const ForestDialogBase({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: Blur(
            blurColor: ForestColors.darkestForest,
            child: Container(),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(
            ForestSpacing.spaceX3,
            ForestSpacing.spaceX3 + MediaQuery.of(context).padding.top,
            ForestSpacing.spaceX3,
            ForestSpacing.spaceX3 + MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ShadowedContainer(
                  borderRadius: BorderRadius.circular(ForestBorder.radiusM),
                  color: ForestColors.iceCream,
                  child: SingleChildScrollView(child: child),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
