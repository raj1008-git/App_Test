import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/size_config.dart';
import '../../provider/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter (Clean Architecture)')),
      body: Center(
        child: Text(
          'Count: ${counterProvider.count}',
          style: TextStyle(
            fontSize: SizeConfig.scaledWidth(AppSizes.textLarge),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: counterProvider.increment,
            child: const Icon(Icons.add),
          ),
          SizedBox(height: SizeConfig.scaledHeight(AppSizes.spaceMedium)),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: counterProvider.decrement,
            child: const Icon(Icons.remove),
          ),
          SizedBox(height: SizeConfig.scaledHeight(AppSizes.spaceMedium)),
          FloatingActionButton(
            heroTag: 'reset',
            onPressed: counterProvider.reset,
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
