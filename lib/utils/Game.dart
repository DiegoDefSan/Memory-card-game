export 'Game.dart';

import 'GameCard.dart';

class Game {
  List<GameCard> gameCards = [];
  final int numberOfCards = 20;
  final String imagesPath = "assets/images/";
  bool withImages;
  bool withNumbers;
  List<GameCard> flippedCards = [];
  bool isOver = false;
  int tries = 0;

  Game(this.withImages, this.withNumbers);

  void initGame() {
    if (withImages && withNumbers) {
      gameCards = List.generate(
          numberOfCards,
          (index) => GameCard(
              (index / 2 + 1).toInt(),
              index < 10
                  ? ((index / 2 + 1) % 10).toInt()
                  : "${imagesPath}pokemon_${(index / 2 + 1).toInt()}.png"));
    } else if (withNumbers) {
      gameCards = List.generate(
          numberOfCards,
          (index) => GameCard(
              (index / 2 + 1).toInt(), ((index / 2 + 1) % 10).toInt()));
    } else if (withImages) {
      gameCards = List.generate(
          numberOfCards,
          (index) => GameCard((index / 2 + 1).toInt(),
              "${imagesPath}pokemon_${(index / 2 + 1).toInt()}.png"));
    }

    gameCards.shuffle();
  }

  int flipCard(int index) {
    flippedCards.add(gameCards[index]);

    if (flippedCards.length < 2) {
      return 0;
    }

    if (flippedCards[0].value == flippedCards[1].value) {
      flippedCards.clear();
      return 0;
    }

    flippedCards[0].isFlipped = false;
    flippedCards[1].isFlipped = false;

    flippedCards = [];
    return 500;
  }

  bool checkGameOver() {
    isOver = gameCards.every((element) => element.isFlipped);
    return isOver;
  }

  void setFlipAllCards() {
    gameCards.forEach((element) {
      element.isFlipped = !element.isFlipped;
    });
  }
}
