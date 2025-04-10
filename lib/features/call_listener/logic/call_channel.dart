import 'package:flutter/services.dart';

class CallChannel {
  static const MethodChannel _channel = MethodChannel(
    'com.example.employee/call',
  );

  static void setCallListener(Function(String) onNumberReceived) {
    _channel.setMethodCallHandler((call) async {
      if (call.method == "incomingCall") {
        String number = call.arguments;
        onNumberReceived(number);
      }
    });
  }
}
