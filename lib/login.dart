import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FirebaseFunctions functions = FirebaseFunctions.instance;

  @override
  Widget build(BuildContext context) {
    void login() async {
      //Firebase.initializeApp();
      // Get the email and password from the TextField controllers
      final email = _emailController.text;
      final password = _passwordController.text;

      // Send the login request to the Cloud Function
      final response = await http.post(
        Uri.parse(
            'https://us-central1-bright-feat-372314.cloudfunctions.net/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // If the login was successful, show a success message
        print('Login successful');
      } else if (response.statusCode == 401) {
        print("CODE 401 CODE 401 COde =+=!^'^=!^='^='!^='!=^+");
      } else {
        // If the login was unsuccessful, show an error message
        print('Error!!!!!!!!!!!!!!!!!!!!: ${response.statusCode}');
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
