import 'package:hive/hive.dart';
part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel extends HiveObject {
  @HiveField(0)
  final String country;

  @HiveField(1)
  final String department;

  @HiveField(2)
  final String city;

  @HiveField(3)
  final String address;

  AddressModel({
    required this.country,
    required this.department,
    required this.city,
    required this.address
  });
}