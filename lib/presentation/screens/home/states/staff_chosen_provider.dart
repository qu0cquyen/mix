import 'package:flutter_riverpod/flutter_riverpod.dart';

final data = [
  'View All',
  'Staff 1',
  'Staff 2',
  'Staff 3',
  'Staff 4',
  'Staff 5',
  'Staff 6',
  'Staff 7',
];

final staffChosenProvider = StateProvider<String>((ref) => data.first);

final staffDataProvider = Provider((ref) => data);
