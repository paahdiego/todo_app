import 'dart:convert';

import 'package:todo_app/models/user_model.dart';

class RegisterResponse {
  final UserModel? user;
  final bool shouldAdjustControllers;
  RegisterResponse({
    this.user,
    required this.shouldAdjustControllers,
  });

  RegisterResponse copyWith({
    UserModel? user,
    bool? shouldAdjustControllers,
  }) {
    return RegisterResponse(
      user: user ?? this.user,
      shouldAdjustControllers:
          shouldAdjustControllers ?? this.shouldAdjustControllers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user?.toMap(),
      'shouldAdjustControllers': shouldAdjustControllers,
    };
  }

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      user: map['user'] != null ? UserModel.fromMap(map['user']) : null,
      shouldAdjustControllers: map['shouldAdjustControllers'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegisterResponse(user: $user, shouldAdjustControllers: $shouldAdjustControllers)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterResponse &&
        other.user == user &&
        other.shouldAdjustControllers == shouldAdjustControllers;
  }

  @override
  int get hashCode => user.hashCode ^ shouldAdjustControllers.hashCode;
}
