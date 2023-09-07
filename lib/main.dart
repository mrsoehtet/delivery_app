import 'package:delivery_app/di.dart';
import 'package:delivery_app/screen/home.dart';
import 'package:delivery_app/screen/login.dart';
import 'package:delivery_app/screen/pickup/PickupScreen.dart';
import 'package:delivery_app/screen/pickup/process/pickupProcess.dart';
import 'package:delivery_app/screen/pickup/process/pickupProcessDetails.dart';
import 'package:delivery_app/screen/pickup/request/pickupRequest.dart';
import 'package:delivery_app/screen/pickup/report/report.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/appStart/preScreen.dart';
import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'screen/pickup/donePickup/pickupDone.dart';

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
      home: PreScreen(),
      //PreScreen(),
    );
  }
}
