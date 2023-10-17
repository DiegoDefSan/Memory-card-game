import 'dart:math';

import 'GameCard.dart';

class Game {
  bool isOver = false;
  int score = 0;
  int tries = 0;
  String imagesLocation = "assets/images/";
  final bool withImages;
  final bool withNumbers;

  List<GameCard> GameCards = [];

  Game(this.withImages, this.withNumbers) {
    initializeGameCards();
    isOver = false;
    score = 0;
    tries = 0;
  }

  void initializeGameCards() {
    if (withImages && withNumbers) {
      bool even = 0 + Random().nextInt(2) % 2 == 0;

      if (even) {
        for (int i = 0; i < 5; i++) {
          GameCards.add(GameCard(i, 2 * i));
          GameCards.add(GameCard(i, 2 * i));
        }
      } else {
        for (int i = 0; i < 5; i++) {
          GameCards.add(GameCard(i, 2 * i + 1));
          GameCards.add(GameCard(i, 2 * i + 1));
        }
      }

      for (int i = 5; i < 10; i++) {
        GameCards.add(
            GameCard(i, "${this.imagesLocation}pokemon_${i + 1}.png"));
        GameCards.add(
            GameCard(i, "${this.imagesLocation}pokemon_${i + 1}.png"));
      }
    } else if (withImages) {
      for (int i = 0; i < 10; i++) {
        GameCards.add(
            GameCard(i, "${this.imagesLocation}pokemon_${i + 1}.png"));
        GameCards.add(
            GameCard(i, "${this.imagesLocation}pokemon_${i + 1}.png"));
      }
    } else if (withNumbers) {
      for (int i = 0; i < 10; i++) {
        GameCards.add(GameCard(i, i));
        GameCards.add(GameCard(i, i));
      }
    }

    GameCards.shuffle();
  }
}
