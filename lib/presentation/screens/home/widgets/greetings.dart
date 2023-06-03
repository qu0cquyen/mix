import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mix/utils/utils.dart';

class Greetings extends ConsumerWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final greetings = ref.watch(greetingProvider);

    return Text('Good $greetings');
  }
}
