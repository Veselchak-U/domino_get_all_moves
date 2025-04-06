import 'package:domino_get_all_moves/entity/stone_entity.dart';

class DistributeStonesUseCase {
  static const _initialStones = [
    StoneEntity(0, 0),
    StoneEntity(0, 1),
    StoneEntity(0, 2),
    StoneEntity(0, 3),
    StoneEntity(0, 4),
    StoneEntity(0, 5),
    StoneEntity(0, 6),
    StoneEntity(1, 1),
    StoneEntity(1, 2),
    StoneEntity(1, 3),
    StoneEntity(1, 4),
    StoneEntity(1, 5),
    StoneEntity(1, 6),
    StoneEntity(2, 2),
    StoneEntity(2, 3),
    StoneEntity(2, 4),
    StoneEntity(2, 5),
    StoneEntity(2, 6),
    StoneEntity(3, 3),
    StoneEntity(3, 4),
    StoneEntity(3, 5),
    StoneEntity(3, 6),
    StoneEntity(4, 4),
    StoneEntity(4, 5),
    StoneEntity(4, 6),
    StoneEntity(5, 5),
    StoneEntity(5, 6),
    StoneEntity(6, 6),
  ];

  List<StoneEntity> call() {
    final stones = _initialStones;

    do {
      stones.shuffle();
      for (var i = 0; i < stones.length; i++) {
        final player =
            i < 7
                ? 1
                : i < 14
                ? 2
                : i < 21
                ? 3
                : 4;

        stones[i] = stones[i].withPosition(player);
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
