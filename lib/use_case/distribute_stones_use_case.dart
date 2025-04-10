import 'package:domino_get_all_moves/entity/stone_entity.dart';

class DistributeStonesUseCase {
  static final _initialStones = [
    StoneEntity(id: 0, digit1: 0, digit2: 0),
    StoneEntity(id: 1, digit1: 0, digit2: 1),
    StoneEntity(id: 2, digit1: 0, digit2: 2),
    StoneEntity(id: 3, digit1: 0, digit2: 3),
    StoneEntity(id: 4, digit1: 0, digit2: 4),
    StoneEntity(id: 5, digit1: 0, digit2: 5),
    StoneEntity(id: 6, digit1: 0, digit2: 6),
    StoneEntity(id: 7, digit1: 1, digit2: 1),
    StoneEntity(id: 8, digit1: 1, digit2: 2),
    StoneEntity(id: 9, digit1: 1, digit2: 3),
    StoneEntity(id: 10, digit1: 1, digit2: 4),
    StoneEntity(id: 11, digit1: 1, digit2: 5),
    StoneEntity(id: 12, digit1: 1, digit2: 6),
    StoneEntity(id: 13, digit1: 2, digit2: 2),
    StoneEntity(id: 14, digit1: 2, digit2: 3),
    StoneEntity(id: 15, digit1: 2, digit2: 4),
    StoneEntity(id: 16, digit1: 2, digit2: 5),
    StoneEntity(id: 17, digit1: 2, digit2: 6),
    StoneEntity(id: 18, digit1: 3, digit2: 3),
    StoneEntity(id: 19, digit1: 3, digit2: 4),
    StoneEntity(id: 20, digit1: 3, digit2: 5),
    StoneEntity(id: 21, digit1: 3, digit2: 6),
    StoneEntity(id: 22, digit1: 4, digit2: 4),
    StoneEntity(id: 23, digit1: 4, digit2: 5),
    StoneEntity(id: 24, digit1: 4, digit2: 6),
    StoneEntity(id: 25, digit1: 5, digit2: 5),
    StoneEntity(id: 26, digit1: 5, digit2: 6),
    StoneEntity(id: 27, digit1: 6, digit2: 6),
  ];

  List<StoneEntity> execute() {
    final stones = _initialStones;

    do {
      stones.shuffle();
      // The first player takes the first 7 stones,
      // the second player takes the second 7 stones, etc.
      for (var i = 0; i < stones.length; i++) {
        final player =
            i < 7
                ? 1
                : i < 14
                ? 2
                : i < 21
                ? 3
                : 4;

        stones[i] = stones[i].copyWithPosition(player);
      }
    } while (_isBadDistribution(stones));

    return stones;
  }

  bool _isBadDistribution(List<StoneEntity> stones) {
    for (var player = 1; player < 5; player++) {
      final playerStones = stones.where((s) => s.position == player).toList();

      // check #1 - the presence of 5 duplicates
      final duplicatesCount = playerStones.where((s) => s.isDouble).length;
      if (duplicatesCount >= 5) {
        print('!!! Player $player has $duplicatesCount duplicates, redistribute.');

        return true;
      }

      // check #2 - the presence of 6 stones of the same digit
      for (var digit = 0; digit < 7; digit++) {
        final digitsCount = playerStones.where((s) => s.hasDigit(digit)).length;
        if (digitsCount >= 6) {
          print('!!! Player $player has $digitsCount digit $digit, redistribute.');

          return true;
        }
      }
    }

    return false;
  }
}
