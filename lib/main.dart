import 'package:beefit/login.dart';
import 'package:beefit/signup.dart';
import 'package:beefit/createProfile.dart';
import 'package:beefit/inputs.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
