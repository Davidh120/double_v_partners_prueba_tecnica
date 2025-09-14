import 'package:double_v_partners_prueba_tecnica/shared/widgets/bottom_nav_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:double_v_partners_prueba_tecnica/feature/user/user.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => BottomNavBar(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const UserFormPage(),
        ),
        GoRoute(path: '/list',
            builder: (context, state) => const UserListPage()),
      ]
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final user = state.extra as User;
        return UserDetailPage(user: user);
      },
    ),
  ],
);