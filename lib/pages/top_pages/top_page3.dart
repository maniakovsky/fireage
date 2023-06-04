import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyblock/services/top_playtime_api.dart';
import '../../models/top_playtime.dart';

class TopPage3 extends StatefulWidget {
  const TopPage3({super.key});

  @override
  State<TopPage3> createState() => TopPage3State();
}

class TopPage3State extends State<TopPage3> {
  Timer? timer;
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => playtimeApi());
    //timer =
    //Timer.periodic(const Duration(seconds: 1), (Timer t) => playtimeApi());
  }

  List<topPlaytime> topPlaytimeList = [];

  Future<void> playtimeApi() async {
    final response = await TopPlaytimeRanking.TopPlaytimeApi();
    setState(() {
      topPlaytimeList = response;
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
      child: Padding(
        padding: const EdgeInsets.only(left: 200, right: 200),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height / 5,
            ),
            Text(
              'TOPKA CZASU GRY',
              style: GoogleFonts.rubik(
                  fontSize: width / 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Text(
              'Najaktywniejsi gracze na serwerze',
              style: GoogleFonts.rubik(
                  fontSize: width / 80,
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
                    child: topPlaytimeList.isNotEmpty
                        ? SizedBox(
                            height: height / 1.27,
                            child: ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: topPlaytimeList.length < listSize
                                    ? topPlaytimeList.length
                                    : listSize,
                                itemBuilder: (context, index) {
                                  final playtime = topPlaytimeList[index];
                                  final duration =
                                      Duration(seconds: playtime.value);
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
                                                        'https://mc-heads.net/avatar/${playtime.username}/100'), //'https://mc-heads.net/avatar/${playtime.username}/100' https://mc-heads.net/head/${playtime.username}'
                                                  ),
                                                  SizedBox(
                                                    width: width / 40,
                                                  ),
                                                  SizedBox(
                                                    width: width / 10,
                                                    child: Text(
                                                      '${playtime.username}',
                                                      style: GoogleFonts.dosis(
                                                          color: const Color
                                                                  .fromARGB(
                                                              169, 0, 0, 0),
                                                          fontSize: height / 40,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width / 12,
                                                    child: Row(
                                                      children: [
                                                        duration.inDays == 1
                                                            ? Text(
                                                                '${duration.inDays} dzień, ${'${duration.inHours % 24}'.padLeft(2, "0")}:${'${duration.inMinutes % 60}'.padLeft(2, "0")}:${'${duration.inSeconds % 60}'.padLeft(2, "0")}',
                                                                style: GoogleFonts.dosis(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        132,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800),
                                                              )
                                                            : Text(
                                                                '${duration.inDays} dni,  ${'${duration.inHours % 24}'.padLeft(2, "0")}:${'${duration.inMinutes % 60}'.padLeft(2, "0")}:${'${duration.inSeconds % 60}'.padLeft(2, "0")}',
                                                                style: GoogleFonts.dosis(
                                                                    color: const Color
                                                                            .fromARGB(
                                                                        132,
                                                                        0,
                                                                        0,
                                                                        0),
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
                                              const Divider(
                                                color: Color.fromARGB(
                                                    181, 0, 0, 0),
                                                thickness: 0.3,
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
                                  if ((topPlaytimeList.length - listSize) >=
                                      list) {
                                    listSize = listSize + list;
                                  } else if ((topPlaytimeList.length -
                                          listSize) <
                                      list) {
                                    topRest = topPlaytimeList.length - listSize;
                                    listSize = listSize + topRest;
                                    print(topRest);
                                  } else {
                                    print('Nie ma więcej wyników.');
                                  }
                                  print(listSize);
                                  btnEnabled = false;
                                  (topPlaytimeList.length - listSize) > 0
                                      ? Timer(
                                          const Duration(seconds: 1),
                                          () => setState(() {
                                                btnEnabled = true;
                                                btnText =
                                                    'Pokaż więcej (${topPlaytimeList.length - listSize})';
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
