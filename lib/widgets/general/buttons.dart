import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final VoidCallback? callback;
  final double? fontsize;
  final double? width;
  final double? height;
  final Color? buttonBackgroundColor;
  final Color? fontColor;
  final double leftMargin;
  final double rightMargin;
  final double topMargin;
  final double bottomMargin;
  final double bottompad;
  final double toppad;
  final double leftpad;
  final double rightpad;
  final double radius;
  final double borderRadius;
  final Color? borderColor;
  final AlignmentGeometry? alignment;

  CustomButton({
    required this.btnName,
    this.alignment,
    this.callback,
    this.height = 48.0,
    this.width = 343.0,
    this.fontsize = 20,
    this.buttonBackgroundColor,
    this.fontColor,
    this.radius = 0.0,
    this.bottomMargin = 0.0,
    this.leftMargin = 0.0,
    this.topMargin = 0,
    this.rightMargin = 0,
    this.bottompad = 0,
    this.leftpad = 0,
    this.rightpad = 0,
    this.toppad = 0,
    this.borderColor,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        alignment: alignment != null ? alignment : null,
        padding: EdgeInsets.only(
          left: leftpad,
          right: rightpad,
          bottom: bottompad,
          top: toppad,
        ),
        margin: EdgeInsets.only(
          left: leftMargin,
          right: rightMargin,
          bottom: bottomMargin,
          top: topMargin,
        ),
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? Colors.transparent, width: borderRadius),
          borderRadius: radius >= 1
              ? BorderRadius.circular(radius)
              : BorderRadius.circular(25),
          color: buttonBackgroundColor ?? Theme.of(context).buttonColor,
        ),
        child: Center(
          child: Text(
            btnName,
            style: fontColor != null
                ? Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: fontColor)
                : Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: white5),
          ),
        ),
      ),
    );
  }
}
