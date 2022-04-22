import 'package:flutter/material.dart';

class PngImage extends StatelessWidget {
  final String imageName;
  final double? width;
  final double? height;

  const PngImage({
    Key? key,
    required this.imageName,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageName,
      width: width,
      height: height,
    );
  }
}
