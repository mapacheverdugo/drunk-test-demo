import 'package:flutter/material.dart';

/// An abstract class based of gSkinner `WidgetView`
///
/// More information
/// ("gSkinner WidgetView Tutorial")[https://blog.gskinner.com/archives/2020/02/flutter-widgetview-a-simple-separation-of-layout-and-logic.html]
abstract class WidgetView<T extends StatefulWidget, S extends State<T>>
    extends StatelessWidget {
  const WidgetView({required this.state, super.key});
  final S state;

  T get widget => state.widget;

  @override
  Widget build(BuildContext context);
}
