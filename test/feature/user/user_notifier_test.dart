import 'package:flutter_test/flutter_test.dart';
import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeUserRepository implements UserRepository {
  final List<User> _users = [];

  @override
  List<User> getUsers() => _users;

  @override
  void addUser(User user) => _users.add(user);

  @override
  void deleteUser(int index) => _users.removeAt(index);
}

void main() {
  test('addUser should add a user to the state', () {
    final container = ProviderContainer(overrides: [
      userRepositoryProvider.overrideWithValue(FakeUserRepository()),
    ]);

    final notifier = container.read(userNotifierProvider.notifier);

    notifier.addUser(
      User(
        firstName: 'David',
        lastName: 'Heredia',
        birthDate: DateTime.parse('2002-03-12'),
        addresses: [
          Address(
            address: 'Calle 1',
            city: 'Bogota',
            country: 'Colombia',
            department: 'Cundinamarca',
          )
        ],
      ),
    );

    final users = container.read(userNotifierProvider);

    expect(users.value?.length, 1);
    expect(users.value?.first.firstName, 'David');
  });

  test('deleteUser should remove a user from the state', () {
    final container = ProviderContainer(overrides: [
      userRepositoryProvider.overrideWithValue(FakeUserRepository()),
    ]);

    final notifier = container.read(userNotifierProvider.notifier);

    notifier.addUser(
      User(
        firstName: 'David',
        lastName: 'Heredia',
        birthDate: DateTime.parse('2002-03-12'),
        addresses: [
          Address(
            address: 'Calle 1',
            city: 'Bogota',
            country: 'Colombia',
            department: 'Cundinamarca',
          )
        ],
      ),
    );

    notifier.addUser(
      User(
        firstName: 'Antonio',
        lastName: 'Alvarez',
        birthDate: DateTime.parse('2002-03-12'),
        addresses: [
          Address(
            address: 'Calle 1',
            city: 'Bogota',
            country: 'Colombia',
            department: 'Cundinamarca',
          )
        ],
      ),
    );

    notifier.deleteUser(0);

    final users = container.read(userNotifierProvider);

    expect(users.value?.length, 1);
    expect(users.value?.first.firstName, 'Antonio');
  });
}
