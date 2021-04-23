import 'package:flutter/material.dart';
import 'dart:ui';
class BlurContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final double posY;
  final double posX;
  final Color color;
  final double blurStrength;

  BlurContainer(
      {this.color = Colors.white60,
      this.posX = 0,
      this.posY = 0,
      this.blurStrength = 4,
      this.width = 100,
      this.height = 100,
      this.child});

  @override
  Widget build(BuildContext context) {
 
    return Stack(children: [
      Positioned(
        top: this.posY,
        left: this.posX,
        child: Container(
          width: this.width,
          height: this.height,
          decoration: BoxDecoration(
              color: this.color, borderRadius: BorderRadius.circular(60)),
        ),
      ),
      Positioned(
          top: this.posY,
          left: this.posX,
          width: this.width * .999,
          height: this.height * .999,
          child: ClipRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: this.blurStrength, sigmaY: this.blurStrength),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.0),
                          borderRadius: BorderRadius.circular(80)),
                      child: this.child)))),
    ]);
  }
}
