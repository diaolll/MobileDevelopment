import 'package:d4tivokasi/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  /// Mendapatkan data profile
  Future<ProfileModel> getProfile() async {
    // Simulasi network delay
    await Future.delayed(const Duration(milliseconds: 800));

    // Data dummy profile
    return ProfileModel(
      nama: 'Admin D4TI',
      nip: '198001012010011001',
      email: 'admin.d4ti@example.com',
      jabatan: 'Administrator',
      jurusan: 'Teknik Informatika D4 Vokasi',
      phone: '081234567890',
      alamat: 'Jl. Kampus No. 1, Kota Universitas',
    );
  }
}