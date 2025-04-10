import 'package:flutter/material.dart';
import 'screens/call_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Call Detector', home: CallScreen());
  }
}
