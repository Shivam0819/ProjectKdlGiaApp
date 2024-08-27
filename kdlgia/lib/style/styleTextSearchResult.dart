import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kdlgia/style/search_card_ui.dart';

class StyledText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const StyledText({
    super.key,
    required this.text,
    this.color = mainColor,
    this.fontSize = 10,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: textDecoration,
          ),
        ),
        textAlign: textAlign,
      ),
    );
  }
}



class StyledTextSearchDetail
 extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const StyledTextSearchDetail
  ({
    super.key,
    required this.text,
    this.color = const Color.fromARGB(175, 7, 0, 1),
    this.fontSize = 12,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.none,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      child: Text(
        text,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: textDecoration,
          ),
        ),
        textAlign: textAlign,
      ),
    );
  }
}
