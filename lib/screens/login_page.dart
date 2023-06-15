import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:projecthomepage/firebase/auth_manager.dart';
import 'package:projecthomepage/screens/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projecthomepage/screens/tabs_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgot_password.dart';
import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    void Login() async {
      debugPrint("email : " + _emailController.text.toString());
      debugPrint("passwrod : " + _passwordController.text.toString());
      bool loginSuccess = await AuthManager().loginUser(
          _emailController.text.toString(),
          _passwordController.text.toString());
      if (loginSuccess) {
        debugPrint("login successful");
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TabsScreen()));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Login Failed'),
                content: Text('Invalid email or password.'),
                actions: [
                  ElevatedButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    }

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.3,
        title: const Text(
          "Log In",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Container(
              height: 25.75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png')),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "Sign in to your account",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFECECEC)),
              margin: const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
              child: TextField(
                controller: _emailController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Email address"),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFECECEC)),
              margin: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
              child: TextFormField(
                controller: _passwordController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Password"),
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(right: 40),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                      },
                      child: const Text("Forgot password?")),
                )
              ],
            ),
            SizedBox(
              width: 100,
              height: 50,
              child: Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: ElevatedButton(
                  onPressed: () => Login(),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.redAccent
                  ),
                  child: const Text("Sign in", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            SizedBox(height: w * 0.4),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Don\'t have an account?",
                    style: const TextStyle(color: Colors.black87, fontSize: 18),
                    children: [
                      TextSpan(
                        text: " Create",
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen())),
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}
