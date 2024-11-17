import 'package:flutter/material.dart';

class ScrollBarWidget extends StatelessWidget {
  final Widget child;
  const ScrollBarWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      trackRadius: const Radius.circular(16),
      thumbColor: const Color(0xff38b6ff),
      trackColor: Colors.transparent,
      trackBorderColor: Colors.transparent,
      radius: const Radius.circular(16),
      thumbVisibility: true,
      trackVisibility: true,
      child: child,
    );
  }
}
