import 'package:double_v_partners_prueba_tecnica/feature/user/domain/address.dart';

class User {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<Address> addresses;

  User({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.addresses,
  });
}