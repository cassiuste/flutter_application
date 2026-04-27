import 'package:flutter/material.dart';
import 'package:flutter_application/model/city.dart';
import 'package:flutter_application/routing/routes.dart';
import 'package:flutter_application/pages/count.dart';
import 'package:flutter_application/pages/detail.dart';
import 'package:flutter_application/pages/list.dart';
import 'package:flutter_application/pages/login.dart';
import 'package:flutter_application/pages/splash.dart';

Map<String, Widget Function(BuildContext)> get appRoutes{
  return{
    Routes.splash: (context) => const SplashPage(),
    Routes.login:  (context) => const LoginPage(),
    Routes.count: (context){
          final usernameArg = ModalRoute.of(context)!.settings.arguments as String;
          return CountPage(username: usernameArg);
      },
    Routes.list: (context) {
      final usernameArg = ModalRoute.of(context)!.settings.arguments as String;
          return ListScreen(username: usernameArg);
    },
    Routes.detail: (context){
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          final nameArg = args['city'] as City;
          final usernameArg = args['username'] as String;
          return DetailScreen(city: nameArg, username: usernameArg);
      },
    };
}