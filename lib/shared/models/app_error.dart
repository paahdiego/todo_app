import 'dart:convert';

class AppError {
  final String message;
  AppError({
    required this.message,
  });

  AppError copyWith({
    String? message,
  }) {
    return AppError(
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
    };
  }

  factory AppError.fromMap(Map<String, dynamic> map) {
    return AppError(
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AppError.fromJson(String source) =>
      AppError.fromMap(json.decode(source));

  @override
  String toString() => 'AppError(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
