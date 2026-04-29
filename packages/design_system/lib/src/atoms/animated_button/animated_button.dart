import 'package:design_system/design_system.dart';
import 'package:design_system/src/foundations/button/button_animated_interface.dart';
import 'package:design_system/src/utils/relative_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'types/light.dart';
part 'types/primary.dart';

class _ForestAnimatedButtonGeneric extends StatefulWidget {
  const _ForestAnimatedButtonGeneric({
    required this.label,
    required this.onTap,
    required this.buttonSize,
    required this.buttonType,
    required this.loadingColor,
    this.borderRadiusGeometry,
    this.isExpanded = true,
    this.labelPadding,
    this.fontFamily = ForestTypography.gt,
    this.buttonColor = ForestColors.accentForest,
  });

  final String label;
  final GestureTapCallback? onTap;
  final ButtonSize buttonSize;
  final ForestAnimatedButtonInterface buttonType;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final Color loadingColor;
  final bool isExpanded;
  final EdgeInsets? labelPadding;
  final String fontFamily;
  final Color buttonColor;

  @override
  State<_ForestAnimatedButtonGeneric> createState() =>
      _ForestAnimatedButtonGenericState();
}

class _ForestAnimatedButtonGenericState
    extends State<_ForestAnimatedButtonGeneric> with TickerProviderStateMixin {
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
  void didUpdateWidget(_ForestAnimatedButtonGeneric oldWidget) {
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
    if (widget.isExpanded) {
      return Row(
        children: [
          Flexible(
            child: Container(
              height: widget.buttonType.height,
              decoration: BoxDecoration(
                color: widget.buttonType.borderColor,
                borderRadius: widget.borderRadiusGeometry ??
                    BorderRadius.circular(
                      widget.buttonType.buttonBorderRadius,
                    ),
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
                                    color: RelativeColors.getRelativeColors(
                                      widget.buttonColor,
                                      l: widget.buttonType.hasBorder ? 0.06 : 0,
                                    ),
                                    borderRadius: widget.borderRadiusGeometry ??
                                        BorderRadius.circular(
                                          widget.buttonType.buttonBorderRadius,
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
                            Center(
                              child: SizedBox(
                                width: ForestSpacing.spaceX3,
                                height: ForestSpacing.spaceY3,
                                child: CircularProgressIndicator(
                                  color: widget.loadingColor,
                                ),
                              ),
                            )
                          else
                            Center(
                              child: widget.buttonType.showIcon
                                  ? _LabelTextWithIcon(
                                      buttonType: widget.buttonType,
                                      label: widget.label,
                                      buttonSize: widget.buttonSize,
                                      fontFamily: widget.fontFamily,
                                    )
                                  : _LabelText(
                                      buttonType: widget.buttonType,
                                      label: widget.label,
                                      buttonSize: widget.buttonSize,
                                      fontFamily: widget.fontFamily,
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

    return IntrinsicWidth(
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: widget.buttonType.height,
              decoration: BoxDecoration(
                color: widget.buttonType.borderColor,
                borderRadius: widget.borderRadiusGeometry ??
                    BorderRadius.circular(
                      widget.buttonType.buttonBorderRadius,
                    ),
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
                                Container(
                                  decoration: BoxDecoration(
                                    color: RelativeColors.getRelativeColors(
                                      widget.buttonType.buttonColor,
                                      l: widget.buttonType.hasBorder ? 0.06 : 0,
                                    ),
                                    borderRadius: widget.borderRadiusGeometry ??
                                        BorderRadius.circular(
                                          widget.buttonType.buttonBorderRadius,
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
                            Center(
                              child: SizedBox(
                                width: ForestSpacing.spaceX3,
                                height: ForestSpacing.spaceY3,
                                child: CircularProgressIndicator(
                                  color: widget.loadingColor,
                                ),
                              ),
                            )
                          else
                            Center(
                              child: widget.buttonType.showIcon
                                  ? _LabelTextWithIcon(
                                      buttonType: widget.buttonType,
                                      label: widget.label,
                                      buttonSize: widget.buttonSize,
                                      fontFamily: widget.fontFamily,
                                    )
                                  : Padding(
                                      padding: widget.labelPadding ??
                                          EdgeInsets.zero,
                                      child: _LabelText(
                                        buttonType: widget.buttonType,
                                        label: widget.label,
                                        buttonSize: widget.buttonSize,
                                        fontFamily: widget.fontFamily,
                                      ),
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
      ),
    );
  }
}

class _LabelText extends StatelessWidget {
  const _LabelText({
    required this.buttonSize,
    required this.buttonType,
    required this.label,
    required this.fontFamily,
  }) : super();

  final ButtonSize buttonSize;
  final ForestAnimatedButtonInterface buttonType;
  final String label;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return buttonSize.text(
      label: label,
      fontWeight: buttonType.labelFontWeight,
      color: buttonType.labelColor,
      fontFamily: fontFamily,
    );
  }
}

class _LabelTextWithIcon extends StatelessWidget {
  const _LabelTextWithIcon({
    required this.buttonType,
    required this.label,
    required this.buttonSize,
    required this.fontFamily,
  }) : super();

  final String label;
  final ForestAnimatedButtonInterface buttonType;
  final ButtonSize buttonSize;
  final String fontFamily;

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
          fontFamily: fontFamily,
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

  final ForestAnimatedButtonInterface buttonType;

  @override
  Widget build(BuildContext context) {
    if (buttonType.svgUrl?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }

    return SvgPicture.asset(
      buttonType.svgUrl ?? '',
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
