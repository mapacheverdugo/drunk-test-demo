import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ForestButton extends StatelessWidget {
  const ForestButton._({
    required this.size,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.onPressed,
    required this.elevated,
    required this.label,
    required this.trailing,
    required this.leading,
    required this.enabled,
    required this.expanded,
    required this.isLoading,
    super.key,
  });

  factory ForestButton.primary({
    ForestButtonSize? size = ForestButtonSize.sm,
    VoidCallback? onPressed,
    String? label,
    bool elevated = true,
    Key? key,
    Widget? trailing,
    Widget? leading,
    bool enabled = true,
    bool expanded = false,
    bool isLoading = false,
  }) {
    return ForestButton._(
      size: size ?? ForestButtonSize.md,
      onPressed: onPressed,
      label: label,
      key: key,
      backgroundColor: ForestColors.accentForest,
      foregroundColor: ForestColors.white,
      elevated: elevated,
      trailing: trailing,
      leading: leading,
      enabled: enabled,
      expanded: expanded,
      isLoading: isLoading,
    );
  }

  factory ForestButton.light({
    ForestButtonSize? size = ForestButtonSize.sm,
    VoidCallback? onPressed,
    String? label,
    bool elevated = true,
    Key? key,
    Widget? trailing,
    Widget? leading,
    bool enabled = true,
    bool expanded = false,
    bool isLoading = false,
  }) {
    return ForestButton._(
      size: size ?? ForestButtonSize.md,
      onPressed: onPressed,
      label: label,
      key: key,
      backgroundColor: ForestColors.white,
      foregroundColor: ForestColors.darkestForest,
      elevated: elevated,
      trailing: trailing,
      leading: leading,
      enabled: enabled,
      expanded: expanded,
      isLoading: isLoading,
    );
  }

  factory ForestButton.dark({
    ForestButtonSize? size = ForestButtonSize.sm,
    VoidCallback? onPressed,
    String? label,
    bool elevated = true,
    Key? key,
    Widget? trailing,
    Widget? leading,
    bool enabled = true,
    bool expanded = false,
    bool isLoading = false,
  }) {
    return ForestButton._(
      size: size ?? ForestButtonSize.md,
      onPressed: onPressed,
      label: label,
      key: key,
      backgroundColor: ForestColors.darkestForest,
      foregroundColor: ForestColors.white,
      elevated: elevated,
      trailing: trailing,
      leading: leading,
      enabled: enabled,
      expanded: expanded,
      isLoading: isLoading,
    );
  }

  factory ForestButton.custom({
    required Color backgroundColor,
    ForestButtonSize? size = ForestButtonSize.sm,
    VoidCallback? onPressed,
    String? label,
    bool elevated = true,
    Key? key,
    Widget? trailing,
    Widget? leading,
    bool enabled = true,
    bool expanded = false,
    bool isLoading = false,
    Color foregroundColor = ForestColors.white,
  }) {
    return ForestButton._(
      size: size ?? ForestButtonSize.md,
      onPressed: onPressed,
      label: label,
      key: key,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevated: elevated,
      trailing: trailing,
      leading: leading,
      enabled: enabled,
      expanded: expanded,
      isLoading: isLoading,
    );
  }

  final ForestButtonSize size;
  final VoidCallback? onPressed;
  final String? label;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool elevated;
  final Widget? trailing;
  final Widget? leading;
  final bool enabled;
  final bool expanded;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final labelWidget = isLoading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.iconSize,
                height: size.iconSize,
                child: CircularProgressIndicator(
                  color: foregroundColor,
                ),
              ),
            ],
          )
        : label != null
            ? Text(
                label!.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: size.fontSize,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Mohr',
                ),
              )
            : null;

    return Opacity(
      opacity: enabled && !isLoading ? 1 : 0.6,
      child: ShadowedContainer(
        onTap: enabled && !isLoading ? onPressed : null,
        depth: elevated && !isLoading && enabled ? size.depth : 0,
        padding: size.padding,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(ForestBorder.radiusFull),
        border: Border.all(
          color: ForestColors.darkestForest,
          width: size.borderWidth,
        ),
        child: Row(
          mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: leading == null ? size.iconSize : null,
              child: leading ?? const SizedBox.shrink(),
            ),
            if (leading != null)
              SizedBox(
                width: size.innerSpacing,
              ),
            Flexible(
              child: labelWidget ?? const SizedBox.shrink(),
            ),
            if (trailing != null)
              SizedBox(
                width: size.innerSpacing,
              ),
            SizedBox(
              height: trailing == null ? size.iconSize : null,
              child: trailing ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
