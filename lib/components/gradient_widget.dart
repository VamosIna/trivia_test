import 'package:flutter/material.dart';
import 'package:trivia/shared/theme/theme.dart';

class GradientWidget extends StatelessWidget {
  const GradientWidget({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            a,
            b,
            c,
            d,
            e,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: child,
    );
  }
}
