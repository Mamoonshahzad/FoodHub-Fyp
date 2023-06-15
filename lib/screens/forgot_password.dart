import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
final TextEditingController _emailController = TextEditingController();
final auth = FirebaseAuth.instance;

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title: Text("    Forgot Password   ",
          style: TextStyle(
            color: Colors.orange.shade800,
          ),
        ),
        backgroundColor: Colors.white,

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){
                auth.sendPasswordResetEmail(email: _emailController.text.toString()).then((value) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success'),
                          content: Text('Password reset email sent to you.'),
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

                }).onError((error, stackTrace){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Error'),
                          content: Text(error.toString()),
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
                });
                Navigator.pop(context);
              },
              child: Text("Send Email"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade800,
              ),
            ),


          ],
        ),
      ),
    );
  }
}
