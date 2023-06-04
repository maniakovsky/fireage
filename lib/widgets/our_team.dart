import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class team {
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.65;
    final height = MediaQuery.of(context).size.height * 0.65;

    return MediaQuery.of(context).size.width >= 1000 &&
            MediaQuery.of(context).size.height >= 1900
        ? Container(
            height: MediaQuery.of(context).size.height / 2.4,
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
                  padding:
                      EdgeInsets.only(left: 90, top: height / 20, right: 90),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                        fontSize: height / 25.6,
                                        color: const Color.fromARGB(
                                            255, 31, 27, 78))),
                                TextSpan(
                                  text: '\nDowiedz się kim jesteśmy',
                                  style: GoogleFonts.oswald(
                                      fontWeight: FontWeight.w600,
                                      fontSize: height / 38.6,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                              SizedBox(
                                width: width / 0.7,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  'Jesteśmy trójką przyjaciół, których połączyła wspólna pasja do tworzenia serwerów minecraft. Wyróżnia nas duże doświadczenie i chęć zrobienia czegoś dla graczy. Zarobki mają dla nas drugorzędne znaczenie, chcemy sprostać oczekiwaniom graczy i reinwestować dochody w ciągły rozwój serwera. Naszym celem jest stworzenie niestandardowego Skyblocka, który w przyszłości nie będzie ograniczał się tylko do rozwoju wyspy, ale i eksploracji specjalnie przygotowanego świata.',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              80),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: height / 12.5,
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
                                    fontSize: height / 40,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 31, 27, 78)),
                              ),
                              Text(
                                'Flutter & Dart Developer',
                                style: GoogleFonts.oswald(
                                    fontSize: height / 65,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(166, 0, 0, 0)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: height / 8,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 12.5,
                                child: const Image(
                                    image: NetworkImage(
                                        'https://minotar.net/avatar/TakinTu')),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                              Text(
                                'TakinTu',
                                style: GoogleFonts.oswald(
                                    fontSize: height / 40,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 31, 27, 78)),
                              ),
                              Text(
                                'Java Fullstack Developer',
                                style: GoogleFonts.oswald(
                                    fontSize: height / 65,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(166, 0, 0, 0)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: height / 8,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: height / 12.5,
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
                                    fontSize: height / 40,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 31, 27, 78)),
                              ),
                              Text(
                                'Linux & Databases Administrator',
                                style: GoogleFonts.oswald(
                                    fontSize: height / 65,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(166, 0, 0, 0)),
                                textAlign: TextAlign.center,
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
          )
        : Container(
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
                  padding:
                      EdgeInsets.only(left: 200, top: height / 20, right: 200),
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
                              SizedBox(
                                width: width / 2.5,
                                child: Text(
                                  textAlign: TextAlign.left,
                                  'Jesteśmy trójką przyjaciół, których połączyła wspólna pasja do tworzenia serwerów minecraft. Wyróżnia nas duże doświadczenie i chęć zrobienia czegoś dla graczy. Zarobki mają dla nas drugorzędne znaczenie, chcemy sprostać oczekiwaniom graczy i reinwestować dochody w ciągły rozwój serwera. Naszym celem jest stworzenie niestandardowego Skyblocka, który w przyszłości nie będzie ograniczał się tylko do rozwoju wyspy, ale i eksploracji specjalnie przygotowanego świata.',
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height /
                                              60),
                                ),
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
                                    color:
                                        const Color.fromARGB(255, 31, 27, 78)),
                              ),
                              Text(
                                'Flutter & Dart Developer',
                                style: GoogleFonts.oswald(
                                    fontSize: height / 40,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(166, 0, 0, 0)),
                                textAlign: TextAlign.center,
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
                                        'https://minotar.net/avatar/TakinTu')),
                              ),
                              SizedBox(
                                height: height / 50,
                              ),
                              Text(
                                'TakinTu',
                                style: GoogleFonts.oswald(
                                    fontSize: height / 25,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromARGB(255, 31, 27, 78)),
                              ),
                              Text(
                                'Java Fullstack Developer',
                                style: GoogleFonts.oswald(
                                    fontSize: height / 40,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(166, 0, 0, 0)),
                                textAlign: TextAlign.center,
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
                                    color:
                                        const Color.fromARGB(255, 31, 27, 78)),
                              ),
                              Text(
                                'Linux & Databases Administrator',
                                style: GoogleFonts.oswald(
                                    fontSize: height / 40,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(166, 0, 0, 0)),
                                textAlign: TextAlign.center,
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
          );
  }
}
