import 'package:flutter/material.dart';
import '';
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile",
          style: TextStyle(
            color: Colors.orange.shade800,
          ),
        ),
        backgroundColor: Colors.white,



      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                    image: DecorationImage(
                        image: AssetImage("assets/images/login.png"),),
                    shape: BoxShape.circle),
              ),
              const SizedBox(height: 16),
              Text(
                'Food Hub',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 8),
              Text(
                'foodhub@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800,
                ),
                onPressed: () {
                  // TODO: Implement edit profile functionality
                },
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
