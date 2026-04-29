import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../strings.dart';

class SafetyDisclaimerPage extends StatelessWidget {
  const SafetyDisclaimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ForestColors.iceCream,
      appBar: AppBar(
        backgroundColor: ForestColors.iceCream,
        foregroundColor: ForestColors.darkestForest,
        elevation: 0,
        title: ForestText.textBodyLBold(
          label: 'SAFETY DISCLAIMER',
          fontFamily: 'Mohr',
          color: ForestColors.darkestForest,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ForestSpacing.spaceX3),
          child: SingleChildScrollView(
            child: ForestText.textBodyM(
              label: Strings.safetyDisclaimerBody,
              color: ForestColors.darkestForest,
            ),
          ),
        ),
      ),
    );
  }
}
