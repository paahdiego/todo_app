import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/shared/utils/shared_preferences_keys.dart';
import 'package:todo_app/models/app_error_model.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:uuid/uuid.dart';

class UserRepository {
  Future<UserModel> create({
    required String email,
    required String password,
    required String name,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final createUser = UserModel(
      id: const Uuid().v1(),
      email: email,
      password: password,
      name: name,
      createdAt: DateTime.now(),
    );

    final users = await list();

    if (users == null) {
      await sharedPreferences.setStringList(
        SharedPreferencesKeys.users,
        [
          createUser.toJson(),
        ],
      );
      return createUser;
    }

    final exists = await findByEmail(email: email);

    if (exists != null) {
      throw AppErrorModel(message: "usuário com esse e-mail já cadastrado");
    }

    users.add(createUser);

    final usersToJson = listToJson(users: users);

    await sharedPreferences.setStringList(
      SharedPreferencesKeys.users,
      usersToJson,
    );

    return createUser;
  }

  List<String> listToJson({required List<UserModel> users}) {
    return users.map((e) => e.toJson()).toList();
  }

  Future<UserModel?> findByEmail({required String email}) async {
    final users = await list();

    if (users == null) return null;

    final exists = users.any((element) => element.email == email);

    if (!exists) return null;

    return users.firstWhere((element) => element.email == email);
  }

  Future<List<UserModel>?> list() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final contains = sharedPreferences.containsKey(SharedPreferencesKeys.users);

    if (!contains) {
      return null;
    }

    final jsons = sharedPreferences.getStringList(SharedPreferencesKeys.users);
    final users = jsons!.map((element) => UserModel.fromJson(element)).toList();
    return users;
  }
}
