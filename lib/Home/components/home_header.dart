import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(4),
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.blueGrey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5),
          ],
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
