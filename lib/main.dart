import 'package:flutter/material.dart';
import 'package:skyblock/pages/bans_page.dart';
import 'package:skyblock/pages/rekrutacja.dart';
import 'package:skyblock/pages/top_main.dart';
import 'package:skyblock/responsive_checker.dart';
import 'pages/regulamin.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyAppPage());
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => MyApp();
}

class MyApp extends State<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FireAge.pl',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const HomePage(),

      routes: {
        '/': (context) => const Responsive_checker(),
        '/regulamin': (context) => const Regulamin(),
        '/rekrutacja': (context) => const Rekrutacja(),
        '/bans': (context) => const BansPage(),
        '/topki': (context) => const TopMain(),
      },
    );
  }
}
