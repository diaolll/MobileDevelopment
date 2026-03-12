import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';

class MahasiswaRepository {
  /// Mendapatkan daftar mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa
    return [
      MahasiswaModel(
        nama: 'Andi Firmansyah',
        nim: '2021001',
        email: 'andi.firmansyah@student.example.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Bela Safitri',
        nim: '2021002',
        email: 'bela.safitri@student.example.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Candra Wijaya',
        nim: '2020001',
        email: 'candra.wijaya@student.example.com',
        jurusan: 'Sistem Informasi',
        angkatan: '2020',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Dina Pertiwi',
        nim: '2020002',
        email: 'dina.pertiwi@student.example.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2020',
        status: 'Cuti',
      ),
      MahasiswaModel(
        nama: 'Erik Santoso',
        nim: '2019001',
        email: 'erik.santoso@student.example.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2019',
        status: 'Lulus',
      ),
      MahasiswaModel(
        nama: 'Fani Rahayu',
        nim: '2022001',
        email: 'fani.rahayu@student.example.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2022',
        status: 'Aktif',
      ),
      MahasiswaModel(
        nama: 'Gilang Pratama',
        nim: '2022002',
        email: 'gilang.pratama@student.example.com',
        jurusan: 'Sistem Informasi',
        angkatan: '2022',
        status: 'Aktif',
      ),
    ];
  }
}