import 'package:flutter/cupertino.dart';

class Ranking extends StatefulWidget {
  final nick;
  final avatar;
  final balance;
  final place;
  const Ranking(
      {super.key,
      required this.place,
      required this.nick,
      required this.balance,
      required this.avatar});

  @override
  State<Ranking> createState() => _Ranking();
}

class _Ranking extends State<Ranking> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 60,
          width: 60,
          child: Image.network('https://mc-heads.net/head/${widget.avatar}'),
        ),
        const SizedBox(width: 20),
        Container(
          width: 60,
          height: 60,
          color: const Color.fromARGB(115, 255, 186, 68),
          child: Text('${widget.place}'),
        ),
        Container(
          width: 350,
          height: 60,
          color: const Color.fromARGB(115, 43, 42, 27),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('${widget.nick}'),
          ),
        ),
        Container(
          width: 140,
          height: 60,
          color: const Color.fromARGB(115, 63, 75, 179),
          child: Text('${widget.balance}'),
        ),
      ],
    );
  }
}
