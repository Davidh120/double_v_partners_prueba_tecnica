import 'package:hive/hive.dart';
import 'user_model.dart';

class UserRepository {
  final Box<UserModel> _box = Hive.box<UserModel>('usersBox');

  List<UserModel> getUsers() => _box.values.toList();

  void addUser(UserModel user) {
    _box.add(user);
  }

  void deleteUser(int index) {
    _box.deleteAt(index);
  }
}
