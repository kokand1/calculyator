import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final color;
  final textColor;
  final dynamic buttonText;
  final buttontapped;
  const Mybutton({super.key, this.color, this.textColor, this.buttonText,this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(buttonText, style: TextStyle(color: textColor)),
            ),
          ),
        ),
      ),
    );
  }
}
