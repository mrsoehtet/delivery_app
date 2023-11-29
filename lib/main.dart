import 'package:delivery_app/appStart/preScreen.dart';
import 'package:delivery_app/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  configure();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  //await SystemChrome.setPreferredOrientations(
  //  [DeviceOrientation.landscapeLeft]);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: PreScreen(),

      //home: NaviScreen(),
    );
  }
}
