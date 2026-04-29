import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PortraitFrame extends StatelessWidget {
  const PortraitFrame({required this.child, super.key});

  final Widget child;

  static const double _frameWidth = 390;
  static const double _frameHeight = 844;
  static const double _bezelRadius = 48;
  static const double _bezelPadding = 14;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobileViewport =
            constraints.maxWidth <= _frameWidth + 1 &&
                constraints.maxHeight >= _frameHeight - 100;

        if (isMobileViewport) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              size: Size(constraints.maxWidth, constraints.maxHeight),
            ),
            child: child,
          );
        }

        final available = Size(
          constraints.maxWidth - _bezelPadding * 2,
          constraints.maxHeight - _bezelPadding * 2,
        );
        final scale = (available.width / _frameWidth)
            .clamp(0.0, 1.0)
            .toDouble();
        final scaleHeight = (available.height / _frameHeight)
            .clamp(0.0, 1.0)
            .toDouble();
        final finalScale = scale < scaleHeight ? scale : scaleHeight;

        return Container(
          color: const Color(0xff0F1311),
          alignment: Alignment.center,
          child: Transform.scale(
            scale: finalScale,
            child: Container(
              width: _frameWidth + _bezelPadding * 2,
              height: _frameHeight + _bezelPadding * 2,
              decoration: BoxDecoration(
                color: ForestColors.darkestForest,
                borderRadius: BorderRadius.circular(_bezelRadius + 4),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x66000000),
                    blurRadius: 40,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(_bezelPadding),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_bezelRadius - 6),
                child: SizedBox(
                  width: _frameWidth,
                  height: _frameHeight,
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      size: const Size(_frameWidth, _frameHeight),
                      padding: const EdgeInsets.only(top: 47, bottom: 34),
                      viewPadding: const EdgeInsets.only(top: 47, bottom: 34),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(child: child),
                        const _Notch(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Notch extends StatelessWidget {
  const _Notch();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          width: 110,
          height: 28,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
