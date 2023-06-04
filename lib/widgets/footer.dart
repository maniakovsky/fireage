import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:html' as html;

class footer {
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.65;
    final height = MediaQuery.of(context).size.height * 0.65;
    return Container(
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
                      html.window
                          .open('https://discord.gg/g8J4aByYjV', "_blank");
                    },
                    child: Text('maniakovsky',
                        style: GoogleFonts.dosis(
                            fontSize: height / 40,
                            color: const Color.fromARGB(255, 100, 186, 236))),
                  ),
                ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
