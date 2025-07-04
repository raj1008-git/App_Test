import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/providers/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameAsync = ref.watch(fakeNameProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('FutureProvider Example')),
      body: Center(
        child: nameAsync.when(
          data: (name) =>
              Text('Welcome $name', style: const TextStyle(fontSize: 20)),
          loading: () => const CircularProgressIndicator(),
          error: (e, _) => Text("Error: $e"),
        ),
      ),
    );
  }
}
