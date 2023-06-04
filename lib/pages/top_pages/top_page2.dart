import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyblock/services/top_economy_api.dart';
import '../../models/top_economy.dart';

class TopPage2 extends StatefulWidget {
  const TopPage2({super.key});

  @override
  State<TopPage2> createState() => TopPage2State();
}

class TopPage2State extends State<TopPage2> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => EconomyApi());
  }

  List<topEconomy> topEconomyList = [];

  Future<void> EconomyApi() async {
    final response = await TopEconomyRanking.TopEconomyApi();
    setState(() {
      topEconomyList = response;
    });
  }

  int listSize = 5;
  int list = 5;
  bool btnEnabled = true;
  int topRest = 0;
  var btnText = 'Pokaż więcej';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.65;
    final height = MediaQuery.of(context).size.height * 0.65;
    return IntrinsicHeight(
      child: SizedBox(
        height: 500,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 5,
            ),
            Text(
              'TOPKA EKONOMII',
              style: GoogleFonts.rubik(
                  fontSize: width / 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Text(
              'Najbogatsi gracze na serwerze',
              style: GoogleFonts.rubik(
                  fontSize: width / 80,
                  color: Color.fromARGB(122, 255, 255, 255),
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: width / 4,
                child: Divider(
                  color: Colors.blue.shade200,
                  thickness: 2,
                )),
            SizedBox(
              height: height / 20,
            ),
            Container(
              width: width / 2.5,
              height: height / 1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("lib/assets/ranking/top_background.png"),
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                        Color.fromARGB(0, 34, 35, 105), BlendMode.overlay)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height / 20),
                    child: topEconomyList.isNotEmpty
                        ? SizedBox(
                            height: height / 1.27,
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: topEconomyList.length < listSize
                                    ? topEconomyList.length
                                    : listSize,
                                itemBuilder: (context, index) {
                                  final economy = topEconomyList[index];
                                  String formatAmount() {
                                    String price = "${economy.value}";
                                    String priceInText = "";
                                    int counter = 0;
                                    for (int i = (price.length - 1);
                                        i >= 0;
                                        i--) {
                                      counter++;
                                      String str = price[i];
                                      if ((counter % 3) != 0 && i != 0) {
                                        priceInText = "$str$priceInText";
                                      } else if (i == 0) {
                                        priceInText = "$str$priceInText";
                                      } else {
                                        priceInText = ",$str$priceInText";
                                      }
                                    }
                                    return priceInText.trim();
                                  }

                                  return Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const SizedBox(
                                                    width: 30,
                                                  ),
                                                  SizedBox(
                                                      width: width / 40,
                                                      child: index == 0
                                                          ? Image.asset(
                                                              "lib/assets/ranking/1st.png")
                                                          : index == 1
                                                              ? Image.asset(
                                                                  "lib/assets/ranking/2nd.png")
                                                              : index == 2
                                                                  ? Image.asset(
                                                                      "lib/assets/ranking/3rd.png")
                                                                  : Text(
                                                                      ' #${index + 1} ',
                                                                      style: GoogleFonts.dosis(
                                                                          color: const Color.fromARGB(
                                                                              137,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          fontSize: width /
                                                                              70,
                                                                          fontWeight:
                                                                              FontWeight.w600),
                                                                    )),
                                                  SizedBox(
                                                    width: width / 50,
                                                  ),
                                                  SizedBox(
                                                    width: width / 25,
                                                    child: Image.network(
                                                        'https://mc-heads.net/avatar/${economy.username}/100'),
                                                  ),
                                                  SizedBox(
                                                    width: width / 40,
                                                  ),
                                                  SizedBox(
                                                    width: width / 8,
                                                    child: Text(
                                                      '${economy.username}',
                                                      style: GoogleFonts.dosis(
                                                          color: Color.fromARGB(
                                                              169, 0, 0, 0),
                                                          fontSize: height / 40,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  /* const SizedBox(
                                                    width: 20,
                                                  ), */
                                                  SizedBox(
                                                    width: width / 15,
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          '${formatAmount()} \$',
                                                          style: GoogleFonts
                                                              .dosis(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          51,
                                                                          102,
                                                                          40),
                                                                  fontSize:
                                                                      width /
                                                                          80,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: height / 50,
                                              ),
                                              Divider(
                                                color: Color.fromARGB(
                                                    181, 0, 0, 0),
                                                thickness: 0.5,
                                              )
                                            ],
                                          ),
                                        ),
                                      )); //'https://crafatar.com/renders/head/13434e5c-1223-41c2-808c-4fcdd384eaa1'
                                }),
                          )
                        : const SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator()),
                  ),
                  SizedBox(
                    height: height / 24,
                  ),
                  SizedBox(
                    width: width / 6,
                    height: height / 12,
                    child: ElevatedButton(
                        onPressed: !btnEnabled
                            ? null
                            : () {
                                setState(() {
                                  if ((topEconomyList.length - listSize) >=
                                      list) {
                                    listSize = listSize + list;
                                  } else if ((topEconomyList.length -
                                          listSize) <
                                      list) {
                                    topRest = topEconomyList.length - listSize;
                                    listSize = listSize + topRest;
                                    print(topRest);
                                  } else {
                                    print('Nie ma więcej wyników.');
                                  }
                                  print(listSize);
                                  btnEnabled = false;
                                  (topEconomyList.length - listSize) > 0
                                      ? Timer(
                                          const Duration(seconds: 1),
                                          () => setState(() {
                                                btnEnabled = true;
                                                btnText =
                                                    'Pokaż więcej (${topEconomyList.length - listSize})';
                                              }))
                                      : setState(
                                          () => btnText = 'koniec wyników');
                                });
                              },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 235, 225, 191)),
                        child: Text(
                          btnText,
                          style: GoogleFonts.rubik(
                              fontSize: width / 75,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(181, 0, 0, 0)),
                        )),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
