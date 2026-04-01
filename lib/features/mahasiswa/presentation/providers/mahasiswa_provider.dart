import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:d4tivokasi/core/services/local_storage_service.dart';
import 'package:d4tivokasi/features/dosen/presentation/providers/dosen_provider.dart';
import 'package:d4tivokasi/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:d4tivokasi/features/mahasiswa/data/repositories/mahasiswa_repository.dart';

final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

// Provider semua saved mahasiswa
final savedMahasiswaProvider = FutureProvider<List<Map<String, String>>>((
  ref,
) async {
  final storage = ref.watch(localStorageServiceProvider);
  return storage.getSavedUsers();
});

class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;
  final LocalStorageService _storage;

  MahasiswaNotifier(this._repository, this._storage)
    : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();
    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswaList();
  }

  /// Simpan mahasiswa yang dipilih ke local storage
  Future<void> saveSelectedMahasiswa(MahasiswaModel mahasiswa) async {
    await _storage.addUserToSavedList(
      userId: mahasiswa.id.toString(),
      username: mahasiswa.name,
    );
  }

  /// Hapus mahasiswa tertentu dari list
  Future<void> removeSavedMahasiswa(String userId) async {
    await _storage.removeSavedUser(userId);
  }

  /// Hapus semua mahasiswa dari list
  Future<void> clearSavedMahasiswa() async {
    await _storage.clearSavedUsers();
  }
}

final mahasiswaNotifierProvider = StateNotifierProvider.autoDispose<
  MahasiswaNotifier,
  AsyncValue<List<MahasiswaModel>>
>((ref) {
  final repository = ref.watch(mahasiswaRepositoryProvider);
  final storage    = ref.watch(localStorageServiceProvider);
  return MahasiswaNotifier(repository, storage);
});