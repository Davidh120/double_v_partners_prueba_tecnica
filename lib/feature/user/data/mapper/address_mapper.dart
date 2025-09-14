import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';

extension AddressMapper on AddressModel {
  Address toDomain() => Address(
    country: country,
    department: department,
    city: city,
    address: address,
  );
}

extension AddressDomainMapper on Address {
  AddressModel toModel() => AddressModel(
    country: country,
    department: department,
    city: city,
    address: address,
  );
}