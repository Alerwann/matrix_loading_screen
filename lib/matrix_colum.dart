import 'dart:math';

/// Represents a single vertical column of falling characters in the matrix effect.
class MatrixColumn {
  /// The horizontal position of the column.
  double x;

  /// The vertical position of the head of the column.
  double y;

  /// The falling speed of the column.
  double speed;

  /// The set of characters available to be displayed in the column.
  final String chars;

  /// The number of characters in the column.
  final int length;

  /// The total height of the screen, used to reset the column when it goes off-screen.
  final double screenHeight;

  /// The list of characters currently displayed in this column.
  List<String> characters = [];

  final Random _random = Random();

  /// Creates a [MatrixColumn].
  ///
  /// [x] is the horizontal position.
  /// [speed] determines how fast the column falls.
  /// [chars] is the string of available characters.
  /// [length] is the number of characters in the trail.
  /// [screenHeight] is the height of the canvas.
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

  /// Updates the position and content of the column.
  ///
  /// Moves the column down by [speed]. If it goes off-screen, it resets to the top.
  /// Also randomly changes some characters to create the "glitch" effect.
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
