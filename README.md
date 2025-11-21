<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Matrix Waiting Screen

![Matrix Rain Animation](screenshots/animation.gif)

A highly customizable Flutter package that provides a cool "Matrix" style digital rain effect waiting screen. Perfect for loading screens, splash screens, or hacker-themed apps.

## Features

- **Matrix Rain Effect**: Classic falling characters animation with varying speeds and depths.
- **Fully Customizable**: Control text color, background color, and the message displayed.
- **Responsive**: Automatically adapts to any screen size and orientation.
- **Lightweight**: Pure Dart/Flutter implementation with no heavy assets.
- **Performance Optimized**: Efficient painting using `CustomPainter`.

## Screenshots

|                 Default                 |              Red Theme              |              Blue Theme              |
| :-------------------------------------: | :---------------------------------: | :----------------------------------: |
| ![Default](screenshots/screenshot1.png) | ![Red](screenshots/screenshot2.png) | ![Blue](screenshots/screenshot3.png) |

## Installation

Add `matrix_waiting_screen` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  matrix_waiting_screen: ^0.0.1
```

Then run `flutter pub get`.

## Usage

Import the package in your Dart code:

```dart
import 'package:matrix_waiting_screen/matrix_waiting_screen.dart';
```

### Basic Usage

Simply drop the `MatrixWaitingScreen` widget into your widget tree. It works great as a `Scaffold` body or a standalone page.

```dart
class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MatrixWaitingScreen();
  }
}
```

### Customization

You can customize the appearance to match your app's theme.

```dart
MatrixWaitingScreen(
  title: "SYSTEM HACK",
  textColor: Colors.red,
  backgroundColor: Colors.black,
)
```

### Full Example

Here is a more complete example showing how to use it conditionally:

```dart
import 'package:flutter/material.dart';
import 'package:matrix_waiting_screen/matrix_waiting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoadingPage(),
    );
  }
}

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate a network request
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const MatrixWaitingScreen(
        title: "CONNECTING...",
        textColor: Colors.greenAccent,
      );
    }

    return Scaffold(
      body: Center(
        child: Text("Welcome to the Real World."),
      ),
    );
  }
}
```

## Parameters

| Parameter         | Type     | Default         | Description                                               |
| ----------------- | -------- | --------------- | --------------------------------------------------------- |
| `title`           | `String` | `"LOADING... "` | The text displayed in the center box.                     |
| `textColor`       | `Color`  | `Colors.green`  | The color of the falling characters and the central text. |
| `backgroundColor` | `Color`  | `Colors.black`  | The background color of the screen.                       |

## Additional information

This package is open source. Feel free to contribute or report issues on GitHub.
