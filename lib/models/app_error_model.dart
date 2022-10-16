import 'dart:convert';

class AppErrorModel {
  final String message;
  AppErrorModel({
    required this.message,
  });

  AppErrorModel copyWith({
    String? message,
  }) {
    return AppErrorModel(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory AppErrorModel.fromMap(Map<String, dynamic> map) {
    return AppErrorModel(
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppErrorModel.fromJson(String source) =>
      AppErrorModel.fromMap(json.decode(source));

  @override
  String toString() => 'AppErrorModel(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppErrorModel && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
