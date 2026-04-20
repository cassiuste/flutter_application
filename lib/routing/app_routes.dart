Map<String, Widget Function(BuildContext)> get appRoutes{
  return{
    Routes.splash: (context) => const Splash(),
    Routes.login:  (context) => const LoginPage(),
    Routes.count: (context) => const CountPage(),
    Routes.list: (context) {
      final usernameArg = ModalRoute.of(context)!.settings.arguments as String;
          return ListScreen(username: usernameArg);
    },
    Routes.detail: (context){
          final nameArg = ModalRoute.of(context)!.settings.arguments as City;
          return DetailScreen(city: nameArg);
      },
    }
}