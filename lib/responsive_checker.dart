import 'package:flutter/material.dart';
import 'package:skyblock/models/responsive.dart';
import 'package:skyblock/pages/homepage_desktop.dart';
import 'package:skyblock/pages/homepage_mobile.dart';
import 'pages/homepage_reverse.dart';

// ignore: camel_case_types
class Responsive_checker extends StatefulWidget {
  const Responsive_checker({super.key});

  @override
  State<Responsive_checker> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Responsive_checker> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomePage_mobile(),
      tablet: HomePage_desktop(),
      desktop: HomePage_desktop(),
      reverse: HomePage_reverse(),
      key: Key(''),
    );
  }
}
