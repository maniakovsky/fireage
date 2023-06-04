import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyblock/services/bans_api.dart';
import '../models/bans.dart';

class BansPage extends StatefulWidget {
  const BansPage({super.key});

  @override
  State<BansPage> createState() => BansPageWidget();
}

class BansPageWidget extends State<BansPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => bansAPI());
  }

  List<bans> banlist = [];

  Future<void> bansAPI() async {
    final response = await banAPI.bansAPI();
    setState(() {
      banlist = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: IntrinsicHeight(
        child: Container(
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assets/images/background_new2.png"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(0, 34, 35, 105), BlendMode.overlay)),
          ),
          child: Center(
              child: Column(
            children: [
              SizedBox(
                height: height / 20,
              ),
              Text(
                'BANY',
                style: GoogleFonts.rubik(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              Text(
                'Ostatnio zbanowani gracze',
                style: GoogleFonts.rubik(
                    fontSize: 15,
                    color: const Color.fromARGB(122, 255, 255, 255),
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
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
              SizedBox(
                width: width / 1.95,
                height: height / 10,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    SizedBox(
                      width: width / 17,
                      child: Text(
                        'Gracz:',
                        style: GoogleFonts.dosis(
                            color: Colors.white, fontSize: width / 100),
                      ),
                    ),
                    const SizedBox(
                      width: 90,
                    ),
                    SizedBox(
                      width: width / 13,
                      child: Text(
                        'Zbanował:',
                        style: GoogleFonts.dosis(
                            color: Colors.white, fontSize: width / 100),
                      ),
                    ),
                    SizedBox(
                      width: width / 4.8,
                      child: Text(
                        'Powód bana:',
                        style: GoogleFonts.dosis(
                            color: Colors.white, fontSize: width / 100),
                      ),
                    ),
                    SizedBox(
                      width: width / 14,
                      child: Text(
                        'Typ bana:',
                        style: GoogleFonts.dosis(
                            color: Colors.white, fontSize: width / 100),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: width / 1.95,
                height: height / 2,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: banlist.length,
                    itemBuilder: (context, index) {
                      final bans = banlist[index];

                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 10),
                          child: Container(
                            color: const Color.fromARGB(131, 9, 27, 43),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70,
                                    height: 70,
                                    child: Image.network(
                                        'https://mc-heads.net/head/${bans.name}'),
                                  ),
                                  SizedBox(
                                    width: width / 90,
                                  ),
                                  SizedBox(
                                    width: width / 20,
                                    child: Text(
                                      '${bans.name}',
                                      style: GoogleFonts.dosis(
                                          color: Colors.white,
                                          fontSize: width / 100),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 90,
                                  ),
                                  SizedBox(
                                    width: width / 13,
                                    child: Text(
                                      '${bans.operator}',
                                      style: GoogleFonts.dosis(
                                          color: Colors.white,
                                          fontSize: width / 100),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width / 4.75,
                                    child: Text(
                                      '${bans.reason}',
                                      style: GoogleFonts.dosis(
                                          color: const Color.fromARGB(
                                              136, 255, 255, 255),
                                          fontSize: width / 100),
                                    ),
                                  ),
                                  SizedBox(
                                      width: width / 16,
                                      child: bans.punishmentType == 'BAN'
                                          ? Text(
                                              'PERMANENTNY',
                                              style: GoogleFonts.dosis(
                                                  color: const Color.fromARGB(
                                                      136, 255, 255, 255),
                                                  fontSize: width / 100),
                                            )
                                          : Text(
                                              'TYMCZASOWY',
                                              style: GoogleFonts.dosis(
                                                  color: const Color.fromARGB(
                                                      136, 255, 255, 255),
                                                  fontSize: width / 100),
                                            )),
                                ],
                              ),
                            ),
                          )); //'https://crafatar.com/renders/head/13434e5c-1223-41c2-808c-4fcdd384eaa1'
                    }),
              ),
              SizedBox(
                height: height / 50,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade700),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_sharp),
                  label: Text(
                    'WRÓĆ',
                    style: GoogleFonts.dosis(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: height / 20,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
