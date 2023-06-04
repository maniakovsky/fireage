import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class HomePage_tablet extends StatefulWidget {
  const HomePage_tablet({super.key});

  @override
  State<HomePage_tablet> createState() => _HomePage_tablet();
}

// ignore: camel_case_types
class _HomePage_tablet extends State<HomePage_tablet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getServer());
  }

  void getServer() async {
    var url = Uri.parse("https://api.mcstatus.io/v2/status/java/fireage.pl");
    Response response = await http.get(url);
    int statusCode = response.statusCode;
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    this.jsonData = jsonData;
    if (statusCode == 200) {
      final online = jsonData["online"];
      if (online == true) {
        final playersOnline = jsonData["version"]["name_clean"];
        if (kDebugMode) {
          print(playersOnline);
        }
        setState(() {
          this.playersOnline = playersOnline;
        });
      } else {
        setState(() {
          this.online = online;
        });
      }
    }
  }

  var online;
  var ping;
  var jsonData;
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
                  image: AssetImage("lib/assets/images/background.png"),
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
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 35,
                                width: 100,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/rekrutacja',
                                    );
                                  },
                                  child: Text(
                                    'REKRUTACJA',
                                    style: GoogleFonts.dosis(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.amber.shade900),
                                  ),
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 35,
                              width: 100,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/regulamin',
                                  );
                                },
                                child: Text(
                                  'REGULAMIN',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.amber.shade900),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 35,
                              width: 100,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(160, 252, 132, 40),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 15,
                                ),
                                label: Text(
                                  'SKLEP',
                                  style: GoogleFonts.dosis(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 35,
                              width: 100,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/regulamin',
                                  );
                                },
                                child: Text(
                                  'ADMINISTRACJA',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          255, 255, 111, 0)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              height: 35,
                              width: 100,
                              child: TextButton(
                                onPressed: () {
                                  html.window.open(
                                      'https://discord.gg/g8J4aByYjV',
                                      "_blank");
                                },
                                child: Text(
                                  'DISCORD',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          255, 255, 111, 0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: height / 5),
                        child: Column(
                          children: [
                            SizedBox(
                              width: width / 2,
                              child: Image.asset(
                                'lib/assets/images/logo.png',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height / 16,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      html.window.open(
                                          'https://discord.gg/g8J4aByYjV',
                                          "_blank");
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            103, 64, 130, 184)),
                                    label: Text('WBIJ NA DISCORDA',
                                        style: TextStyle(fontSize: width / 90)),
                                    icon: Icon(
                                      Icons.discord,
                                      size: width / 50,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width / 35,
                                ),
                                SizedBox(
                                  height: height / 16,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      html.window.open(
                                          'https://discord.gg/g8J4aByYjV',
                                          "_blank");
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            157, 43, 47, 66)),
                                    label: Text('SKLEP',
                                        style: TextStyle(fontSize: width / 90)),
                                    icon: Icon(Icons.shopping_cart_outlined,
                                        size: width / 50),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height / 35),
                            TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                      const ClipboardData(text: 'fireage.pl'));
                                  const snackBar = SnackBar(
                                    content:
                                        Text('IP serwera zostało skopiowane!'),
                                    backgroundColor: Colors.orange,
                                  );

                                  // Find the ScaffoldMessenger in the widget tree
                                  // and use it to show a SnackBar.
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Text(
                                  'SKOPIUJ IP SERWERA',
                                  style: GoogleFonts.dosis(
                                      fontWeight: FontWeight.w600,
                                      fontSize: height / 40),
                                )),
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
                                    : Text(
                                        playersOnline != null
                                            ? '$playersOnline'
                                            : 'Sprawdzanie...',
                                        style: GoogleFonts.dosis(
                                            color: const Color.fromARGB(
                                                255, 101, 240, 88),
                                            fontWeight: FontWeight.w600),
                                      ),
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
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/images/page4.png"),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 200, top: height / 20, right: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Nasza drużyna',
                                      style: GoogleFonts.oswald(
                                          fontWeight: FontWeight.w900,
                                          fontSize: height / 12.6,
                                          color: const Color.fromARGB(
                                              255, 31, 27, 78))),
                                  TextSpan(
                                    text: '\nDowiedz się kim jesteśmy',
                                    style: GoogleFonts.oswald(
                                        fontWeight: FontWeight.w600,
                                        fontSize: height / 28.6,
                                        color: const Color.fromARGB(
                                            255, 119, 114, 98)),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Image.asset(
                                    'lib/assets/images/divider.png',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  textAlign: TextAlign.left,
                                  'Jesteśmy trójką przyjaciół, których połączyła wspólna pasja\ndo tworzenia serwerów w minecrafcie. Wyróżnia nas ogromna wiedza,\noraz doświadczenie w tworzeniu tego typu projektów.\nW skład zarządu wchodzi: Gonti, główny założyciel\ni osoba która trzyma wszystko w kupie. Maniak, współwłaściciel,\nweb developer, grafik, kreatywna osobowość.\nGompka, główny technik serwera, osoba dzięki której\nrozgrywka dopięta jest na ostatni guzik.',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              60),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: height / 6.5,
                                  child: const Image(
                                      image: NetworkImage(
                                          'https://minotar.net/avatar/maniakovsky')),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Text(
                                  'maniakovsky',
                                  style: GoogleFonts.oswald(
                                      fontSize: height / 25,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 31, 27, 78)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: height / 8,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: height / 6.5,
                                  child: const Image(
                                      image: NetworkImage(
                                          'https://minotar.net/avatar/xGonti')),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Text(
                                  'xGonti',
                                  style: GoogleFonts.oswald(
                                      fontSize: height / 25,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 31, 27, 78)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: height / 8,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: height / 6.5,
                                  child: const Image(
                                      image: NetworkImage(
                                          'https://minotar.net/avatar/Gompqka')),
                                ),
                                SizedBox(
                                  height: height / 50,
                                ),
                                Text(
                                  'Gompqka',
                                  style: GoogleFonts.oswald(
                                      fontSize: height / 25,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(
                                          255, 31, 27, 78)),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 15, 28, 36),
              height: height / 8,
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
                          text: '\nwebsite creator:\n',
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
          ]),
        ));
  }
}
