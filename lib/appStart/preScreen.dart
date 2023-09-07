import 'package:delivery_app/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../utils/api.dart';
import '../utils/theme.dart';

class PreScreen extends StatefulWidget {
  const PreScreen({super.key});

  @override
  State<PreScreen> createState() => _PreScreenState();
}

class _PreScreenState extends State<PreScreen> {
  // void passedCheck() async {
  //   bool passedPickUpRequest = await Api.getPickUpRequest();
  //   if (passedPickUpRequest) {
  //     print('Good to go');
  //   } else {
  //     print('Something Error ');
  //   }
  // }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.to(LoginScreen());
      //passedCheck();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.gray,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Center(
              child: Image.asset(
                'assets/rabbit.png',
                width: 70,
                height: 70,
                scale: 0.1,
              ),
            ),
            Lottie.asset('assets/icons/loading2.json', width: 150, height: 150),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
