import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/utils/size_config.dart';
import 'features/counter/presentation/screens/counter_screen.dart';
import 'features/counter/provider/counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Counter Todo Clean',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ResponsiveWrapper(child: CounterScreen()),
    );
  }
}

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  const ResponsiveWrapper({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // 👈 Here we initialize SizeConfig properly.
    return child;
  }
}
