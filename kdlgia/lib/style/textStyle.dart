import 'package:kdlgia/style/search_card_ui.dart';
import 'package:flutter/material.dart';

class TextStyleHeader extends StatelessWidget {
  final String text;
  final double fontSizeIs;
  final Color colors;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const TextStyleHeader({super.key, 
    required this.text,
    this.fontSizeIs = 14,
    this.colors = mainColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSizeIs,
        fontWeight: fontWeight,
        color: colors,
      ),
      textAlign: textAlign,
    );
  }
}
