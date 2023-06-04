import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:lottie/lottie.dart';
import 'package:skyblock/models/colors_utils.dart';
import 'package:skyblock/services/bans_api.dart';
import 'package:skyblock/services/top3_api.dart';
import 'package:skyblock/widgets/footer.dart';
import 'package:skyblock/widgets/our_team.dart';
import 'package:skyblock/widgets/overview_widget.dart';
import 'package:skyblock/utils/scrollcontroller.dart';
import 'package:skyblock/utils/top3_builder.dart';
import 'package:skyblock/widgets/staff_block.dart';

import '../models/bans.dart';
import '../models/eco_ranking.dart';

// ignore: camel_case_types
class HomePage_reverse extends StatefulWidget {
  const HomePage_reverse({super.key});

  @override
  State<HomePage_reverse> createState() => _HomePage_reverse();
}

// ignore: camel_case_types
class _HomePage_reverse extends State<HomePage_reverse> {
  Timer? timer;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => listOfPlayers());
    WidgetsBinding.instance.addPostFrameCallback((_) => RankAPI());
    WidgetsBinding.instance.addPostFrameCallback((_) => getServer());
    WidgetsBinding.instance.addPostFrameCallback((_) => getDiscord());
    WidgetsBinding.instance.addPostFrameCallback((_) => maintenanceAlert());

    timer =
        Timer.periodic(const Duration(seconds: 30), (Timer t) => getServer());
    timer = Timer.periodic(
        const Duration(seconds: 3), (Timer t) => listOfPlayers());
  }

  void getDiscord() async {
    var url = Uri.parse(
        "https://discord.com/api/v9/invites/Y3ZEW3uYFu?with_counts=true&with_expiration=false");
    Response response = await http.get(url);
    int statusCode = response.statusCode;
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    if (statusCode == 200) {
      final dcMaxMembers = jsonData["approximate_member_count"];
      final dcOnlineMembers = jsonData["approximate_presence_count"];
      final id = jsonData["guild"]["id"];
      final icon = jsonData["guild"]["icon"];
      final name = jsonData["guild"]["name"];
      setState(() {
        this.maxMembers = dcMaxMembers;
        this.onlineMembers = dcOnlineMembers;
        this.id = id;
        this.icon = icon;
        this.name = name;
      });
    }
  }

  List<dynamic> playersList = [];

  void listOfPlayers() async {
    var url = Uri.parse("https://php.fireage.pl:8099/onlineplayers");
    Response response = await http.get(url);
    int statusCode = response.statusCode;
    List<dynamic> dataList = jsonDecode(response.body);
    if (statusCode == 200) {
      //final List<dynamic> listCount = dataList[0];
      playersList.clear();
      if (dataList.isNotEmpty) {
        for (int i = 0; i <= (dataList.length - 1);) {
          playersList.add(dataList[i]);
          i++;
        }
      } else {
        playersList.clear();
      }
    }
  }

  void getServer() async {
    var url = Uri.parse("https://php.fireage.pl:8099/onlineplayers");
    Response response = await http.get(url);
    int statusCode = response.statusCode;
    List<dynamic> jsonData = jsonDecode(response.body);
    if (statusCode == 200) {
      final playersOnline = jsonData.length;
      setState(() {
        this.online = true;
        this.playersOnline = playersOnline;
      });
    } else {
      setState(() {
        this.online = false;
      });
    }
  }

  void maintenanceAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          title: Text(
            "UWAGA!",
            style: GoogleFonts.rubik(
                fontSize: 25,
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          content: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Serwer i strona w trakcie budowy!',
                    style: GoogleFonts.rubik(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w300)),
                TextSpan(
                  text: '\nPrzewidywana data startu:',
                  style: GoogleFonts.rubik(
                      fontSize: 20,
                      color: const Color.fromARGB(146, 255, 255, 255)),
                ),
                TextSpan(
                  text: '\n01.05.2023',
                  style: GoogleFonts.rubik(
                      fontSize: 20, color: Color.fromARGB(255, 255, 172, 17)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  List<ecoRanking> top3_bal = [];
  List<bans> banlist = [];

  Future<void> RankAPI() async {
    final response = await RankingAPI.rankAPI();
    setState(() {
      top3_bal = response;
    });
  }

  bool maniakovsky = false;
  bool TakinTu = false;
  bool Gompqka = false;
  bool benio1394 = false;
  bool pvrlpe = false;
  bool Locz_3k = false;

  //ecoTop3
  var ecoTop3_username;
  var ecoTop3_value;

  //DISCORD
  var maxMembers;
  var onlineMembers;
  var id;
  var icon;
  var name;

  //MINECRAFT
  var online;
  var ping;
  var playersOnline;

  @override
  Widget build(BuildContext context) {
    GlobalKey _containerKey = GlobalKey();
    final width = MediaQuery.of(context).size.width * 0.65;
    final height = MediaQuery.of(context).size.height * 0.65;
    final size = MediaQuery.of(context).size * 0.65;
    ScrollController scrollController = SmoothScrollController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(shrinkWrap: true, controller: scrollController, children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/images/background_new2.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(0, 34, 35, 105), BlendMode.overlay)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: width / 20,
                              child: Image.asset(
                                'lib/assets/images/ikonaweb.png',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 120,
                              child: TextButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/bans',
                                  );
                                },
                                label: Text(
                                  'BANY',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          146, 255, 255, 255)),
                                ),
                                icon: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(52, 255, 255, 255),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                  child: const Icon(
                                    Icons.block,
                                    color: Color.fromARGB(148, 255, 255, 255),
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 35,
                              width: 120,
                              child: TextButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/topki',
                                  );
                                },
                                label: Text(
                                  'TOPKI',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          146, 255, 255, 255)),
                                ),
                                icon: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(52, 255, 255, 255),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                  child: Icon(
                                    Icons.equalizer,
                                    color: Color.fromARGB(148, 255, 255, 255),
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 35,
                              width: 100,
                              child: TextButton.icon(
                                onPressed: () {
                                  Scrollable.ensureVisible(
                                    _containerKey.currentContext!,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                label: Text(
                                  'STAFF',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          146, 255, 255, 255)),
                                ),
                                icon: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(52, 255, 255, 255),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                  child: const Icon(
                                    Icons.supervised_user_circle_sharp,
                                    color: Color.fromARGB(148, 255, 255, 255),
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 35,
                              width: 100,
                              child: TextButton.icon(
                                onPressed: () {
                                  html.window.open(
                                      'https://vishop.pl/shop/2930/server/2716',
                                      "_blank");
                                }, //https://vishop.pl/shop/2930/server/2716
                                label: Text(
                                  'SKLEP',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          146, 255, 255, 255)),
                                ),
                                icon: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(52, 255, 255, 255),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(3))),
                                  child: const Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Color.fromARGB(148, 255, 255, 255),
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                html.window.open(
                                    'https://discord.gg/g8J4aByYjV', "_blank");
                              },
                              icon: const Icon(
                                Icons.discord,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.facebook,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.tiktok_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(bottom: height / 5, left: 200, right: 200),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /* SizedBox(
                                  width: width / 1.2,
                                  child: Image.asset(
                                    'lib/assets/images/logo.png',
                                  ),
                                ), */
                                SizedBox(height: height / 35),
                                Text(
                                  'Przygotuj się na najlepsze\ndoznania z gry na skyblocku!',
                                  style: GoogleFonts.rubik(
                                      fontSize: height / 35,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      letterSpacing: 1),
                                ),
                                SizedBox(
                                  height: height / 23,
                                ),
                                Text(
                                  'Dołącz teraz i zacznij przygodę! \nRozwijaj swoją wyspę i przejmuj rynek!',
                                  style: GoogleFonts.rubik(
                                      fontSize: height / 55,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromARGB(
                                          88, 255, 255, 255),
                                      letterSpacing: 1),
                                ),
                                SizedBox(
                                  height: height / 23,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    online == true
                                        ? Lottie.network(
                                            "https://lottie.host/aebdc4ac-e75e-48cd-bf3d-ace520bd8217/QqeEXHmGZc.json",
                                            width: 15,
                                            height: 15,
                                            alignment: Alignment.center,
                                            repeat: true)
                                        : Lottie.network(
                                            "https://assets5.lottiefiles.com/packages/lf20_tlnwbaep.json",
                                            width: 25,
                                            alignment: Alignment.center,
                                            repeat: true),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    online == false
                                        ? Text(
                                            'Offline',
                                            style: GoogleFonts.dosis(
                                                color: const Color.fromARGB(
                                                    255, 240, 88, 88),
                                                fontWeight: FontWeight.w600),
                                          )
                                        : playersOnline != null
                                            ? RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                        text: '$playersOnline',
                                                        style: GoogleFonts.rubik(
                                                            fontSize:
                                                                height / 53,
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                255,
                                                                255,
                                                                255))),
                                                    TextSpan(
                                                      text: ' Graczy online',
                                                      style: GoogleFonts.rubik(
                                                          fontSize: height / 53,
                                                          color: const Color
                                                                  .fromARGB(146,
                                                              255, 255, 255)),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : const SizedBox(
                                                width: 15,
                                                height: 15,
                                                child:
                                                    CircularProgressIndicator()),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height / 23,
                                ),
                                Container(
                                  width: width / 1.8,
                                  height: height / 12,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 145, 0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(7),
                                    ),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width / 6,
                                          height: height / 12,
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 216, 128, 14),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(7),
                                            ),
                                          ),
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.play_arrow_rounded,
                                              color: Colors.white,
                                              size: height / 23,
                                            ),
                                            onPressed: () {
                                              Clipboard.setData(
                                                  const ClipboardData(
                                                      text: 'fireage.pl'));
                                              const snackBar = SnackBar(
                                                content: Text(
                                                    'IP serwera zostało skopiowane!'),
                                                backgroundColor: Colors.orange,
                                              );

                                              // Find the ScaffoldMessenger in the widget tree
                                              // and use it to show a SnackBar.
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                          ),
                                        ),
                                        Text(
                                          '              DOŁĄCZ TERAZ',
                                          style: GoogleFonts.dosis(
                                            fontSize: height / 53,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height / 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'NAJBOGATSI GRACZE',
                                      style: GoogleFonts.rubik(
                                        color: const Color.fromARGB(
                                            132, 255, 255, 255),
                                        fontSize: height / 43,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Tooltip(
                                      message:
                                          'Trójka najbogatszych graczy \nna naszym serwerze!',
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                134, 255, 255, 255),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3))),
                                        child: Center(
                                            child: Text(
                                          '?',
                                          style: GoogleFonts.rubik(
                                              color: Colors.white,
                                              fontSize: 17),
                                          textAlign: TextAlign.center,
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height / 23,
                                ),
                                top3_bal.isEmpty
                                    ? const CircularProgressIndicator()
                                    : SizedBox(
                                        width: 400,
                                        height: 250,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemCount: min(top3_bal.length,
                                                3), // top3_bal.length < 3 ? 2 : top3_bal.length < 2 ? 1 : 3,
                                            itemBuilder: (context, index) {
                                              final top3users = top3_bal[index];
                                              String formatAmount() {
                                                String price =
                                                    "${top3users.balance}";
                                                String priceInText = "";
                                                int counter = 0;
                                                for (int i = (price.length - 1);
                                                    i >= 0;
                                                    i--) {
                                                  counter++;
                                                  String str = price[i];
                                                  if ((counter % 3) != 0 &&
                                                      i != 0) {
                                                    priceInText =
                                                        "$str$priceInText";
                                                  } else if (i == 0) {
                                                    priceInText =
                                                        "$str$priceInText";
                                                  } else {
                                                    priceInText =
                                                        ",$str$priceInText";
                                                  }
                                                }
                                                return priceInText.trim();
                                              }

                                              return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10, right: 10),
                                                  child: top3builder(
                                                      nickname:
                                                          top3users.nickname,
                                                      balance: formatAmount(),
                                                      number: index + 1,
                                                      color: (index == 0
                                                          ? const Color
                                                                  .fromARGB(
                                                              255, 255, 186, 68)
                                                          : index == 1
                                                              ? const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  194,
                                                                  194,
                                                                  194)
                                                              : const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  160,
                                                                  111,
                                                                  66)),
                                                      avatar:
                                                          'https://mc-heads.net/head/${top3users.nickname}'));
                                              //'https://crafatar.com/renders/head/13434e5c-1223-41c2-808c-4fcdd384eaa1'
                                            }),
                                      )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: height / 15),
                child: Image.asset(
                  'lib/assets/images/divider2.png',
                  scale: width / 500,
                ),
              ),
            ],
          ),
        ),
        IntrinsicHeight(
          child: Overview().build(context),
        ),
        team().build(context),
        IntrinsicHeight(
          child: Container(
            color: const Color.fromARGB(255, 11, 14, 17),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'ADMINISTRACJA',
                  style: GoogleFonts.rubik(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: 300,
                    child: Divider(
                      color: Colors.blue.shade200,
                      thickness: 2,
                    )),
                const SizedBox(
                  height: 90,
                ),
                Wrap(
                  key: _containerKey,
                  runSpacing: 25,
                  spacing: 25,
                  children: [
                    staffBlock(
                      nick: 'TakinTu',
                      role: 'CEO',
                      status: playersList.contains('TakinTu')
                          ? 'Online'
                          : 'Offline',
                      color: ColorsUtils().ceo,
                      statusColor: playersList.contains('TakinTu')
                          ? ColorsUtils().staffOnline_true
                          : ColorsUtils().staffOnline_false,
                      avatar: 'TakinTu',
                    ),
                    staffBlock(
                      nick: 'maniakovsky',
                      role: 'CEO',
                      status: playersList.contains('maniakovsky')
                          ? 'Online'
                          : 'Offline',
                      statusColor: playersList.contains('maniakovsky')
                          ? ColorsUtils().staffOnline_true
                          : ColorsUtils().staffOnline_false,
                      avatar: 'maniakovsky',
                      color: ColorsUtils().ceo,
                    ),
                    staffBlock(
                      nick: 'Gompqka',
                      role: 'CEO',
                      status: playersList.contains('Gompqka')
                          ? 'Online'
                          : 'Offline',
                      statusColor: playersList.contains('Gompqka')
                          ? ColorsUtils().staffOnline_true
                          : ColorsUtils().staffOnline_false,
                      avatar: 'Gompqka',
                      color: ColorsUtils().ceo,
                    ),
                    staffBlock(
                      nick: '???',
                      role: 'HEADADMIN',
                      status: '???',
                      statusColor: Colors.grey,
                      avatar: 'MHF_Question',
                      color: ColorsUtils().headadmin,
                    ),
                    staffBlock(
                      nick: '???',
                      role: 'ADMIN',
                      status: '???',
                      statusColor: Colors.grey,
                      avatar: 'MHF_Question',
                      color: ColorsUtils().admin,
                    ),
                    staffBlock(
                      nick: '???',
                      role: 'ADMIN',
                      status: '???',
                      statusColor: Colors.grey,
                      avatar: 'MHF_Question',
                      color: ColorsUtils().admin,
                    ),
                    staffBlock(
                      nick: '???',
                      role: 'MODERATOR',
                      status: '???',
                      statusColor: Colors.grey,
                      avatar: 'MHF_Question',
                      color: ColorsUtils().moderator,
                    ),
                    staffBlock(
                      nick: '???',
                      role: 'MODERATOR',
                      status: '???',
                      statusColor: Colors.grey,
                      avatar: 'MHF_Question',
                      color: ColorsUtils().moderator,
                    ),
                    staffBlock(
                      nick: 'benio1394',
                      role: 'POMOCNIK',
                      status: playersList.contains('benio1394')
                          ? 'Online'
                          : 'Offline',
                      statusColor: playersList.contains('benio1394')
                          ? ColorsUtils().staffOnline_true
                          : ColorsUtils().staffOnline_false,
                      avatar: 'benio1394',
                      color: ColorsUtils().helper,
                    ),
                    staffBlock(
                      nick: 'pvrlpe',
                      role: 'POMOCNIK',
                      status:
                          playersList.contains('pvrlpe') ? 'Online' : 'Offline',
                      statusColor: playersList.contains('pvrlpe')
                          ? ColorsUtils().staffOnline_true
                          : ColorsUtils().staffOnline_false,
                      avatar: 'pvrlpe',
                      color: ColorsUtils().helper,
                    ),
                    staffBlock(
                      nick: 'Locz_3k',
                      role: 'POMOCNIK',
                      status: playersList.contains('Locz_3k')
                          ? 'Online'
                          : 'Offline',
                      statusColor: playersList.contains('Locz_3k')
                          ? ColorsUtils().staffOnline_true
                          : ColorsUtils().staffOnline_false,
                      avatar: 'Locz_3k',
                      color: ColorsUtils().helper,
                    ),
                    staffBlock(
                      nick: 'HanSSe_',
                      role: 'POMOCNIK',
                      status: playersList.contains('HanSSe_')
                          ? 'Online'
                          : 'Offline',
                      statusColor: playersList.contains('HanSSe_')
                          ? ColorsUtils().staffOnline_true
                          : ColorsUtils().staffOnline_false,
                      avatar: 'HanSSe_',
                      color: ColorsUtils().helper,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            )),
          ),
        ),
        footer().build(context)
      ]),
    );
  }
}
