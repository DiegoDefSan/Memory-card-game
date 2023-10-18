import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jogo_memoria/utils/Game.dart';
import 'package:jogo_memoria/widgets/InfoContainter.dart';
import 'package:jogo_memoria/widgets/Navbar.dart';

class BoardGamePage extends StatefulWidget {
  const BoardGamePage({super.key});

  @override
  State<BoardGamePage> createState() => _BoardGamePageState();
}

class _BoardGamePageState extends State<BoardGamePage>
    with TickerProviderStateMixin {
  Game game = Game(true, false);
  Ticker? _ticker;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    game.initGame();

    game.setFlipAllCards();

    Future.delayed(const Duration(milliseconds: 6000), () {
      setState(() {
        game.setFlipAllCards();
      });
    });

    _startTicker();
  }

  void _startTicker() {
    _ticker = createTicker((elapsed) {
      setState(() {
        _elapsedSeconds = elapsed.inSeconds;
      });
    })
      ..start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InfoContainer(
                title: "Tentativas",
                subInfo: game.tries.toString(),
              ),
              InfoContainer(
                title: "Segundos",
                subInfo: _elapsedSeconds.toString(),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 1.25,
            child: GridView.builder(
              itemCount: game.numberOfCards,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (game.gameCards[index].isFlipped ||
                          game.flippedCards.length == 2) {
                        return;
                      }

                      game.gameCards[index].isFlipped = true;
                      game.flippedCards.add(game.gameCards[index]);

                      if (game.flippedCards.length == 2) {
                        game.tries++;
                        print("Tentativas: ${game.tries}");

                        if (game.flippedCards[0].value ==
                            game.flippedCards[1].value) {
                          game.flippedCards.clear();
                        } else {
                          Future.delayed(const Duration(milliseconds: 500), () {
                            setState(() {
                              game.flippedCards[0].isFlipped = false;
                              game.flippedCards[1].isFlipped = false;
                              game.flippedCards.clear();
                            });
                          });
                        }
                      }

                      game.checkGameOver();

                      if (game.isOver) {
                        print("Game Over");
                        _ticker?.stop();
                      }
                    });
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF7b87ff),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Center(
                      child: game.gameCards[index].isFlipped
                          ? game.gameCards[index].value is String
                              ? Image.asset(game.gameCards[index].value)
                              : Text(
                                  game.gameCards[index].value.toString(),
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                          : const Icon(Icons.catching_pokemon_sharp),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
