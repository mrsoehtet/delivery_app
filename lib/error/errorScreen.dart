import 'package:delivery_app/controller/isLoginController.dart';
import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/utils/sharedPref.dart';
import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../appStart/preScreen.dart';
import '../utils/global.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen(
      {Key? key,
      required this.aspectR,
      required this.iconSize,
      required this.textSize,
      this.tryAgain,
      required this.profile});
  final double aspectR;
  final double iconSize;
  final double textSize;
  final VoidCallback? tryAgain;
  final bool profile;
  @override
  Widget build(BuildContext context) {
    final IsLoginController isLoginController = Get.put(IsLoginController());
    return AspectRatio(
      aspectRatio: aspectR,
      child: Column(
        children: [
          Icon(
            Icons.warning,
            size: iconSize,
            color: Colors.red.withOpacity(0.8),
          ),
          Text(
            "Something went wrong!",
            style: TextStyle(fontSize: textSize),
          ),
          SizedBox(
            height: 7,
          ),
          profile
              ? InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          content: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.6,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/puLogout.png'),
                                    fit: BoxFit.fill)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 70.0, left: 15, right: 15),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Text(
                                      "Logout".tr,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: Text('Are you sure to logout?'.tr),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () => Get.back(),
                                        child: Container(
                                          width: 80,
                                          height: 30,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(15.0)),
                                              border: Border.all(
                                                  color: Color(0xFF8E24AA),
                                                  width: 1)),
                                          child: Text(
                                            'Cancel'.tr,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF8E24AA)),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          SharedPref.clear();
                                          isLoginController.logout();
                                          Global.loginStatus();
                                          Global.isLogIn = false;
                                          NaviController.to.currentIndex.value =
                                              0;
                                          Get.back();
                                          Get.off(() => PreScreen());
                                          Get.snackbar(
                                            "Notice",
                                            "Logout Successfully",
                                            backgroundColor:
                                                Constants.kPrimaryLightColor,
                                          );
                                        },
                                        child: Container(
                                          width: 80,
                                          height: 30,
                                          alignment: Alignment.center,
                                          decoration: const BoxDecoration(
                                              color: Color(0xFF8E24AA),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15.0))),
                                          child: Text(
                                            'Logout'.tr,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    color: Constants.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.05,
                      alignment: Alignment.center,
                      child: Text(
                        "Logout".tr,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  height: 10,
                ),
        ],
      ),
    );
  }
}
