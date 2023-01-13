import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task1/Help/reusableTextField.dart';
import 'package:task1/Home/Home_Page.dart';
import 'package:task1/Home/components/home_header.dart';
import 'package:task1/Home/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 33),
              const HomeHeader(),
              const SizedBox(height: 33),
              const Center(
                  child: Text(
                'Welcome to Ecomik',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              )),
              const Center(
                child: Text(
                  'Hello there, Sign in to continue',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 66),
              const Text(
                'Email Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 10),
              reusableTextField(
                  "Enter Your Name", Icons.person, false, emailTextController),
              const SizedBox(height: 20),
              const Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 10),
              reusableTextField("Enter Your Password", Icons.lock, false,
                  passwordTextController),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  children: [
                    Switch(
                      onChanged: (bool value) {
                        setState(() => isChecked = value);
                        print(isChecked);
                      },
                      value: isChecked,
                    ),
                    const Text(
                      'Remember me',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 55),
                    TextButton(
                      child: Text('Forgot Password ?',
                          style: TextStyle(color: Colors.red.shade300)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue.shade400),
                child: TextButton(
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailTextController.text,
                            password: passwordTextController.text)
                        .then((value) {
                      Get.to(() => const HomePage());
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 33),
                  Text(
                    'Or Sign In with Social Account',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      // child: MaterialButton(
                      //   onPressed: () {
                      //     // _googleSignIn.signIn();
                      //   },
                        child: SvgPicture.asset(
                          'assets/images/icons8-google (2).svg',
                        ),
                      ),
                  const SizedBox(width: 15),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: SvgPicture.asset(
                        'assets/images/icons8-apple-logo.svg',
                      )),
                  const SizedBox(width: 15),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: SvgPicture.asset(
                        'assets/images/icons8-twitter.svg',
                      )),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account yet pls",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    child: const Text('Sign Up',
                        style: TextStyle(color: Colors.blue)),
                    onPressed: () {
                      Get.to(() => const HomeScreen());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
