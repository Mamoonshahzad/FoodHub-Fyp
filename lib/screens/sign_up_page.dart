import 'package:flutter/material.dart';
import 'package:projecthomepage/firebase/auth_manager.dart';
import 'package:projecthomepage/screens/home_screen.dart';
import 'package:projecthomepage/screens/tabs_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    void SignUp () async {
      debugPrint( _emailController.text.toString());
      bool loginSuccess = await AuthManager().registerUser(_emailController.text.toString(), _passwordController.text.toString());
      if (loginSuccess) {
        // Navigate to the home page
        Navigator.push(context, MaterialPageRoute(builder: (context) => const TabsScreen()));

      } else {
        // Show login error message
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
            }
        );
      }
    }

    return  Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.3,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
      ),

      body: Center(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 25.75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.png')),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Text(
                "Enter ur Details",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black87, fontSize: 25),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFECECEC)),
              margin:
              const EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
              child: TextFormField(
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
              margin:
              const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFECECEC)),
              margin:
              const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
              child: TextFormField(
                controller: _confirmPasswordController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Confirm Password"),
              ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 100,
              height: 50,
              child: Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                child: ElevatedButton(
                  onPressed: () => SignUp(),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: Colors.redAccent),
                  child:
                  const Text("Sign Up", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}
