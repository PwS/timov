part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

///Data User Loaded
class UserLoaded extends UserState {
  final ModelUser user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}
