import 'package:flutter/material.dart';
import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';

class AddressFormController {
  final country = TextEditingController();
  final department = TextEditingController();
  final city = TextEditingController();
  final address = TextEditingController();

  Address toAddress() {
    return Address(
      country: country.text.trim(),
      department: department.text.trim(),
      city: city.text.trim(),
      address: address.text.trim(),
    );
  }

  void clear() {
    country.clear();
    department.clear();
    city.clear();
    address.clear();
  }

  void dispose() {
    country.dispose();
    department.dispose();
    city.dispose();
    address.dispose();
  }
}
