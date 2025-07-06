import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);
final isDarkModeProvider = StateProvider<bool>((ref) => false);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkModeProvider);

    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter + Theme toggle"),
        actions: [
          Consumer(
            builder: (context, ref, _) {
              final isDark = ref.watch(isDarkModeProvider);
              return Switch(
                value: isDark,
                onChanged: (value) {
                  ref.read(isDarkModeProvider.notifier).state = value;
                },
              );
            },
          ),
        ],
      ),

      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final count = ref.watch(counterProvider);
            return Text('Counter: $count', style: TextStyle(fontSize: 24));
          },
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Consumer(
            builder: (context, ref, _) => FloatingActionButton(
              heroTag: 'increment',
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: Icon(Icons.add),
            ),
          ),

          const SizedBox(height: 10),

          Consumer(
            builder: (context, ref, _) => FloatingActionButton(
              heroTag: 'reset',
              onPressed: () {
                ref.read(counterProvider.notifier).state = 0;
              },
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
