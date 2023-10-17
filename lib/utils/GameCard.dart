export 'GameCard.dart';

class GameCard {
  final int cod;
  final dynamic value;

  GameCard(this.cod, this.value);

  int getCod() {
    return cod;
  }

  dynamic getValue() {
    return value;
  }
}
