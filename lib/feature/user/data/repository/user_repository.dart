import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';
import 'package:hive/hive.dart';

class UserRepository {
  final Box<UserModel> _userBox = Hive.box<UserModel>('users');

  List<User> getUsers() {
    final userModels = _userBox.values.toList();
    return userModels.map((u) => u.toDomain()).toList(); // 🔹 Se usa el mapper
  }

  void addUser(User user) {
    final userModel = user.toModel(); // 🔹 Se usa el mapper
    _userBox.add(userModel);
  }

  void deleteUser(int index) {
    _userBox.deleteAt(index);
  }
}
