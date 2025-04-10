import 'dart:collection';

import 'package:domino_get_all_moves/entity/stone_entity.dart';

class RoundStateEntity {
  final UnmodifiableListView<StoneEntity> stones;
  final int? nextPlayerId;
  final int? winnerPlayerId;

  const RoundStateEntity({required this.stones, required this.nextPlayerId, required this.winnerPlayerId});
}
