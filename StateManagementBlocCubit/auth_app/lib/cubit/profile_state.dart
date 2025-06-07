abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String bio;
  ProfileLoaded(this.bio);
}
