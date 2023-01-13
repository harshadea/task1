import 'package:flutter/material.dart';
import 'package:task1/Home/components/sign_up.dart';
import 'components/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 44),
            Padding(
              padding: EdgeInsets.all(2),
              child: HomeHeader(),
            ),
            SizedBox(height: 33),
            SignUpScreen(),
          ],
        ),
      ),
    );
  }
}
