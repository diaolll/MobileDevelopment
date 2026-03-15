// ============================================================
// FILE: lib/features/mahasiswa/data/models/mahasiswa_model.dart
// Materi 5 - API: https://jsonplaceholder.typicode.com/comments
// ============================================================

/// Model data mahasiswa dari API JSONPlaceholder /comments
class MahasiswaModel {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  MahasiswaModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      postId: json['postId'] ?? 0,
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}