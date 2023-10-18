import 'package:flutter/material.dart';
import 'package:jogo_memoria/widgets/Button.dart';
import 'package:jogo_memoria/widgets/Navbar.dart';
import 'package:jogo_memoria/widgets/texts/Header1.dart';
import 'package:jogo_memoria/widgets/texts/Header2.dart';

class EndGamePage extends StatefulWidget {
  const EndGamePage({super.key});

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
                color: Color(0xFF03045e),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Header1(
                      text: "Parabéns!",
                      color: Color(0xFFd0d8ff),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        Header2(
                          text: "Tentos: 0",
                          color: Color(0xFFd0d8ff),
                        ),
                        Header2(
                          text: "Tempo: 00:00:00",
                          color: Color(0xFFd0d8ff),
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
                          onPressed: () {},
                          backgroundColor: Color(0xFF7b87ff),
                          textColor: Color(0xFFd0d8ff),
                        ),
                        Button(
                          text: "Voltar para o início",
                          onPressed: () {},
                          backgroundColor: Color(0xFFd0d8ff),
                          textColor: Color(0xFF03045e),
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
