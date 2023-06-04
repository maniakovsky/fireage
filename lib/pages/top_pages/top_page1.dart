import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyblock/models/top_islands.dart';
import 'package:skyblock/services/top_economy_api.dart';
import 'package:skyblock/services/top_islands_api.dart';

class TopPage1 extends StatefulWidget {
  const TopPage1({super.key});

  @override
  State<TopPage1> createState() => TopPage1State();
}

class TopPage1State extends State<TopPage1> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => islandApi());
  }

  List<topIslands> topIslandsList = [];

  Future<void> islandApi() async {
    final response = await TopIslandRanking.TopIslandsApi();
    setState(() {
      topIslandsList = response;
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
    var resp = MediaQuery.of(context).size.width >= 1000 &&
        MediaQuery.of(context).size.height >= 1900;
    return IntrinsicHeight(
      child: Padding(
        padding: resp
            ? const EdgeInsets.only(left: 30, right: 30)
            : const EdgeInsets.only(left: 200, right: 200),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 5,
            ),
            Text(
              'TOPKA WYSP',
              style: GoogleFonts.rubik(
                  fontSize: resp ? width / 15 : width / 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Text(
              'Najlepsze wyspy na serwerze',
              style: GoogleFonts.rubik(
                  fontSize: resp ? width / 30 : width / 80,
                  color: const Color.fromARGB(122, 255, 255, 255),
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
              width: resp ? width / 0.8 : width / 2.5,
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
                    child: topIslandsList.isNotEmpty
                        ? SizedBox(
                            height: height / 1.27,
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: topIslandsList.length < listSize
                                    ? topIslandsList.length
                                    : listSize,
                                itemBuilder: (context, index) {
                                  final islands = topIslandsList[index];

                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
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
                                                      width: resp
                                                          ? width / 15
                                                          : width / 40,
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
                                                    width: resp
                                                        ? width / 8
                                                        : width / 25,
                                                    child: Image.network(
                                                        'https://mc-heads.net/avatar/${islands.username}/100'),
                                                  ),
                                                  SizedBox(
                                                    width: width / 40,
                                                  ),
                                                  SizedBox(
                                                    width: resp
                                                        ? width / 1.5
                                                        : width / 8,
                                                    child: Text(
                                                      '${islands.username}',
                                                      style: GoogleFonts.dosis(
                                                          color: const Color
                                                                  .fromARGB(
                                                              169, 0, 0, 0),
                                                          fontSize: resp
                                                              ? height / 35
                                                              : height / 40,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: width / 40),
                                                    child: SizedBox(
                                                      width: resp
                                                          ? width / 10
                                                          : width / 25,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            'LVL: ',
                                                            style: GoogleFonts.dosis(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    169,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                fontSize: resp
                                                                    ? width / 20
                                                                    : width /
                                                                        80),
                                                          ),
                                                          Text(
                                                            '${islands.value}',
                                                            style: GoogleFonts.dosis(
                                                                color: const Color
                                                                        .fromARGB(
                                                                    132,
                                                                    0,
                                                                    0,
                                                                    0),
                                                                fontSize: resp
                                                                    ? width / 20
                                                                    : width /
                                                                        80,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: height / 50,
                                              ),
                                              const Divider(
                                                color: Color.fromARGB(
                                                    181, 0, 0, 0),
                                                thickness: 0.5,
                                              ),
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
                                  if ((topIslandsList.length - listSize) >=
                                      list) {
                                    listSize = listSize + list;
                                  } else if ((topIslandsList.length -
                                          listSize) <
                                      list) {
                                    topRest = topIslandsList.length - listSize;
                                    listSize = listSize + topRest;
                                    print(topRest);
                                  } else {
                                    print('Nie ma więcej wyników.');
                                  }
                                  print(listSize);
                                  btnEnabled = false;
                                  (topIslandsList.length - listSize) > 0
                                      ? Timer(
                                          const Duration(seconds: 1),
                                          () => setState(() {
                                                btnEnabled = true;
                                                btnText =
                                                    'Pokaż więcej (${topIslandsList.length - listSize})';
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
