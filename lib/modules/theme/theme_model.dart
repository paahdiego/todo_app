import 'dart:convert';

class ThemeModel {
  final String themeMode;
  ThemeModel({
    required this.themeMode,
  });

  ThemeModel copyWith({
    String? themeMode,
  }) {
    return ThemeModel(
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'themeMode': themeMode,
    };
  }

  factory ThemeModel.fromMap(Map<String, dynamic> map) {
    return ThemeModel(
      themeMode: map['themeMode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ThemeModel.fromJson(String source) =>
      ThemeModel.fromMap(json.decode(source));

  @override
  String toString() => 'ThemeModel(themeMode: $themeMode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThemeModel && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}
