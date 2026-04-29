import 'package:collection/collection.dart';
import 'package:design_system/src/foundations/colors/colors.dart';
import 'package:design_system/src/foundations/typography/typography.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForestRichModel {
  ForestRichModel({
    required this.patternId,
    this.color,
    this.onTap,
    this.textStyle,
  });

  final String patternId;
  final Color? color;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
}

/// Widget para aplicar texto enriquecido a traducciones.
/// Se debe encerrar en un patron espécifico la palabra o frase a la cual se le va a aplicar
/// un estilo diferente o el evento click. Este patron se compone de un sub-índice + [].
/// El subíndice esta compuesto de una letra y un número
/// Ej: Acepto los a1[términos y condiciones] y las a2[políticas de privacidad]
///
/// Luego cuando se va a usar este widget se define por el sub-índice que estilo se le va a dar
///
/// * [text] (required) text to show with pattern.
/// * [params] (required) params with color, pattern and/or tap
///
/// ForestRich(
/// text: 'Acepto los a1[términos y condiciones] y las a2[políticas de privacidad]',
/// params: [
///   ForestRichModel(
///       patternId: 'a1',
///       onTap: () {
///         Navigator.push(
///           context,
///           MaterialPageRoute(
///             builder: (_) => const RichPage2(),
///            ),
///          );
///        },
///      ),
///    ForestRichModel(patternId: 'a2', color: Colors.green),
///  ],
///),
///
///

class ForestRich extends StatefulWidget {
  const ForestRich({
    required this.text,
    required this.params,
    super.key,
    this.textStyle,
    this.textAlign = TextAlign.start,
  });
  final String text;
  final List<ForestRichModel> params;
  final TextStyle? textStyle;
  final TextAlign textAlign;

  @override
  State<ForestRich> createState() => _ForestRichState();
}

class _ForestRichState extends State<ForestRich> {
  List<TextSpan> listTxtSpan = [];

  String get _text => widget.text;
  List<ForestRichModel> get _params => widget.params;

  @override
  void initState() {
    super.initState();
    _splitText();
  }

  @override
  void didUpdateWidget(covariant ForestRich oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.text != widget.text) {
      _splitText();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: widget.textAlign,
      text: TextSpan(
        text: '',
        style: const TextStyle(
          fontFamily: ForestTypography.gt,
          fontStyle: FontStyle.normal,
        ).merge(widget.textStyle),
        children: listTxtSpan,
      ),
    );
  }

  //divide el texto en un array donde el patron buscado es patterId[]
  //del ejemplo quedaría: [Acepto los, a1[términos y condiciones], y las,
  //b2[políticas de privacidad]]
  //luego arma el RichText
  void _splitText() {
    final lt = <TextSpan>[];
    final split = _text.split(RegExp(r'(?=\w\d\[.*?\])|(?<=\[.*?\])'));

    for (var i = 0; i < split.length; i++) {
      final val =
          _params.firstWhereOrNull((e) => split[i].contains('${e.patternId}['));

      val == null
          ? lt.add(_simpleTextSpan(split[i]))
          : lt.add(_richTextSpan(val, split[i]));
    }

    setState(() {
      listTxtSpan = lt;
    });
  }

  TextSpan _richTextSpan(ForestRichModel model, String text) {
    final texto =
        text.replaceFirst('${model.patternId}[', '').replaceFirst(']', '');
    return TextSpan(
      text: texto,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: model.color ?? ForestColorsOld.colorText,
      ).merge(model.textStyle),
      recognizer: TapGestureRecognizer()..onTap = model.onTap,
    );
  }

  TextSpan _simpleTextSpan(String text) {
    return TextSpan(text: text);
  }
}
