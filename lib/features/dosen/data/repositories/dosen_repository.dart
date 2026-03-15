// ============================================================
// FILE: lib/features/dosen/data/repositories/dosen_repository.dart
// Materi 5 - Konsumsi REST API & HTTP Client
// Menggunakan HTTP (cara 1) dan Dio (cara 2)
// ============================================================

import 'dart:convert';
import 'package:d4tivokasi/features/dosen/data/models/dosen_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class DosenRepository {
  // URL API
  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com/users';

  // Instance Dio
  final Dio _dio = Dio();

  // ==========================================================
  // CARA 1: Menggunakan HTTP package
  // ==========================================================
  /// Mendapatkan daftar dosen menggunakan HTTP
  Future<List<DosenModel>> getDosenList() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(data); // Debug: Tampilkan data yang sudah di-decode
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      throw Exception('Gagal memuat data dosen: ${response.statusCode}');
    }
  }

  // ==========================================================
  // CARA 2: Menggunakan Dio package
  // ==========================================================
  /// Mendapatkan daftar dosen menggunakan Dio
  Future<List<DosenModel>> getDosenListDio() async {
    final response = await _dio.get(
      _baseUrl,
      options: Options(headers: {'Accept': 'application/json'}),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => DosenModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat data dosen: ${response.statusCode}');
    }
  }
}