import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Regulamin extends StatefulWidget {
  const Regulamin({super.key});

  @override
  State<Regulamin> createState() => _Regulamin();
}

class _Regulamin extends State<Regulamin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 33, 42),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.amber,
                        backgroundColor: Colors.amber.shade900),
                    child: Text(
                      'SERWER',
                      style: GoogleFonts.rubik(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
            Container(
              width: 1200,
              height: 900,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
