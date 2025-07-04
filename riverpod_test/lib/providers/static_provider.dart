import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameProvider = Provider<String>((ref) => 'RiverPod Demo App');

final doubleCounterProvider = Provider<int>((ref) {
  final base = ref.watch(baseNumberProvider);
  return base * 2;
});

final baseNumberProvider = StateProvider<int>((ref) => 2);
