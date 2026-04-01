import 'package:d4tivokasi/core/network/dio_client.dart';
import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:dio/dio.dart';

class MahasiswaRepository {
  final DioClient _dioClient;

  MahasiswaRepository({DioClient? dioClient})
    : _dioClient = dioClient ?? DioClient();

  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final Response response = await _dioClient.dio.get('/comments');
      final List<dynamic> data = response.data;
      // Batasi 20 data
      return data
          .take(20)
          .map((json) => MahasiswaModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data mahasiswa: ${e.response?.statusCode} - ${e.message}',
      );
    }
  }
}