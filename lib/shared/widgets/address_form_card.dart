import 'package:flutter/material.dart';
import 'address_form_controller.dart';

class AddressFormCard extends StatelessWidget {
  final AddressFormController controller;
  final VoidCallback? onRemove;
  final bool canRemove;

  const AddressFormCard({
    super.key,
    required this.controller,
    this.onRemove,
    this.canRemove = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: controller.country,
              decoration: const InputDecoration(labelText: 'Country'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: controller.department,
              decoration: const InputDecoration(labelText: 'Department'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: controller.city,
              decoration: const InputDecoration(labelText: 'City'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: controller.address,
              decoration: const InputDecoration(labelText: 'Address'),
              validator: (val) => val!.isEmpty ? 'Required' : null,
            ),
            if (canRemove)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: onRemove,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
