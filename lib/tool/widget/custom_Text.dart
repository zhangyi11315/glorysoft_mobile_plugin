
import 'package:flutter/material.dart';

class ZText extends StatelessWidget {

  final String str;
  final Color color;
  final double fontSize;
  final bool isBold;

  ZText(this.str, {this.color = Colors.blue, this.fontSize = 14, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Text(str,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal
        )
    );
  }
}