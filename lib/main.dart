import 'package:flutter/material.dart';
import 'package:flutter_application/model/city.dart';
import 'package:flutter_application/pages/count.dart';
import 'package:flutter_application/pages/list.dart';
import 'package:flutter_application/pages/login.dart';
import 'package:flutter_application/pages/detail.dart';

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
      initialRoute: '/', 
      routes: appRoutes,
      initialRoute: Routes.splash
    );
    }
  }

