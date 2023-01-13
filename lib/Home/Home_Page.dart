import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/Home/components/signin_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.sort),
      centerTitle: true,
      title: const Text('Home Page',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 33),
          Center(
            child: ElevatedButton(
              child: const Text(
                'Log Out',
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Get.to(() => const SignInScreen());
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
