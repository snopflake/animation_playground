import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final double waveHeight;

  WaveClipper(this.waveHeight);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - waveHeight);
    path.quadraticBezierTo(
      size.width * 0.25, size.height - waveHeight - 10,
      size.width * 0.5, size.height - waveHeight,
    );
    path.quadraticBezierTo(
      size.width * 0.75, size.height - waveHeight + 10,
      size.width, size.height - waveHeight,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant WaveClipper oldClipper) => waveHeight != oldClipper.waveHeight;
}
