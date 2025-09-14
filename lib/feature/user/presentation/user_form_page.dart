import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';
import '../../../shared/widgets/address_form_card.dart';
import '../../../shared/widgets/address_form_controller.dart';

class UserFormPage extends ConsumerStatefulWidget {
  const UserFormPage({super.key});

  @override
  ConsumerState<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends ConsumerState<UserFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  DateTime? _birthDate;

  final List<AddressFormController> _addresses = [];

  @override
  void initState() {
    super.initState();
    _addAddressForm();
  }

  void _addAddressForm() {
    setState(() => _addresses.add(AddressFormController()));
  }

  void _removeAddressForm(int index) {
    setState(() {
      _addresses.removeAt(index).dispose();
    });
  }

  void _clearForm() {
    _firstNameCtrl.clear();
    _lastNameCtrl.clear();
    _birthDate = null;
    for (final addr in _addresses) {
      addr.dispose();
    }
    _addresses.clear();
    _addAddressForm();
  }

  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    final user = User(
      firstName: _firstNameCtrl.text,
      lastName: _lastNameCtrl.text,
      birthDate: _birthDate!,
      addresses: _addresses.map((a) => a.toAddress()).toList(),
    );

    ref.read(userNotifierProvider.notifier).addUser(user);
    _clearForm();
  }

  @override
  void dispose() {
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    for (final addr in _addresses) {
      addr.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add User')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameCtrl,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _lastNameCtrl,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (val) => val!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  setState(() => _birthDate = date);
                },
                child: Text(_birthDate == null
                    ? "Seleccionar fecha de nacimiento"
                    : "${_birthDate!.toLocal()}".split(' ')[0]),
              ),
              const SizedBox(height: 16),
              ..._addresses.asMap().entries.map((entry) {
                final index = entry.key;
                final ctrl = entry.value;
                return AddressFormCard(
                  controller: ctrl,
                  canRemove: _addresses.length > 1,
                  onRemove: () => _removeAddressForm(index),
                );
              }),
              TextButton.icon(
                onPressed: _addAddressForm,
                icon: const Icon(Icons.add),
                label: const Text("Agregar direccion"),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _onSubmit,
                child: const Text("Guardar usuario"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

