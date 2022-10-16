import 'dart:convert';

class NoteModel {
  final String title;
  final String subtitle;
  final DateTime createdAt;
  final String createdBy;
  NoteModel({
    required this.title,
    required this.subtitle,
    required this.createdAt,
    required this.createdBy,
  });

  NoteModel copyWith({
    String? title,
    String? subtitle,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return NoteModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'createdBy': createdBy,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      createdBy: map['createdBy'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NoteModel(title: $title, subtitle: $subtitle, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteModel &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode;
  }
}
