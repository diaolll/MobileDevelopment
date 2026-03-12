import 'package:d4tivokasi/features/dosen/data/models/dosen_model.dart';

class DosenRepository {
  /// Mendapatkan daftar dosen
  Future<List<DosenModel>> getDosenList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy dosen
    return [
      DosenModel(
        nama: 'Anank Prasetyo',
        nip: '123456789',
        email: 'anank.prasetyo@example.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Rachman Sinatriya',
        nip: '987654321',
        email: 'rachman.sinatriya@example.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Alfian Sukma',
        nip: '456789123',
        email: 'alfian.sukma@example.com',
        jurusan: 'Teknik Informatika',
      ),
      DosenModel(
        nama: 'Budi Santoso',
        nip: '321654987',
        email: 'budi.santoso@example.com',
        jurusan: 'Sistem Informasi',
      ),
      DosenModel(
        nama: 'Dewi Rahayu',
        nip: '654321789',
        email: 'dewi.rahayu@example.com',
        jurusan: 'Teknik Informatika',
      ),
    ];
  }
}