import 'dart:async';

import 'package:flutter_robusta/flutter_robusta.dart';
import 'package:mix/robusta/app.dart';
import 'package:mix/robusta/boot.dart';
import 'package:robusta_runner/robusta_runner.dart';

Future<void> main() async {
  final runner = Runner(
    defineBoot: defineBoot,
    extensions: [
      // appExtension,
    ],
  );

  await runner.run();
}
