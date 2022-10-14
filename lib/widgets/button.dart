import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/constant/index.dart';

class Button extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? color;
  final bool isDisable;
  final double? width;
  final double? height;

  const Button({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.color,
    this.isDisable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        margin: EdgeInsets.symmetric(horizontal: Dimensions.height10),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius8),
          border: Border.all(color: Theme.of(context).backgroundColor),
        ),
        child: Center(
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
