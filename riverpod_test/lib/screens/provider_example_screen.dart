import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/static_provider.dart';

class ProviderExampleScreen extends ConsumerWidget {
  const ProviderExampleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = ref.watch(appNameProvider);
    final base = ref.watch(baseNumberProvider);
    final doubled = ref.watch(doubleCounterProvider);

    return Scaffold(
      appBar: AppBar(title: Text(appName)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Base Number: $base'),
          Text('Double value: $doubled'),
          ElevatedButton(
            onPressed: () => ref.read(baseNumberProvider.notifier).state++,
            child: const Text('Increment base Number'),
          ),
        ],
      ),
    );
  }
}
