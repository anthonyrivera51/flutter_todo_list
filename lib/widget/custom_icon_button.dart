import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/size_utils.dart';
import '../core/app_export.dart';

extension IconButtonStyleHelper on CustomIconButton {
  static BoxDecoration get outlineBlack => BoxDecoration(
    color: Colors.white70,
    boxShadow: [
      BoxShadow(
        color: Colors.black87.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get outlineBlackTL7 => BoxDecoration(
    color: Colors.black87,
    borderRadius: BorderRadius.circular(7.h),
    boxShadow: [
      BoxShadow(
        color: Colors.black87.withOpacity(0.25),
        spreadRadius: 2.h,
        blurRadius: 2.h,
        offset: Offset(
          0,
          4,
        ),
      ),
    ],
  );
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: Colors.white70,
    borderRadius: BorderRadius.circular(15.h),
  );
}


class CustomIconButton extends StatelessWidget {
  CustomIconButton({
    Key? key,
    this.alignment,
    this.height,
    this.width,
    this.padding,
    this.decoration,
    this.child,
    this.onTap
  })
  : super(key: key);

  final Alignment? alignment;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
      ? Align(alignment: alignment ?? Alignment.center, child: iconButtonWidget)
      : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
    height: height ?? 0,
    width: width ?? 0,
    child: IconButton(
      padding: EdgeInsets.zero,
      icon: Container(
        height: height ?? 0,
        width: width ?? 0,
        padding: padding ?? EdgeInsets.zero,
        decoration: decoration ?? 
          BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(35.h),
            boxShadow: [
              BoxShadow(
                color: Colors.white70,
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(
                  0,
                  4,
                )
              ),
            ],
          ),
        child: child,
      ),
      onPressed: onTap,
    ),
  );
}