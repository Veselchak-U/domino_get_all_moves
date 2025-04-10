import 'package:domino_get_all_moves/entity/stone_entity.dart';

class PrintGameStateUseCase {
  void execute(List<StoneEntity> stones) {
    for (var player = 1; player < 5; player++) {
      final playerStones = stones.where((s) => s.position == player).toList();
      playerStones.sort(_compareStones);
      final doubleCount = playerStones.where((s) => s.isDouble).length;
      print('Player $player: $playerStones, doubles: $doubleCount');
    }

    final onTable = stones.where((s) => s.position == 5).toList();
    onTable.sort(_compareStones);
    print('On the table: $onTable');
  }

  int _compareStones(StoneEntity s1, StoneEntity s2) {
    if (s1.digit1 != s2.digit1) {
      return s1.digit1.compareTo(s2.digit1);
    }

    return s1.digit2.compareTo(s2.digit2);
  }
}
