import 'package:hive/hive.dart';
import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  final String firstName;

  @HiveField(1)
  final String lastName;

  @HiveField(2)
  final DateTime birthDate;

  @HiveField(3)
  final List<AddressModel> addresses;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.addresses,
  });
}