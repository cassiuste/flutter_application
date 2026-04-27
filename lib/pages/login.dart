import 'package:flutter/material.dart';
import 'package:flutter_application/routing/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,  
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
          key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                flutterImage(),
                const SizedBox(height: 50),
                userTextBox("Username"),
                const SizedBox(height: 16),
                passwordTextBox("Password"),
                const SizedBox(height: 10),
                forgotPasswordButton(),
                const SizedBox(height: 10),
                loginButton(context),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: createAccountButton(),
    );
  }

  Widget flutterImage() {
    return Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png",
      height: 80,
    );
  }

  Widget userTextBox(String text) {
    return TextFormField(
      controller: _userController,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu usuario';
        }
        return null;
      },
    );
  }

  Widget passwordTextBox(String text) {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa tu contraseña';
        }

        if (value.length < 7) {
          return 'La contraseña debe tener al menos 7 caracteres';
        }

        if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
          return 'La contraseña debe contener al menos una letra';
        }

      if (!RegExp(r'[0-9]').hasMatch(value)) {
        return 'La contraseña debe contener al menos un número';
      }

        return null;
      },
    );
  }
  
  Widget loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {

          if (_userController.text == "user" && _passwordController.text == "pass12345") {
            Navigator.pushReplacementNamed(context, Routes.list, arguments: _userController.text);
          } 
          else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Usuario o contraseña incorrectos')),
            );
          }
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

  Widget forgotPasswordButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }

  Widget createAccountButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "New User? Create Account",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
