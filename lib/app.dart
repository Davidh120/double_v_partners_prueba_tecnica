import 'package:flutter/material.dart';
import 'package:double_v_partners_prueba_tecnica/config/navigation.dart';
    
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
