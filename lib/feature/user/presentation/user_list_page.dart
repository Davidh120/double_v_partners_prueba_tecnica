import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(userNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Usuarios")),
      body: usersState.when(
        data: (users) {
          if (users.isEmpty) {
            return const Center(child: Text("No hay usuarios aún"));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final firstAddress =
                  user.addresses.isNotEmpty ? user.addresses.first : null;

              return ListTile(
                title: Text(user.firstName),
                subtitle: Text(
                  firstAddress != null
                      ? "${firstAddress.address}, ${firstAddress.city}"
                      : "Sin dirección",
                ),
                onTap: () => context.push("/detail", extra: user),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    ref.read(userNotifierProvider.notifier).deleteUser(index);
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
      ),
    );
  }
}
