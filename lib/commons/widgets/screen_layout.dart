import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/colors.dart';

class ScreenLayout extends StatelessWidget {
  final Widget body;
  final Color iconThemeColor;
  final Color? backgroundColor;
  final bool showAppBar;
  final Widget? title;
  final List<Widget>? actions;
  final bool shouldHideKeyBoardOnTap;
  final SystemUiOverlayStyle appBarSystemOverlayStyle;
  final Color appBarBackgroundColor;
  final Widget? background;
  final double? titleSpacing;
  final bool safeTop;
  final bool safeBottom;
  final ShapeBorder? appBarShapeBorder;

  const ScreenLayout({
    Key? key,
    required this.body,
    this.showAppBar = true,
    this.title,
    this.actions,
    this.shouldHideKeyBoardOnTap = true,
    this.appBarBackgroundColor = ColorConstants.transparent,
    this.background,
    this.titleSpacing,
    this.safeTop = true,
    this.safeBottom = true,
    this.appBarShapeBorder,
    this.backgroundColor,
  })  : appBarSystemOverlayStyle = SystemUiOverlayStyle.light,
        iconThemeColor = ColorConstants.lightPrimaryColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: shouldHideKeyBoardOnTap
          ? () {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          : null,
      child: Stack(
        children: [
          if (background != null)
            Positioned.fill(
              child: background!,
            ),
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor:
                backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              systemOverlayStyle: appBarSystemOverlayStyle,
              backgroundColor: appBarBackgroundColor,
              elevation: 0,
              centerTitle: true,
              title: title,
              titleSpacing: titleSpacing,
              iconTheme: IconThemeData(
                color: iconThemeColor,
              ),
              actions: actions,
              shape: appBarShapeBorder,
            ),
            body: SafeArea(child: body, bottom: safeBottom, top: safeTop),
          ),
        ],
      ),
    );
  }
}
