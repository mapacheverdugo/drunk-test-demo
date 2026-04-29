import 'package:design_system/design_system.dart';
import 'package:flutter/widgets.dart';

enum ForestButtonSize {
  sm,
  md,
  lg,
  xl,
}

extension ForestButtonSizeExtension on ForestButtonSize {
  double get innerSpacing {
    switch (this) {
      case ForestButtonSize.sm:
      case ForestButtonSize.md:
        return 6;
      case ForestButtonSize.lg:
      case ForestButtonSize.xl:
        return 8;
    }
  }

  double get depth {
    switch (this) {
      case ForestButtonSize.sm:
        return 2;
      case ForestButtonSize.md:
      case ForestButtonSize.lg:
      case ForestButtonSize.xl:
        return 4;
    }
  }

  double get borderWidth {
    switch (this) {
      case ForestButtonSize.sm:
        return 1;
      case ForestButtonSize.md:
      case ForestButtonSize.lg:
      case ForestButtonSize.xl:
        return 1.5;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case ForestButtonSize.sm:
        return const EdgeInsets.symmetric(
          horizontal: ForestSpacing.spaceX1 + ForestSpacing.spaceX05,
          vertical: ForestSpacing.spaceX1,
        );
      case ForestButtonSize.md:
        return const EdgeInsets.symmetric(
          horizontal: ForestSpacing.spaceX3 - ForestSpacing.spaceX05,
          vertical: ForestSpacing.spaceX1 + ForestSpacing.spaceX05,
        );
      case ForestButtonSize.lg:
        return const EdgeInsets.symmetric(
          horizontal: ForestSpacing.spaceX3,
          vertical: ForestSpacing.spaceX1 + ForestSpacing.spaceX05,
        );
      case ForestButtonSize.xl:
        return const EdgeInsets.symmetric(
          horizontal: ForestSpacing.spaceX3,
          vertical: ForestSpacing.spaceX2,
        );
    }
  }

  double get iconSize {
    switch (this) {
      case ForestButtonSize.sm:
      case ForestButtonSize.md:
        return 16;
      case ForestButtonSize.lg:
      case ForestButtonSize.xl:
        return 24;
    }
  }

  double get fontSize {
    switch (this) {
      case ForestButtonSize.sm:
      case ForestButtonSize.md:
        return 14;
      case ForestButtonSize.lg:
      case ForestButtonSize.xl:
        return 16;
    }
  }
}
