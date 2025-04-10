import 'package:domino_get_all_moves/entity/move_type.dart';
import 'package:domino_get_all_moves/entity/stone_entity.dart';

class MoveEntity {
  final int playerId;
  final MoveType type; // Left / Right / Skip
  final StoneEntity stone;

  const MoveEntity(this.playerId, this.type, this.stone);
}
