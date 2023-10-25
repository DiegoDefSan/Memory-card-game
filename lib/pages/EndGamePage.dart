import 'package:flutter/material.dart';
import 'package:jogo_memoria/pages/BoardGamePage.dart';
import 'package:jogo_memoria/pages/HomePage.dart';
import 'package:jogo_memoria/widgets/Button.dart';
import 'package:jogo_memoria/widgets/Navbar.dart';
import 'package:jogo_memoria/widgets/texts/Header1.dart';
import 'package:jogo_memoria/widgets/texts/Header2.dart';

// ignore: must_be_immutable
class EndGamePage extends StatefulWidget {
  int tries;
  int seconds;
  String name;
  bool withImages;
  bool withNumbers;

  EndGamePage({
    Key? key,
    required this.tries,
    required this.seconds,
    required this.name,
    required this.withImages,
    required this.withNumbers,
  }) : super(key: key);

  @override
  State<EndGamePage> createState() => _EndGamePageState();
}

class _EndGamePageState extends State<EndGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFf5d6a9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Header1(
                      text: "Parabéns, " + widget.name + "!",
                      color: const Color(0xFF000000),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Header2(
                          text: "Tentos: ${widget.tries}",
                          color: const Color(0xFF000000),
                        ),
                        Header2(
                          text: "Segundos: ${widget.seconds}",
                          color: const Color(0xFF000000),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Button(
                          text: "Jogar de novo",
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BoardGamePage(
                                  withImages: widget.withImages,
                                  withNumbers: widget.withNumbers,
                                  name: widget.name,
                                ),
                              ),
                            );
                          },
                          backgroundColor: const Color(0xFFe18544),
                          textColor: const Color(0xFFffffff),
                        ),
                        Button(
                          text: "Voltar para o início",
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          backgroundColor: const Color(0xFFffffff),
                          textColor: const Color(0xFF000000),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
