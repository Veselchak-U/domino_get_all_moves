import 'package:domino_get_all_moves/use_case/distribute_stones_use_case.dart';
import 'package:domino_get_all_moves/use_case/print_game_state_use_case.dart';

void main(List<String> arguments) {
  final stones = DistributeStonesUseCase().execute();
  PrintGameStateUseCase().execute(stones);
}
