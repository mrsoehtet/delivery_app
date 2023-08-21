import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:delivery_app/di.dart';
import 'package:delivery_app/screen/login.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<void> main() async {
  configure();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color blue = const Color(0xff3c8dbc);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Get.to(LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // AnimatedSplashScreen(
        //   splash: Column(children: [
        //     // Image.asset('assets/rabbit.png'),
        //     // Text("Welcome to Delimen")
        //     Lottie.asset('assets/icons/animation_llas16av.json',
        //         height: 100, width: 100)
        //   ]),
        //   nextScreen: LoginScreen(),
        //   splashTransition: SplashTransition.scaleTransition,
        //   backgroundColor: Constants.gray,
        //   duration: 3000,

        //   // pageTransitionType: PageTransitionType.scale,
        // );
        Scaffold(
      backgroundColor: Constants.gray,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/rabbit.png',
                width: 70,
                height: 70,
                scale: 0.1,
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Lottie.asset('assets/icons/loading2.json', width: 150, height: 150),
            // Text(
            //   "Welcome to Delimen",
            //   style: TextStyle(
            //       fontSize: 25,
            //       color: Colors.blue,
            //       fontWeight: FontWeight.w500),
            // ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
