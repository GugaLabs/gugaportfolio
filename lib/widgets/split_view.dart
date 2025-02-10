import 'package:flutter/material.dart';

class SplitView extends StatelessWidget {
  final WidgetBuilder navigationBuilder;
  final WidgetBuilder contentBuilder;
  final double breakpoint;
  final double navigationWidth;

  const SplitView({
    super.key,
    required this.navigationBuilder,
    required this.contentBuilder,
    this.breakpoint = 600,
    this.navigationWidth = 300,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth >= breakpoint) {
      //* wide screen: navigation on the left, content on the right

      return Row(
        children: [
          SizedBox(
            width: navigationWidth,
            child: navigationBuilder(context),
          ),
          // if you want, add a divider here
          Expanded(
            child: contentBuilder(context),
          ),
        ],
      );
    } else {
      //* show content only (handle navigation with a drawer or similar)
      return contentBuilder(context);
    }
  }
}
