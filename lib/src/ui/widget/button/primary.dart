import 'package:flutter/material.dart';

const double _defaultHeight = 50;

class TappableArea extends StatelessWidget {
  final Function()? onPressed;
  final Widget child;
  final double height;
  final double? width;

  const TappableArea({
    Key? key,
    this.onPressed,
    required this.child,
    this.height = _defaultHeight,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Container(
              width: width ?? double.infinity,
              height: height,
            ),
          ),
        ),
      ],
    );
  }
}
