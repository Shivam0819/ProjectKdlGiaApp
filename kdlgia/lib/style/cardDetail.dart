import 'package:flutter/material.dart';
import 'package:kdlgia/style/search_card_ui.dart';

class InsideShadowCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Color shadowColor;

  const InsideShadowCard({super.key, 
    required this.child,
    this.borderRadius = 8.0,
    this.backgroundColor = Colors.white,
    this.shadowSpreadRadius = -7.0,
    this.shadowBlurRadius = 4.0,
    this.shadowColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(paddingCard),
    child:  Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: shadowSpreadRadius,
            blurRadius: shadowBlurRadius,
          ),
        ],
      ),
      child: child,
    ),
    );
   
  }
}
