import 'dart:math';

class MatrixColumn {
  double x;
  double y;
  double speed;
  final String chars;
  final int length;
  final double screenHeight;
  List<String> characters = [];
  final Random _random = Random();

  MatrixColumn({
    required this.x,
    required this.speed,
    required this.chars,
    required this.length,
    required this.screenHeight,
  }) : y = -length * 15.0 {
    _generateCharacters();
  }

  void _generateCharacters() {
    characters = List.generate(
      length,
      (index) => chars[_random.nextInt(chars.length)],
    );
  }

  void update() {
    y += speed;

    if (y > screenHeight) {
      y = -length * 15.0;
      _generateCharacters();
    }

    if (_random.nextDouble() > 0.9) {
      int index = _random.nextInt(length);
      characters[index] = chars[_random.nextInt(chars.length)];
    }
  }
}
