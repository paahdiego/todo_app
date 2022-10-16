import 'package:todo_app/repositories/auth/auth_repository.dart';
import 'package:todo_app/repositories/user/user_repository.dart';
import 'package:todo_app/models/app_error_model.dart';
import 'package:todo_app/models/user_model.dart';

class AuthService {
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final userRepository = UserRepository();

    final user = await userRepository.findByEmail(email: email);

    if (user == null || user.password != password) {
      throw AppErrorModel(
        message: 'usuário não encontrado ou credenciais incorretas',
      );
    }

    AuthRepository.saveLoggedUser(user);
    return user;
  }

  Future<UserModel> createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    final userRepository = UserRepository();

    try {
      final response = await userRepository.create(
        email: email,
        password: password,
        name: name,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
