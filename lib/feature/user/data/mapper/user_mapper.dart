import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';

extension UserMapper on UserModel {
  User toDomain() => User(
    firstName: firstName,
    lastName: lastName,
    birthDate: birthDate,
    addresses: addresses.map((a) => a.toDomain()).toList(),
  );
}

extension UserDomainMapper on User {
  UserModel toModel() => UserModel(
    firstName: firstName,
    lastName: lastName,
    birthDate: birthDate,
    addresses: addresses.map((a) => a.toModel()).toList(),
  );
}
