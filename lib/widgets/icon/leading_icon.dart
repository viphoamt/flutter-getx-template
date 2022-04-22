import 'package:flutter/material.dart';
import 'package:flutter_getx_base/commons/constant/colors.dart';
import 'package:flutter_getx_base/commons/constant/image_assets.dart';
import 'package:flutter_getx_base/widgets/icon/base/svg_image.dart';

class LeadingIcon extends StatelessWidget {
  final Color? color;

  final double width;
  final double height;

  const LeadingIcon({Key? key, this.color, this.width = 24, this.height = 24})
      : super(key: key);

  const LeadingIcon.black({
    Key? key,
    this.color = ColorConstants.bodyText,
    this.width = 24,
    this.height = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgImage(
      assetName: ImageAssets.icLeading,
      width: width,
      height: height,
      color: color,
    );
  }
}
