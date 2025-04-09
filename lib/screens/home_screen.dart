import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fingerprint Biometrics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                bool isSupported = await _authService.checkDeviceSupport();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isSupported
                          ? 'Device supports biometrics.'
                          : 'Device does not support biometrics.',
                    ),
                  ),
                );
              },
              child: Text('Check Device Support'),
            ),
            ElevatedButton(
              onPressed: () async {
                List<BiometricType> biometrics =
                    await _authService.getAvailableBiometrics();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      biometrics.isNotEmpty
                          ? 'Available Biometrics: $biometrics'
                          : 'No biometrics enrolled.',
                    ),
                  ),
                );
              },
              child: Text('Get Biometrics'),
            ),
            ElevatedButton(
              onPressed: () async {
                bool success = await _authService.authenticate(
                  biometricOnly: true,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Authentication Successful!'
                          : 'Authentication Failed!',
                    ),
                  ),
                );
              },
              child: Text('Authenticate'),
            ),
          ],
        ),
      ),
    );
  }
}
