import 'package:auth_app/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  void loadUserProfile(String userId) {
    emit(ProfileLoaded('This is a Mock bio for user Id : $userId'));
  }
}
