import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Widget reverse;

  const Responsive(
      {required Key key,
      required this.mobile,
      required this.tablet,
      required this.desktop,
      required this.reverse})
      : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static bool isReverse(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000 &&
      MediaQuery.of(context).size.height >= 1900;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1100) {
        return desktop;
      } else if (constraints.maxWidth >= 1000 &&
          constraints.maxHeight >= 1900) {
        return reverse;
      } else {
        return mobile;
      }
    });
  }
}
