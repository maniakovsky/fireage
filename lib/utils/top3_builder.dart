import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyblock/models/eco_ranking.dart';

class top3builder extends StatefulWidget {
  final nickname;
  final balance;
  final avatar;
  final number;
  final color;
  const top3builder(
      {super.key,
      required this.color,
      required this.nickname,
      required this.balance,
      required this.avatar,
      required this.number});

  @override
  State<top3builder> createState() => top3();
}

class top3 extends State<top3builder> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1000 &&
            MediaQuery.of(context).size.height >= 1900
        ? Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    Image.network('${widget.avatar}'),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3))),
                      child: Center(
                        child: Text(
                          '${widget.number}',
                          style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${widget.nickname}',
                style: GoogleFonts.rubik(
                    color: const Color.fromARGB(129, 255, 255, 255),
                    fontSize: 22),
              ),
              Text(
                '${widget.balance} \$',
                style: GoogleFonts.rubik(
                    color: const Color.fromARGB(129, 41, 255, 52),
                    fontSize: 22),
              ),
            ],
          )
        : Column(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: Stack(
                  children: [
                    Image.network('${widget.avatar}'),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3))),
                      child: Center(
                        child: Text(
                          '${widget.number}',
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${widget.nickname}',
                style: GoogleFonts.rubik(
                    color: const Color.fromARGB(129, 255, 255, 255),
                    fontSize: 12),
              ),
              Text(
                '${widget.balance} \$',
                style: GoogleFonts.rubik(
                    color: const Color.fromARGB(129, 41, 255, 52),
                    fontSize: 12),
              ),
            ],
          );
  }
}
