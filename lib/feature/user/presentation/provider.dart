import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userNotifierProvider = StateNotifierProvider<UserNotifier, AsyncValue<List<UserModel>>>((ref) {
  return UserNotifier(ref.read(userRepositoryProvider));
});


class UserNotifier extends StateNotifier<AsyncValue<List<UserModel>>> {
  final UserRepository repository;

  UserNotifier(this.repository) : super(const AsyncValue.loading()) {
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final users = repository.getUsers();
      state = AsyncValue.data(users);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> addUser(UserModel user) async {
    repository.addUser(user);
    _loadUsers();
  }

  Future<void> deleteUser(int index) async {
    repository.deleteUser(index);
    _loadUsers();
  }
}

