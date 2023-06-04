import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:lottie/lottie.dart';

import '../models/bans.dart';
import '../models/colors_utils.dart';
import '../models/eco_ranking.dart';
import '../services/top3_api.dart';
import '../utils/top3_builder.dart';
import '../widgets/staff_block.dart';

// ignore: camel_case_types
class HomePage_mobile extends StatefulWidget {
  const HomePage_mobile({super.key});

  @override
  State<HomePage_mobile> createState() => _HomePage_mobile();
}

// ignore: camel_case_types
class _HomePage_mobile extends State<HomePage_mobile> {
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
    final width = MediaQuery.of(context).size.width * 0.65;
    final height = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox.expand(
            child: ListView(shrinkWrap: true, children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/background_new2.png"),
                //colorFilter: ColorFilter.mode(
                //Color.fromARGB(255, 22, 24, 34), BlendMode.color),
                //opacity: 50,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: PopupMenuButton(
                    tooltip: 'Otwórz menu',
                    onSelected: (result) {},
                    offset: const Offset(-10, 50),
                    elevation: null,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.menu_rounded,
                          color: Colors.amber.shade700,
                          size: 40,
                        )
                      ],
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: [
                            Icon(
                              Icons.shopping_cart_rounded,
                              size: 18,
                              color: Colors.amber.shade700,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'SKLEP',
                              style: GoogleFonts.dosis(
                                  fontSize: 18,
                                  color: Colors.amber.shade700,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(Icons.rule,
                                size: 18, color: Colors.amber.shade700),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'REGULAMIN',
                              style: GoogleFonts.dosis(
                                  fontSize: 18,
                                  color: Colors.amber.shade700,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: height / 5),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 500,
                            child: Image.asset(
                              'lib/assets/images/logo.png',
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: height / 16,
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    html.window.open(
                                        'https://discord.gg/g8J4aByYjV',
                                        "_blank");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          103, 64, 130, 184)),
                                  label: const Text('WBIJ NA DISCORDA',
                                      style: TextStyle(fontSize: 10)),
                                  icon: const Icon(
                                    Icons.discord,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: height / 16,
                                width: 150,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    html.window.open(
                                        'https://discord.gg/g8J4aByYjV',
                                        "_blank");
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          157, 43, 47, 66)),
                                  label: const Text('SKLEP',
                                      style: TextStyle(fontSize: 10)),
                                  icon: const Icon(Icons.shopping_cart_outlined,
                                      size: 15),
                                ),
                              ),
                              SizedBox(
                                height: height / 23,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'NAJLEPSI GRACZE',
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
                                        'Trójka najdoskonalszych graczy \nna naszym serwerze!',
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
                                            color: Colors.white, fontSize: 17),
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
                                      width: 300,
                                      height: 150,
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
                                                padding: const EdgeInsets.only(
                                                    left: 18, right: 18),
                                                child: top3builder(
                                                    nickname:
                                                        top3users.nickname,
                                                    balance: formatAmount(),
                                                    number: index + 1,
                                                    color: (index == 0
                                                        ? const Color.fromARGB(
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
                          ),
                          SizedBox(height: height / 15),
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
                                                      fontSize: height / 43,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255))),
                                              TextSpan(
                                                text: ' Graczy online',
                                                style: GoogleFonts.rubik(
                                                    fontSize: height / 43,
                                                    color: const Color.fromARGB(
                                                        146, 255, 255, 255)),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox(
                                          width: 15,
                                          height: 15,
                                          child: CircularProgressIndicator()),
                              /* Text(
                                                  playersOnline != null
                                                      ? 'Online: $playersOnline'
                                                      : 'Sprawdzanie...',
                                                  style: GoogleFonts.dosis(
                                                      color: const Color.fromARGB(
                                                          255, 101, 240, 88),
                                                      fontWeight: FontWeight.w600),
                                                ), */
                              const SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/page4.png"),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Column(children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'ZARZĄD',
                style: GoogleFonts.oswald(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 31, 27, 78),
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                        child: Image(
                            image: NetworkImage(
                                'https://minotar.net/avatar/maniakovsky')),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'maniakovsky',
                        style: GoogleFonts.oswald(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 31, 27, 78)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: height / 8,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                        child: Image(
                            image: NetworkImage(
                                'https://minotar.net/avatar/TakinTu')),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'TakinTu',
                        style: GoogleFonts.oswald(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 31, 27, 78)),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: height / 8,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                        child: Image(
                            image: NetworkImage(
                                'https://minotar.net/avatar/Gompqka')),
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        'Gompqka',
                        style: GoogleFonts.oswald(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 31, 27, 78)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Nasza drużyna',
                            style: GoogleFonts.oswald(
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                                color: const Color.fromARGB(255, 31, 27, 78))),
                        TextSpan(
                          text: '\nDowiedz się kim jesteśmy',
                          style: GoogleFonts.oswald(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: const Color.fromARGB(255, 119, 114, 98)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Image.asset(
                          'lib/assets/images/divider.png',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: width / 1,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Jesteśmy trójką przyjaciół, których połączyła wspólna pasja do tworzenia serwerów minecraft. Wyróżnia nas duże doświadczenie i chęć zrobienia czegoś dla graczy. Zarobki mają dla nas drugorzędne znaczenie, chcemy sprostać oczekiwaniom graczy i reinwestować dochody w ciągły rozwój serwera. Naszym celem jest stworzenie niestandardowego Skyblocka, który w przyszłości nie będzie ograniczał się tylko do rozwoju wyspy, ale i eksploracji specjalnie przygotowanego świata.',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height / 60),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
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
                        status: playersList.contains('pvrlpe')
                            ? 'Online'
                            : 'Offline',
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
          Container(
            color: const Color.fromARGB(255, 15, 28, 36),
            height: 120,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Copyright © FireAge.pl',
                          style: GoogleFonts.dosis(
                              fontSize: height / 40, color: Colors.white)),
                      TextSpan(
                        text: '\nwebsite creator:',
                        style: GoogleFonts.dosis(
                            fontSize: height / 40, color: Colors.white),
                      ),
                      WidgetSpan(
                          child: SizedBox(
                        height: 19.4,
                        child: TextButton(
                          onPressed: () {
                            html.window.open(
                                'https://discord.gg/g8J4aByYjV', "_blank");
                          },
                          child: Text('maniakovsky',
                              style: GoogleFonts.dosis(
                                  fontSize: height / 40,
                                  color: const Color.fromARGB(
                                      255, 100, 186, 236))),
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            )),
          )
        ])));
  }
}
