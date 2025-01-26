import 'package:flutter/material.dart';
import 'package:guga_portfolio/colors.dart';

class GradientBackground extends StatefulWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  _GradientBackgroundState createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground> {
  late List<Color> _colors;
  late int _colorIndex;

  @override
  void initState() {
    super.initState();
    _colors = [
      Colors.transparent,
      ColorsApp.primary,
      Colors.transparent,
      ColorsApp.primary,
    ];
    _colorIndex = 0;
    _animateGradient();
  }

  void _animateGradient() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _colors.length;
      });
      _animateGradient();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _colors[_colorIndex],
            _colors[(_colorIndex + 1) % _colors.length]
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
        ),
      ),
      child: widget.child,
    );
  }
}
