import 'package:flutter/material.dart';
import 'package:flutter_application/routing/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
    ).then((value) => {
      Navigator.pushReplacementNamed(context, Routes.login),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center (
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          flutterImage(),
          const SizedBox(height: 20),
          CircularProgressIndicator(),
          const SizedBox(height: 20),
          flutterText()
        ],
      ),
    ))
    ;
  }
}

Widget flutterImage(){
  return Image.network(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTUmuwZfH6oislpSYTw8StsD1hpszsaLIyiQ&s",
    height: 200,
  );
}

Widget flutterText(){
  return Text("The application is loading...", style: TextStyle(fontSize: 20));
}