import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double blurSigma;
  final double opacity;
  final Color color;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  const GlassContainer({
    super.key,
    required this.child,
    this.opacity = 0.2,
    this.color = Colors.white,
    this.borderRadius,
    this.padding,
    this.width,
    this.height,
    this.blurSigma = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    //if no radius is provided
    final radius = borderRadius ?? BorderRadius.circular(50);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: color.withOpacity(opacity),
            borderRadius: radius,

            border: Border.all(
              color: color.withOpacity(opacity + 0.1),
              width: 1.0,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
