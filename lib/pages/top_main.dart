import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyblock/pages/top_pages/top_page1.dart';
import 'package:skyblock/pages/top_pages/top_page2.dart';
import 'package:skyblock/pages/top_pages/top_page3.dart';

import 'package:skyblock/services/bans_api.dart';

import '../models/bans.dart';

class TopMain extends StatefulWidget {
  const TopMain({super.key});

  @override
  State<TopMain> createState() => TopMainState();
}

class TopMainState extends State<TopMain> with TickerProviderStateMixin {
  List<bans> banlist = [];

  Future<void> BansAPI() async {
    final response = await banAPI.bansAPI();
    setState(() {
      banlist = response;
    });
  }

  int _selectedItem = 1;
  final _pages = [const TopPage1(), const TopPage2(), const TopPage3()];
  final _pageController = PageController();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: 30,
        bottom: TabBar(
          padding: const EdgeInsets.only(left: 300, right: 300),
          controller: _tabController,
          onTap: (index) {
            setState(() {
              _selectedItem = index;
              _pageController.animateToPage(_selectedItem,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
            });
          },
          tabs: const <Widget>[
            Tab(
              text: 'WYSPY',
            ),
            Tab(
              text: 'EKONOMIA',
            ),
            Tab(
              text: 'CZAS GRY',
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 11, 14, 17),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/background_new2.png"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(0, 34, 35, 105), BlendMode.overlay)),
        ),
        child: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: (index) {
            setState(() {
              _selectedItem = index;
            });
          },
        ),
      ),
    );
  }
}
