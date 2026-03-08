import 'package:flutter/material.dart';
import 'package:flutter_application/pages/count.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page", style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.lightBlue),
      body: 
      Center(
        child: 
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            flutterImage(),
            const SizedBox(height: 50),
            
            userTextBox("Username"),
            const SizedBox(height: 16),

            passwordTextBox("Password"),

            const SizedBox(height: 20),
          
            loginButton(context)

          ],
        ),
      ),
    ));
  }

  Widget flutterImage(){
    return Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png",
      height: 80,
    );
  }

  Widget userTextBox(String text) {
  return TextField(
    controller: _userController,
    decoration: InputDecoration(
      labelText: text,
      border: OutlineInputBorder(),
    ),
  );
}

Widget passwordTextBox(String text) {
  return TextField(
    controller: _passwordController,
    obscureText: true,
    decoration: InputDecoration(
      labelText: text,
      border: OutlineInputBorder(),
    ),
  );
}

  Widget loginButton(BuildContext context){
    return ElevatedButton(
      onPressed: () {
        final userValue = _userController.text;
        final passwordValue = _passwordController.text; 
        if(userValue == "Usuario" && passwordValue == "12345"){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CountPage(username: _userController.text),
              ),
            );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        minimumSize: const Size(200, 50),
      ),
      child: const Text("Login", style: TextStyle(fontSize: 18)), 
    );
  }
}