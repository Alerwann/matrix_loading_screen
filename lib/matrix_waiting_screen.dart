import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:matrix_waiting_screen/matrix_colum.dart';
import 'package:matrix_waiting_screen/matrix_painter.dart';

/// A widget that displays a "Matrix" style digital rain effect.
///
/// This widget is useful for loading screens, splash screens, or any part of
/// the application that requires a waiting indicator with a hacker/cyberpunk theme.
///
/// The screen displays falling characters in vertical columns, similar to the
/// famous digital rain effect. It also displays a central title and a loading
/// indicator.
class MatrixWaitingScreen extends StatefulWidget {
  /// The text displayed in the center box.
  ///
  /// Defaults to "LOADING... ".
  final String title;

  /// The color of the falling characters, the central text, and the border.
  ///
  /// Defaults to [Colors.green].
  final Color textColor;

  /// The background color of the screen.
  ///
  /// Defaults to [Colors.black].
  final Color backgroundColor;

  /// Creates a [MatrixWaitingScreen].
  const MatrixWaitingScreen({
    super.key,
    this.title = "LOADING... ",
    this.textColor = Colors.green,
    this.backgroundColor = Colors.black,
  });

  @override
  State<MatrixWaitingScreen> createState() => _MatrixWaitingScreenState();
}

class _MatrixWaitingScreenState extends State<MatrixWaitingScreen> {
  Timer? _timer;
  final List<MatrixColumn> _columns = [];
  final String _chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789<>?/|\\';

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initColumns();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _initColumns() {
    _columns.clear();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final columnCount = (width / 50).floor();

    for (int i = 0; i < columnCount; i++) {
      final double x = i * 50;
      final speed = Random().nextDouble() * 2 + 1;
      _columns.add(
        MatrixColumn(
          x: x,
          speed: speed,
          chars: _chars,
          length: (height / 10).floor(),
          screenHeight: height,
        ),
      );
    }
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 15), (timer) {
      for (var column in _columns) {
        column.update();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Stack(
        children: [
          CustomPaint(
              size: Size.infinite,
              painter: MatrixPainter(_columns, widget.textColor)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    border: Border.all(color: widget.textColor),
                    borderRadius: BorderRadius.circular(1),
                  ),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: widget.textColor,
                    strokeWidth: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
