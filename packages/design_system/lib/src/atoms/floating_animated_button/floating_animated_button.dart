import 'package:design_system/src/foundations/button/button_floating_animated_interface.dart';
import 'package:design_system/src/foundations/button/button_size.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/spacing/spacing.dart';
import 'package:design_system/src/utils/relative_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'types/custom.dart';
part 'types/light.dart';

class _ForestFloatingAnimatedButtonGeneric extends StatefulWidget {
  const _ForestFloatingAnimatedButtonGeneric({
    required this.label,
    required this.onTap,
    required this.buttonSize,
    required this.buttonType,
    this.borderRadiusGeometry,
  });

  final String label;
  final GestureTapCallback? onTap;
  final ButtonSize buttonSize;
  final ForestFloatingAnimatedButtonInterface buttonType;
  final BorderRadiusGeometry? borderRadiusGeometry;

  @override
  State<_ForestFloatingAnimatedButtonGeneric> createState() =>
      _ForestFloatingAnimatedButtonGenericState();
}

class _ForestFloatingAnimatedButtonGenericState
    extends State<_ForestFloatingAnimatedButtonGeneric>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  late Animation<double>? _pressedAnimation;
  TickerFuture? _downTicker;

  void _setupAnimation() {
    _animationController?.stop();
    final oldControllerValue = _animationController?.value ?? 0.0;
    _animationController?.dispose();
    _animationController = AnimationController(
      duration: Duration(
        microseconds: widget.buttonType.duration.inMicroseconds ~/ 3,
      ),
      vsync: this,
      value: oldControllerValue,
    );
    _pressedAnimation =
        Tween<double>(begin: -widget.buttonType.depth, end: 0).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeInOut),
    );
  }

  @override
  void didUpdateWidget(_ForestFloatingAnimatedButtonGeneric oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.buttonType.duration != widget.buttonType.duration) {
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
    _animationController?.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    _downTicker = _animationController?.animateTo(1);
  }

  void _onTapUp(_) {
    _downTicker?.whenComplete(() {
      _animationController?.animateTo(0);
      widget.onTap?.call();
    });
  }

  void _onTapCancel() {
    _animationController?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: widget.buttonType.height,
            decoration: BoxDecoration(
              // color: widget.buttonType.borderColor,
              color: widget.buttonType.shadowColor ??
                  widget.buttonType.borderColor,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              onTapCancel: _onTapCancel,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: widget.borderRadiusGeometry ??
                          BorderRadius.circular(
                            widget.buttonType.buttonBorderRadius,
                          ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _pressedAnimation!,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.translate(
                        offset: Offset(0, _pressedAnimation!.value),
                        child: child,
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            widget.buttonType.buttonBorderRadius,
                          ),
                          child: Stack(
                            children: <Widget>[
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: RelativeColors.getRelativeColors(
                                    widget.buttonType.buttonColor,
                                    l: widget.buttonType.hasBorder ? 0.06 : 0,
                                  ),
                                  border: Border.all(
                                    color: widget.buttonType.borderColor,
                                    width: widget.buttonType.borderWidth!,
                                  ),
                                ),
                                child: const SizedBox.expand(),
                              ),
                            ],
                          ),
                        ),
                        if (widget.buttonType.isLoading)
                          const Center(
                            child: SizedBox(
                              width: ForestSpacing.spaceX3,
                              height: ForestSpacing.spaceY3,
                              child: CircularProgressIndicator(
                                color: ForestColorsOld.colorWood0,
                              ),
                            ),
                          )
                        else
                          Center(
                            child: widget.buttonType.showIcon
                                ? _BuildIcon(buttonType: widget.buttonType)
                                : _LabelText(
                                    buttonType: widget.buttonType,
                                    label: widget.label,
                                    buttonSize: widget.buttonSize,
                                  ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
  final ForestFloatingAnimatedButtonInterface buttonType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return buttonSize.text(
      label: label,
      fontWeight: buttonType.labelFontWeight,
      color: buttonType.labelColor,
    );
  }
}

class _BuildIcon extends StatelessWidget {
  const _BuildIcon({required this.buttonType});

  final ForestFloatingAnimatedButtonInterface buttonType;

  @override
  Widget build(BuildContext context) {
    if (buttonType.svgUrl?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }

    return SvgPicture.asset(
      buttonType.svgUrl ?? '',
      key: ValueKey(buttonType.svgUrl ?? ''),
      width: buttonType.svgSize,
      colorFilter: buttonType.svgColor != null
          ? ColorFilter.mode(
              buttonType.svgColor!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
