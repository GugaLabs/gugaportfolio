import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  final Widget child;
  final String text;

  const ShadowWidget({
    super.key,
    required this.child,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0xff38b6ff),
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            0,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(
                0xff161618,
              ),
              border: Border.all(
                color: const Color(0xff38b6ff),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
