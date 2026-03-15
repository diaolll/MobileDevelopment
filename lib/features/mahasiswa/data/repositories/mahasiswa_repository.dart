// ============================================================
// FILE: lib/features/mahasiswa/data/repositories/mahasiswa_repository.dart
// Materi 5 - API: https://jsonplaceholder.typicode.com/comments
// Menggunakan HTTP dan Dio
// ============================================================

import 'dart:convert';
import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class MahasiswaRepository {
  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com/comments';

  final Dio _dio = Dio();

  // ==========================================================
  // CARA 1: Menggunakan HTTP package
  // ==========================================================
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      // Batasi 20 data untuk performa
      return data
          .take(20)
          .map((json) => MahasiswaModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
    }
  }

  // ==========================================================
  // CARA 2: Menggunakan Dio package
  // ==========================================================
  Future<List<MahasiswaModel>> getMahasiswaListDio() async {
    final response = await _dio.get(
      _baseUrl,
      options: Options(headers: {'Accept': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data
          .take(20)
          .map((json) => MahasiswaModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
    }
  }
}