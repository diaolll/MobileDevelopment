class ProfileModel {
  final String nama;
  final String nip;
  final String email;
  final String jabatan;
  final String jurusan;
  final String phone;
  final String alamat;

  ProfileModel({
    required this.nama,
    required this.nip,
    required this.email,
    required this.jabatan,
    required this.jurusan,
    required this.phone,
    required this.alamat,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      nama: json['nama'] ?? '',
      nip: json['nip'] ?? '',
      email: json['email'] ?? '',
      jabatan: json['jabatan'] ?? '',
      jurusan: json['jurusan'] ?? '',
      phone: json['phone'] ?? '',
      alamat: json['alamat'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'nip': nip,
      'email': email,
      'jabatan': jabatan,
      'jurusan': jurusan,
      'phone': phone,
      'alamat': alamat,
    };
  }
}