import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ShadowedContainer extends StatefulWidget {
  const ShadowedContainer({
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.onTap,
    this.depth = 4,
    this.animationDuration = const Duration(milliseconds: 300),
    this.clipBehavior = Clip.none,
    this.border = const Border(
      top: _defaultBorderSide,
      bottom: _defaultBorderSide,
      left: _defaultBorderSide,
      right: _defaultBorderSide,
    ),
    this.borderRadius,
    this.color,
    super.key,
  });

  static const _defaultBorderSide = BorderSide(
    color: ForestColors.darkestForest,
    width: 1.5,
  );

  final Widget child;
  final double? width;
  final double? height;
  final double? depth;
  final Duration? animationDuration;
  final EdgeInsets? padding;
  final GestureTapCallback? onTap;
  final Border? border;
  final BorderRadius? borderRadius;
  final Clip clipBehavior;
  final Color? color;
  @override
  State<ShadowedContainer> createState() => _ShadowedContainerState();
}

class _ShadowedContainerState extends State<ShadowedContainer>
    with TickerProviderStateMixin {
  late double _depth = widget.depth ?? 0;

  late AnimationController _animationController = AnimationController(
    duration: Duration(
      microseconds: widget.animationDuration!.inMicroseconds ~/ 3,
    ),
    vsync: this,
  );
  late Animation<double> _pressedAnimation =
      Tween<double>(begin: -_depth, end: 0).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ),
  );
  TickerFuture? _downTicker;

  void _setupAnimation() {
    _animationController.stop();
    final oldControllerValue = _animationController.value;
    _animationController.dispose();
    _animationController = AnimationController(
      duration: Duration(
        microseconds: widget.animationDuration!.inMicroseconds ~/ 3,
      ),
      vsync: this,
      value: oldControllerValue,
    );
    _pressedAnimation = Tween<double>(begin: -_depth, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(ShadowedContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animationDuration != widget.animationDuration) {
      _setupAnimation();
    }
    if (oldWidget.depth != widget.depth) {
      setState(() {
        _depth = widget.depth ?? 0;
      });
      _setupAnimation();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setupAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    _downTicker = _animationController.animateTo(1);
  }

  void _onTapUp(_) {
    _downTicker?.whenComplete(() {
      _animationController.animateTo(0);
      widget.onTap?.call();
    });
  }

  void _onTapCancel() {
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pressedAnimation,
      builder: (BuildContext context, Widget? child) {
        return GestureDetector(
          onTapDown: widget.onTap != null ? _onTapDown : null,
          onTapUp: widget.onTap != null ? _onTapUp : null,
          onTapCancel: widget.onTap != null ? _onTapCancel : null,
          child: Container(
            margin: EdgeInsets.only(
              top: (_depth + _pressedAnimation.value) > 0
                  ? _depth + _pressedAnimation.value
                  : 0,
            ),
            padding: EdgeInsets.only(
              bottom:
                  (-_pressedAnimation.value) > 0 ? -_pressedAnimation.value : 0,
            ),
            decoration: BoxDecoration(
              color: ForestColors.darkestForest,
              borderRadius: widget.borderRadius,
            ),
            child: child,
          ),
        );
      },
      child: Container(
        clipBehavior: widget.clipBehavior,
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: widget.borderRadius,
          border: widget.border,
        ),
        child: Container(
          clipBehavior: widget.clipBehavior,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius?.copyWith(
              topLeft: Radius.elliptical(
                (widget.borderRadius?.topLeft.x ?? 0) -
                    (widget.border?.top.width ?? 0),
                (widget.borderRadius?.topLeft.y ?? 0) -
                    (widget.border?.left.width ?? 0),
              ),
              topRight: Radius.elliptical(
                (widget.borderRadius?.topRight.x ?? 0) -
                    (widget.border?.top.width ?? 0),
                (widget.borderRadius?.topRight.y ?? 0) -
                    (widget.border?.right.width ?? 0),
              ),
              bottomLeft: Radius.elliptical(
                (widget.borderRadius?.bottomLeft.x ?? 0) -
                    (widget.border?.bottom.width ?? 0),
                (widget.borderRadius?.bottomLeft.y ?? 0) -
                    (widget.border?.left.width ?? 0),
              ),
              bottomRight: Radius.elliptical(
                (widget.borderRadius?.bottomRight.x ?? 0) -
                    (widget.border?.bottom.width ?? 0),
                (widget.borderRadius?.bottomRight.y ?? 0) -
                    (widget.border?.right.width ?? 0),
              ),
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
