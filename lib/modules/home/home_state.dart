import 'package:todo_app/models/user_model.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final UserModel loggedUser;
  HomeStateSuccess({
    required this.loggedUser,
  });
}
