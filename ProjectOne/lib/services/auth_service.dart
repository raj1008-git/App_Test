import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> checkDeviceSupport() async {
    return await _auth.isDeviceSupported();
  }

  Future<bool> checkBiometricSupport() async {
    return await _auth.canCheckBiometrics;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    return await _auth.getAvailableBiometrics();
  }

  Future<bool> authenticate({bool biometricOnly = false}) async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: AuthenticationOptions(
          biometricOnly: biometricOnly,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }
}
