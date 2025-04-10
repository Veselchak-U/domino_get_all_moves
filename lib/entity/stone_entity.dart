class StoneEntity {
  final int id;
  final int digit1; // field 1
  final int digit2; // field 2
  final int position; // 0 - not dealt; 1,2,3,4 - player # has; 5 - on the table

  const StoneEntity({required this.id, required this.digit1, required this.digit2, this.position = 0});

  @override
  String toString() {
    return '[$digit1/$digit2]';
  }

  bool get isDouble => digit1 == digit2;

  bool hasDigit(int digit) => digit1 == digit || digit2 == digit;

  // how many points are on the stone
  int sum({required bool isSingle}) {
    if (!isSingle) return digit1 + digit2;

    return digit1 == 0 && digit2 == 0 ? 10 : digit1 + digit2;
  }

  StoneEntity copyWithPosition(int position) {
    return StoneEntity(id: id, digit1: digit1, digit2: digit2, position: position);
  }
}
