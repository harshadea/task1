import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/Home/components/signin_screen.dart';

import '../../Help/reusableTextField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Center(
              child: Text(
            'Getting Started',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          )),
          const Center(
            child: Text(
              'Hello there, Sign up to continue',
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 66),
          const Text(
            'Your name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 10),
          reusableTextField(
              "Enter Your Name", Icons.person, false, nameTextController),
          const SizedBox(height: 20),
          const Text(
            'Email Address',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 10),
          reusableTextField("Enter Your Email address", Icons.mail, false,
              emailTextController),
          const SizedBox(height: 20),
          const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 10),
          reusableTextField(
              "Enter Your Password", Icons.lock, false, passwordTextController),
          const SizedBox(height: 20),
          Center(
            child: Row(
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.blue,
                    visualDensity: VisualDensity.compact,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                        print(isChecked);
                      });
                    }),
                const Text(
                  'By Signing up I agree to the',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Text(
                  ' Terms of services ',
                  style: TextStyle(
                      color: Colors.blue.shade300, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                ' and',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                ' Privacy Policy',
                style: TextStyle(
                    color: Colors.blue.shade300, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 44),
          Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue.shade400),
            child: TextButton(
              child: const Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: emailTextController.text,
                        password: passwordTextController.text)
                    .then((value) {
                      print("Created New Account");
                  Get.to(() => const SignInScreen());
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account ?',
                style: TextStyle(color: Colors.blue.shade300),
              ),
              TextButton(
                  onPressed: () {
                    Get.to(() => const SignInScreen());},
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue.shade300),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
