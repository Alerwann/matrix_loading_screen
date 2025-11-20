import 'package:flutter/material.dart';
import 'package:matrix_waiting_screen/matrix_colum.dart';

class MatrixPainter extends CustomPainter {
  final List<MatrixColumn> columns;
  final Color textColor;

  MatrixPainter(this.columns, this.textColor);

  @override
  void paint(Canvas canvas, Size size) {
    for (var column in columns) {
      _drawColumn(canvas, column);
    }
  }

  void _drawColumn(Canvas canvas, MatrixColumn column) {
    for (int i = 0; i < column.characters.length; i++) {
      double opacity = (column.length - i) / column.length;

      if (i == 0) {
        opacity = 1.0;
      }

      final textStyle = TextStyle(
        color: i == 0
            ? Colors.white
            : textColor.withValues(alpha: opacity * 0.8),
        fontSize: 16,
        fontFamily: 'monospace',
        fontWeight: i == 0 ? FontWeight.bold : FontWeight.normal,
      );

      final textSpan = TextSpan(text: column.characters[i], style: textStyle);

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      textPainter.paint(canvas, Offset(column.x, column.y + (i * 20)));
    }
  }

  @override
  bool shouldRepaint(MatrixPainter oldDelegate) => true;
}
