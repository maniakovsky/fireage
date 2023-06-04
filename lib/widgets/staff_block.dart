import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class staffBlock extends StatefulWidget {
  final nick;
  final role;
  final avatar;
  final color;
  final status;
  final statusColor;
  const staffBlock(
      {super.key,
      required this.status,
      required this.statusColor,
      required this.nick,
      required this.role,
      required this.avatar,
      required this.color});

  @override
  State<staffBlock> createState() => _staffBlock();
}

class _staffBlock extends State<staffBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 320,
      color: const Color.fromARGB(255, 18, 30, 37),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: SizedBox(
              height: 70,
              width: 70,
              child: widget.nick != 'maniakovsky'
                  ? Image.network('https://mc-heads.net/head/${widget.avatar}')
                  : Image.network(
                      'https://crafatar.com/renders/head/13434e5c122341c2808c4fcdd384eaa1?overlay'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20, bottom: 15),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${widget.nick}',
                    style: GoogleFonts.rubik(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14),
                  ),
                  TextSpan(
                    text: '\n${widget.role}\n',
                    style: GoogleFonts.rubik(color: widget.color, fontSize: 14),
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    width: 170,
                    child: Text(
                      '${widget.status}',
                      style: GoogleFonts.rubik(
                          color: widget.statusColor, fontSize: 12),
                    ),
                  ))
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
    );
  }
}
