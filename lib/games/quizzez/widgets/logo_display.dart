import 'package:flutter/material.dart';


class LogoDisplay extends StatelessWidget {
  final String imagePath;
  final String imageName;
  final double imagePadding;
  final String fontFamily;
  final List<String> text;

  const LogoDisplay({super.key, required this.imagePath, required this.imageName, required this.imagePadding, required this.fontFamily, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text[0], style: TextStyle(
          fontFamily: fontFamily,
        ),),
        Padding(
          padding: EdgeInsets.only(left: imagePadding, right: imagePadding),
          child: CircleAvatar(
            backgroundImage: AssetImage("$imagePath$imageName"),
          ),
        ),
        Text(text[1], style: TextStyle(fontFamily: fontFamily))
      ],
    );
  }
}
