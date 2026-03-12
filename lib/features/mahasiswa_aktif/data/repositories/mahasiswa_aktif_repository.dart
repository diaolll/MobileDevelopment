import 'package:d4tivokasi/features/mahasiswa_aktif/data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  /// Mendapatkan daftar mahasiswa aktif
  Future<List<MahasiswaAktifModel>> getMahasiswaAktifList() async {
    // Simulasi network delay
    await Future.delayed(const Duration(seconds: 1));

    // Data dummy mahasiswa aktif
    return [
      MahasiswaAktifModel(
        nama: 'Andi Firmansyah',
        nim: '2021001',
        email: 'andi.firmansyah@student.example.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        semester: '6',
        ipk: 3.75,
      ),
      MahasiswaAktifModel(
        nama: 'Bela Safitri',
        nim: '2021002',
        email: 'bela.safitri@student.example.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2021',
        semester: '6',
        ipk: 3.90,
      ),
      MahasiswaAktifModel(
        nama: 'Candra Wijaya',
        nim: '2020001',
        email: 'candra.wijaya@student.example.com',
        jurusan: 'Sistem Informasi',
        angkatan: '2020',
        semester: '8',
        ipk: 3.50,
      ),
      MahasiswaAktifModel(
        nama: 'Fani Rahayu',
        nim: '2022001',
        email: 'fani.rahayu@student.example.com',
        jurusan: 'Teknik Informatika',
        angkatan: '2022',
        semester: '4',
        ipk: 3.85,
      ),
      MahasiswaAktifModel(
        nama: 'Gilang Pratama',
        nim: '2022002',
        email: 'gilang.pratama@student.example.com',
        jurusan: 'Sistem Informasi',
        angkatan: '2022',
        semester: '4',
        ipk: 3.60,
      ),
    ];
  }
}