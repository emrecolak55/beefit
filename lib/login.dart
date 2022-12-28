import 'package:beefit/signup.dart';
<<<<<<< Updated upstream
import 'package:flutter/material.dart';
import 'package:beefit/profile.dart';
=======
import 'package:beefit/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:beefit/profile.dart';
import 'package:http/http.dart' as http;

import 'auth.dart';
>>>>>>> Stashed changes

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
<<<<<<< Updated upstream
=======
  String? errorMessage = '';
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    void goToSignUpPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignUpPage()),
      );
    }

    void goToProfile() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            name: 'John Doe',
            email: 'john@example.com',
            age: 30,
            height: 75,
            weight: 75,
            photoUrl:
<<<<<<< Updated upstream
                'https://this-person-does-not-exist.com/img/avatar-796f2700adb942342f62c69e9aff949a.jpg',
=======
                'https://mymodernmet.com/wp/wp-content/uploads/2019/09/100k-ai-faces-5.jpg',
>>>>>>> Stashed changes
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 242, 229),
        // ignore: prefer_const_literals_to_create_immutables
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 60,
                ),

                SizedBox(
                  height: 10,
                ), // For space between
                Text('Welcome to',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 58,
                    )),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/bee.jpg',
                        width: 80,
                        height: 80,
                      ),
                      Text('Fit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 58,
                          )),
                    ],
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
                //email field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
<<<<<<< Updated upstream
=======
                        controller: _emailController,
>>>>>>> Stashed changes
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
<<<<<<< Updated upstream
=======
                        controller: _passwordController,
>>>>>>> Stashed changes
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
<<<<<<< Updated upstream
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                        onPressed: goToProfile,
=======
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: ElevatedButton(
                        onPressed:
                            signInWithEmailAndPassword, // firebase sign in call
>>>>>>> Stashed changes
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text('Sign In/Go profile')),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                //password textfield
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
<<<<<<< Updated upstream
=======
                  // ignore: prefer_const_literals_to_create_immutables
>>>>>>> Stashed changes
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
<<<<<<< Updated upstream
                    onPressed: goToProfile,
=======
                    onPressed: goToSignUpPage, // edit
>>>>>>> Stashed changes
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                    ),
                    child: const Text('Go to Signup Page')),
                // not a member? register
              ],
            ),
          ),
        ));
  }
}
