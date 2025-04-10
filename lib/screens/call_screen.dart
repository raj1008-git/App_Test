import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  static const platform = MethodChannel('com.example.employee/call');
  String? incomingNumber;

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_handleNativeCall);
  }

  Future<void> _handleNativeCall(MethodCall call) async {
    if (call.method == "incomingCall") {
      setState(() {
        incomingNumber = call.arguments;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Incoming Call Detector')),
      body: Center(
        child: Text(
          incomingNumber != null
              ? 'Incoming call from: $incomingNumber'
              : 'Waiting for call...',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
