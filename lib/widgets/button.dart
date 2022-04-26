import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/constant/index.dart';

class Button extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? color;
  final bool isLarge;
  final bool isDisable;
  final double? width;

  const Button({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.isLarge = false,
    this.isDisable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal16),
        height: isLarge ? kHeightLargeButton : kHeightDefaultButton,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kRadiusButton),
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
