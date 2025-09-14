import 'package:flutter/material.dart';
import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';
import 'package:go_router/go_router.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle de ${user.firstName}"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            _buildInfoText(context, "Nombre", user.firstName),
            const SizedBox(height: 16),
            _buildInfoText(context, "Apellido", user.lastName),
            const SizedBox(height: 16),
            user.addresses.length > 1
                ? Text("Direcciones:", style: Theme.of(context).textTheme.titleLarge)
                : Text("Dirección:", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            ...user.addresses.map(
                  (a) => ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(a.address),
                subtitle: Text(a.city),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(BuildContext context, String label, String value) {
    return Text(
      "$label: $value",
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
