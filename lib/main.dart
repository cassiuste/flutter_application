import 'package:flutter/material.dart';
import 'package:flutter_application/routing/app_routes.dart';
import 'package:flutter_application/routing/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter application',
      routes: appRoutes,
      initialRoute: Routes.splash
    );
    }
  }

