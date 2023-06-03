import 'package:flutter/material.dart';
import 'package:flutter_robusta/flutter_robusta.dart';
import 'package:mix/robusta/app.dart';
import 'package:mix/robusta/boot.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final runner = Runner(
    defineBoot: defineBoot,
    extensions: [
      appExtension(),
    ],
  );

  await runner.run();
}
