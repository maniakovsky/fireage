import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class Rekrutacja extends StatefulWidget {
  const Rekrutacja({super.key});

  @override
  State<Rekrutacja> createState() => _Rekrutacja();
}

class _Rekrutacja extends State<Rekrutacja> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.65;
    final height = MediaQuery.of(context).size.height * 0.65;
    return Scaffold(
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/page1.png"),
            fit: BoxFit.fill,
            alignment: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 200, top: height / 6, right: 100),
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
                                text: 'Dołącz do naszej załogi!',
                                style: GoogleFonts.oswald(
                                    fontWeight: FontWeight.w900,
                                    fontSize: height / 12.6,
                                    color:
                                        const Color.fromARGB(255, 31, 27, 78))),
                            TextSpan(
                              text: '\nDowiedz się jak wejść w nasze szeregi',
                              style: GoogleFonts.oswald(
                                  fontWeight: FontWeight.w600,
                                  fontSize: height / 28.6,
                                  color:
                                      const Color.fromARGB(255, 119, 114, 98)),
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
                            'Szukamy osób, które mają doświadczenie w zarządzaniu graczami\ni które będą nas wspierać, oraz odciążać z obowiązku\nniesienia pomocy naszym graczom, byśmy mogli\nzająć się stroną techniczną serwera i dalszym jego rozwojem.\nJeśli uważasz, że jesteś osobą kompetentą do wspierania naszej\nspołeczności - już teraz walnij w guzik i złóż podanie!',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height / 60),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width / 4.3),
                            child: SizedBox(
                              width: width / 6,
                              height: height / 20,
                              child: ElevatedButton(
                                onPressed: () {
                                  html.window.open(
                                      'https://rekru.fireage.pl', "_blank");
                                },
                                child: Text(
                                  'ZŁÓŻ PODANIE',
                                  style: GoogleFonts.dosis(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              60),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 4,
                        child: const Image(
                            image: AssetImage(
                              "lib/assets/images/papier2.png",
                            ),
                            filterQuality: FilterQuality.high),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
