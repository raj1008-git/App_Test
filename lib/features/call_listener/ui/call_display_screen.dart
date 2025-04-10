import 'package:flutter/material.dart';
import '../logic/call_channel.dart';

class CallDisplayScreen extends StatefulWidget {
  @override
  _CallDisplayScreenState createState() => _CallDisplayScreenState();
}

class _CallDisplayScreenState extends State<CallDisplayScreen> {
  String _callerNumber = 'Waiting for calls...';

  @override
  void initState() {
    super.initState();
    CallChannel.setCallListener((number) {
      setState(() {
        _callerNumber = 'Incoming call from : $number';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call Listener')),
      body: Center(
        child: Text(
          _callerNumber,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
