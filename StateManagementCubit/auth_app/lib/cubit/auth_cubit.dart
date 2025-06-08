import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'test@example.com' && password == 'password') {
      final user = User(id: '123', name: 'Test User', email: email);
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated(error: 'Invalid Credentials'));
    }
  }

  void logout() => emit(Unauthenticated());
}
