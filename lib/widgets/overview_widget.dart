import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';

class Overview {
  Widget build(BuildContext context) {
    var header = {
      'Access-Control-Allow-Origin': '*',
      "Accept": "application/json"
    };
    final width = MediaQuery.of(context).size.width * 0.65;
    final height = MediaQuery.of(context).size.height * 0.65;
    return MediaQuery.of(context).size.width >= 1000 &&
            MediaQuery.of(context).size.height >= 1900
        ? Container(
            color: const Color.fromARGB(
                255, 11, 14, 17), //Color.fromARGB(255, 214, 165, 118),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 70, right: 70, top: 50, bottom: 50),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'PRZEGLĄD',
                          style: GoogleFonts.dosis(
                            fontSize: 30,
                            color: const Color.fromARGB(255, 214, 165, 118),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.6,
                        color: Color.fromARGB(255, 214, 165, 118),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height / 2,
                            width: width / 0.7,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 228, 191, 158),
                            )),
                            child: SizedBox(
                              height: height / 2,
                              child: ImageSlideshow(
                                width: height / 1.05,
                                height: height / 3,
                                initialPage: 0,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                onPageChanged: (value) {
                                  if (kDebugMode) {
                                    print('Page changed: $value');
                                  }
                                },
                                autoPlayInterval: 27000,
                                isLoop: true,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/overview/mount3.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/mount4.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/mount2.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/mount1.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: width / 0.7,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'WIERZCHOWCE',
                                          style: GoogleFonts.dosis(
                                              fontWeight: FontWeight.w500,
                                              fontSize: height / 30,
                                              color: const Color.fromARGB(
                                                  255, 228, 191, 158))),
                                      TextSpan(
                                        text:
                                            '\nMityczne stworzenia, takie jak pegazy, smoki lub gryfy, które służą jako doskonałe środki transportu i towarzysze podczas przygód. Zwykle są szybsze i bardziej wytrzymałe niż zwykłe zwierzęta, a także posiadają unikalne umiejętności, takie jak latanie czy oddychanie ogniem. Wierzchowce są często pożądane przez graczy jako cenne elementy gry, a zdobycie jednego z nich często wymaga wykonania trudnych zadań lub osiągnięcia zaawansowanego poziomu w grze.',
                                        style: GoogleFonts.dosis(
                                            fontWeight: FontWeight.w400,
                                            fontSize: height / 40,
                                            color: const Color.fromARGB(
                                                255, 236, 236, 236)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.6,
                        color: Color.fromARGB(255, 233, 233, 233),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height / 2,
                            width: width / 0.7,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 228, 191, 158),
                            )),
                            child: SizedBox(
                              height: height / 2,
                              child: ImageSlideshow(
                                width: height / 1.05,
                                height: height / 3,
                                initialPage: 0,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                onPageChanged: (value) {
                                  if (kDebugMode) {
                                    print('Page changed: $value');
                                  }
                                },
                                autoPlayInterval: 27000,
                                isLoop: true,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/overview/firepass1.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/firepass2.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/firepass3.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width / 0.7,
                            child: RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'FIREPASS',
                                      style: GoogleFonts.dosis(
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 30,
                                          color: const Color.fromARGB(
                                              255, 228, 191, 158))),
                                  TextSpan(
                                    text:
                                        '\nFirepass to system nagród w grze, który pozwala graczom zdobyć różnego rodzaju przedmioty i osiągnięcia. Nagrody są zazwyczaj umieszczone w specjalnych poziomach, do których gracze mają dostęp po ukończeniu określonych wyzwań lub zadań. Mogą to być np. kosmetyczne przedmioty, specjalne itemy lub inne elementy poprawiające doświadczenie gry. Występuje w dwóch wersjach - podstawowej oraz Premium.',
                                    style: GoogleFonts.dosis(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height / 40,
                                        color: const Color.fromARGB(
                                            255, 236, 236, 236)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.6,
                        color: Color.fromARGB(255, 233, 233, 233),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height / 2,
                            width: width / 0.7,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 228, 191, 158),
                            )),
                            child: SizedBox(
                              height: height / 2,
                              child: ImageSlideshow(
                                width: height / 1.05,
                                height: height / 3,
                                initialPage: 0,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                onPageChanged: (value) {
                                  if (kDebugMode) {
                                    print('Page changed: $value');
                                  }
                                },
                                autoPlayInterval: 27000,
                                isLoop: true,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/overview/skrzydła1.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/skrzydła2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width / 0.7,
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'SKRZYDŁA',
                                      style: GoogleFonts.dosis(
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 30,
                                          color: const Color.fromARGB(
                                              255, 228, 191, 158))),
                                  TextSpan(
                                    text:
                                        '\nSkrzydła jako dodatek wizualny to element, który dodaje postaci magii i mistycyzmu. Skrzydła te mogą mieć różne kształty, kolory i zdobienia, często odwołujące się do motywów fantastycznych. Nosząc te skrzydła, postać nabiera niepowtarzalnego wyglądu, przyciągając uwagę innych graczy i dodając do Twej postaci dodatkowego elementu wizualnego uroku.',
                                    style: GoogleFonts.dosis(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height / 40,
                                        color: const Color.fromARGB(
                                            255, 236, 236, 236)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.6,
                        color: Color.fromARGB(255, 233, 233, 233),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height / 2,
                            width: width / 0.7,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 228, 191, 158),
                            )),
                            child: SizedBox(
                              height: height / 2,
                              child: ImageSlideshow(
                                width: height / 1.05,
                                height: height / 3,
                                initialPage: 0,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                onPageChanged: (value) {
                                  if (kDebugMode) {
                                    print('Page changed: $value');
                                  }
                                },
                                autoPlayInterval: 27000,
                                isLoop: false,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/overview/wydra.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width / 0.7,
                            child: RichText(
                              textAlign: TextAlign.end,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'WYDRA',
                                      style: GoogleFonts.dosis(
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 30,
                                          color: const Color.fromARGB(
                                              255, 228, 191, 158))),
                                  TextSpan(
                                    text:
                                        '\nMały, słodki zwierzak, który jest dostępny jako darmowa nagroda po 10 godzinach spędzonych w grze. Jest to miły towarzysz, który może umilić rozrywkę na wyspie lub w innej lokacji w grze. Wydra zwykle nie posiada specjalnych umiejętności lub zdolności, ale jest popularnym elementem gry ze względu na swoją uroczą i przyjazną naturę.',
                                    style: GoogleFonts.dosis(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height / 40,
                                        color: const Color.fromARGB(
                                            255, 236, 236, 236)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container(
            color: const Color.fromARGB(
                255, 11, 14, 17), //Color.fromARGB(255, 214, 165, 118),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 200, right: 200, top: 50, bottom: 50),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'PRZEGLĄD',
                          style: GoogleFonts.dosis(
                            fontSize: 30,
                            color: const Color.fromARGB(255, 214, 165, 118),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.6,
                        color: Color.fromARGB(255, 214, 165, 118),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height / 2,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 228, 191, 158),
                            )),
                            child: SizedBox(
                              height: height / 3,
                              child: ImageSlideshow(
                                width: height / 1.05,
                                height: height / 3,
                                initialPage: 0,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                onPageChanged: (value) {
                                  if (kDebugMode) {
                                    print('Page changed: $value');
                                  }
                                },
                                autoPlayInterval: 27000,
                                isLoop: true,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/overview/mount3.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/mount4.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/mount2.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/mount1.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: width / 2,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'WIERZCHOWCE',
                                          style: GoogleFonts.dosis(
                                              fontWeight: FontWeight.w500,
                                              fontSize: height / 25,
                                              color: const Color.fromARGB(
                                                  255, 228, 191, 158))),
                                      TextSpan(
                                        text:
                                            '\nMityczne stworzenia, takie jak pegazy, smoki lub gryfy, które służą jako doskonałe środki transportu i towarzysze podczas przygód. Zwykle są szybsze i bardziej wytrzymałe niż zwykłe zwierzęta, a także posiadają unikalne umiejętności, takie jak latanie czy oddychanie ogniem. Wierzchowce są często pożądane przez graczy jako cenne elementy gry, a zdobycie jednego z nich często wymaga wykonania trudnych zadań lub osiągnięcia zaawansowanego poziomu w grze.',
                                        style: GoogleFonts.dosis(
                                            fontWeight: FontWeight.w400,
                                            fontSize: height / 30,
                                            color: const Color.fromARGB(
                                                255, 236, 236, 236)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.6,
                        color: Color.fromARGB(255, 233, 233, 233),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height / 2,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 228, 191, 158),
                            )),
                            child: SizedBox(
                              height: height / 3,
                              child: ImageSlideshow(
                                width: height / 1.05,
                                height: height / 3,
                                initialPage: 0,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                onPageChanged: (value) {
                                  if (kDebugMode) {
                                    print('Page changed: $value');
                                  }
                                },
                                autoPlayInterval: 27000,
                                isLoop: true,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/overview/firepass1.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/firepass2.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/firepass3.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: width / 2,
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'FIREPASS',
                                      style: GoogleFonts.dosis(
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 25,
                                          color: const Color.fromARGB(
                                              255, 228, 191, 158))),
                                  TextSpan(
                                    text:
                                        '\nFirepass to system nagród w grze, który pozwala graczom zdobyć różnego rodzaju przedmioty i osiągnięcia. Nagrody są zazwyczaj umieszczone w specjalnych poziomach, do których gracze mają dostęp po ukończeniu określonych wyzwań lub zadań. Mogą to być np. kosmetyczne przedmioty, specjalne itemy lub inne elementy poprawiające doświadczenie gry. Występuje w dwóch wersjach - podstawowej oraz Premium.',
                                    style: GoogleFonts.dosis(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height / 30,
                                        color: const Color.fromARGB(
                                            255, 236, 236, 236)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.6,
                        color: Color.fromARGB(255, 233, 233, 233),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height / 2,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 228, 191, 158),
                            )),
                            child: SizedBox(
                              height: height / 3,
                              child: ImageSlideshow(
                                width: height / 1.05,
                                height: height / 3,
                                initialPage: 0,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                onPageChanged: (value) {
                                  if (kDebugMode) {
                                    print('Page changed: $value');
                                  }
                                },
                                autoPlayInterval: 27000,
                                isLoop: true,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/overview/skrzydła1.png',
                                    fit: BoxFit.cover,
                                  ),
                                  Image.asset(
                                    'lib/assets/images/overview/skrzydła2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: width / 2,
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'SKRZYDŁA',
                                      style: GoogleFonts.dosis(
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 25,
                                          color: const Color.fromARGB(
                                              255, 228, 191, 158))),
                                  TextSpan(
                                    text:
                                        '\nSkrzydła jako dodatek wizualny to element, który dodaje postaci magii i mistycyzmu. Skrzydła te mogą mieć różne kształty, kolory i zdobienia, często odwołujące się do motywów fantastycznych. Nosząc te skrzydła, postać nabiera niepowtarzalnego wyglądu, przyciągając uwagę innych graczy i dodając do Twej postaci dodatkowego elementu wizualnego uroku.',
                                    style: GoogleFonts.dosis(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height / 30,
                                        color: const Color.fromARGB(
                                            255, 236, 236, 236)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Divider(
                        thickness: 0.6,
                        color: Color.fromARGB(255, 233, 233, 233),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height / 2,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(255, 228, 191, 158),
                            )),
                            child: SizedBox(
                              height: height / 3,
                              child: ImageSlideshow(
                                width: height / 1.05,
                                height: height / 3,
                                initialPage: 0,
                                indicatorColor: Colors.blue,
                                indicatorBackgroundColor: Colors.grey,
                                onPageChanged: (value) {
                                  if (kDebugMode) {
                                    print('Page changed: $value');
                                  }
                                },
                                autoPlayInterval: 27000,
                                isLoop: false,
                                children: [
                                  Image.asset(
                                    'lib/assets/images/overview/wydra.png',
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: width / 2,
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'WYDRA',
                                      style: GoogleFonts.dosis(
                                          fontWeight: FontWeight.w500,
                                          fontSize: height / 25,
                                          color: const Color.fromARGB(
                                              255, 228, 191, 158))),
                                  TextSpan(
                                    text:
                                        '\nMały, słodki zwierzak, który jest dostępny jako darmowa nagroda po 10 godzinach spędzonych w grze. Jest to miły towarzysz, który może umilić rozrywkę na wyspie lub w innej lokacji w grze. Wydra zwykle nie posiada specjalnych umiejętności lub zdolności, ale jest popularnym elementem gry ze względu na swoją uroczą i przyjazną naturę.',
                                    style: GoogleFonts.dosis(
                                        fontWeight: FontWeight.w400,
                                        fontSize: height / 30,
                                        color: const Color.fromARGB(
                                            255, 236, 236, 236)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
