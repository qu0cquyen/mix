import 'package:flutter/material.dart';
import 'package:flutter_robusta/flutter_robusta.dart';
import 'package:mix/robusta/app.dart';
import 'package:mix/robusta/boot.dart';
import 'package:mix/robusta/firebase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final runner = Runner(
    defineBoot: defineBoot,
    extensions: [
      firebaseCoreExtension(),
      appExtension(),
    ],
  );

  await runner.run();
}
