import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation(this.controller)
      : opacity = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.100,
              curve: Curves.ease,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 25.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.125,
              0.250,
              curve: Curves.ease,
            ),
          ),
        ),
        height = Tween<double>(
          begin: 25.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.250,
              0.375,
              curve: Curves.ease,
            ),
          ),
        ),
        padding = EdgeInsetsTween(
          begin: EdgeInsets.only(bottom: 0),
          end: EdgeInsets.only(bottom: 50),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.250,
              0.375,
              curve: Curves.ease,
            ),
          ),
        ),
        borderRadius = BorderRadiusTween(
          begin: BorderRadius.circular(4.0),
          end: BorderRadius.circular(25.0),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.375,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        color = ColorTween(
          begin: Colors.blue,
          end: Colors.orange,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.500,
              0.750,
              curve: Curves.ease,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color?> color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, _) {
        return Container(
          padding: padding.value,
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: opacity.value,
            child: Container(
              width: width.value,
              height: height.value,
              decoration: BoxDecoration(
                color: color.value,
                border: Border.all(
                  color: Colors.indigo.shade300,
                  width: 3.0,
                ),
                borderRadius: borderRadius.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
