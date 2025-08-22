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
    this.color = logoMachingColor,
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

class StyledTextSearchDetail extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const StyledTextSearchDetail({
    super.key,
    required this.text,
    this.color = logoMachingColor,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w500,
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
// Reusable function for custom text fields
Widget buildCustomTextField({
  required TextEditingController controller,
  required String labelText,
  String hintedText = 'Enter value', // ✅ Default hint text
  Color color = logoMachingColor,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintedText, // ✅ Will use default unless overridden
      labelStyle: const TextStyle(color: logoMachingColor),
      focusColor: logoMachingColor,
      border: const UnderlineInputBorder(
        borderSide: BorderSide(color: logoMachingColor),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: logoMachingColor),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: logoMachingColor,
          width: 2,
        ),
      ),
    ),
    cursorColor: logoMachingColor,
  );
}



Widget buildCustomTextFieldOutlineInputBorder({
  required TextEditingController controller,
  required String labelText,
  String hintedText = 'Enter value', // ✅ Default hint text
  Color color = logoMachingColor,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintedText, // ✅ Will use default unless overridden
      labelStyle: const TextStyle(color: logoMachingColor),
      focusColor: logoMachingColor,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: logoMachingColor),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: logoMachingColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: logoMachingColor,
          width: 2,
        ),
      ),
    ),
    cursorColor: logoMachingColor,
  );
}


Widget buildingCustomTextFieldFilterHeading({
  required String labelText,
  double fontSizeElement = fontSizeHeading, // ✅ Default font size
  Color color = logoMachingColor,
  FontWeight fontWeightElement = FontWeight.w700,
  EdgeInsets padding = const EdgeInsets.all(8.0), // ✅ Default padding
}) {
  return Padding(
    padding: padding, // ✅ Apply padding to the entire TextField
    child: Text(
      labelText,
      style: TextStyle(
          color: color,
          fontSize: fontSizeElement,
          fontWeight: FontWeight.bold,
        ),
    ),
  );
}

Widget buildingCustomTextFieldFilterSubWidget({
  required String labelText,
  double fontSizeElement = fontSizeElement, // ✅ Default font size
  Color color = logoMachingColor,
  FontWeight fontWeightElement = FontWeight.w700,
  EdgeInsets padding = const EdgeInsets.all(8.0), // ✅ Default padding
}) {
  return Padding(
    padding: padding, // ✅ Apply padding to the entire TextField
    child: Text(
      labelText,
      style: TextStyle(
          color: color,
          fontSize: fontSizeElement,
          fontWeight: fontWeightElement,
        ),
    ),
  );
}