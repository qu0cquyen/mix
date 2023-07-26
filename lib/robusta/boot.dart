import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_robusta/flutter_robusta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mix/utils/utils.dart';

void defineBoot(BootDefinition def) {
  def(_boot);
}

Future<void> _boot(ProviderContainer container) async {
  final logger = container.read(loggerProvider);

  logger.i('Booting...');
  _greetingBoot(container);
  _initFirebaseRealTimeDatabase();
}

void _greetingBoot(ProviderContainer container) {
  Timer.periodic(const Duration(minutes: 30), (timer) {
    container.read(
      greetingProvider.notifier,
    );
  });
}

void _initFirebaseRealTimeDatabase() {
  // final dataRef = FirebaseDatabase.instance.ref('users');

  // dataRef.onValue.listen((DatabaseEvent event) {
  //   final data = event.snapshot.value;

  //   print(data);
  // });
}
