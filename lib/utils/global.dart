import 'dart:convert';

import 'package:delivery_app/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/isLoginController.dart';
import '../controller/rememberController.dart';
import '../screen/login.dart';
import '../screen/profile.dart';
import 'theme.dart';

class Global {
  //Default Token
  static String? token;
  static String? language;
  static String? version;

  //info
  static String? privacyPolicy;
  static String? termCondition;
  static String? asxoxFacebook;
  static String? about;
  static String? mission;
  static String? history;
  static int wishListCount = 0;
  static int orderCount = 0;
  static int messageCount = 0;
  static String? threeDExpireTime;
  static String? twoDExpireTime;
  static String? morningNumber;
  static String? eveningNumber;
  final IsLoginController isLoginController = Get.find();

  static bool isLoading = false;

  //Token header
  static final Map<String, String> tokenHeaders = {
    "Content-Type": "application/json",
    "authorization": "$token",
  };

  static final Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  //Profile
  // static ProfileData? profileData;

  //Register User
  static String? email;
  static String? password;

  //Pagination
  static int lastPage = 0;
  static int currentPage = 0;
  static String? showProductsFinished;

  static List<String> genderList = ["Male".tr, "Female".tr];

  static List<String> maritalList = ["Single", "Married"];

  //Format Price
  static String formatPrice(int price) {
    var f = NumberFormat("##,###");
    return f.format(price) + " Ks";
  }

  static String formatDate(String date) {
    //2020-11-04T13:36:02.541Z
    var str = date.substring(0, 10) + ' ' + date.substring(11, 23);
    DateTime dt = DateTime.parse(str);
    //String newDate = DateFormat("EEE, d MMM yyyy").format(dt);
    String newDate = DateFormat("dd-MM-yyyy").format(dt);
    return newDate;
  }

  static String prettyPrint(Map json) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  static priceFormat(var price) {
    // NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    // return myFormat.format(price.abs());
  }

  //Check LogIn Status
  static bool isLogIn = false;

  static Future loginStatus() async {
    var tokentemp = await SharedPref.getData(key: SharedPref.token);

    if (tokentemp == null) {
      isLogIn = false;
    } else {
      isLogIn = true;
      token = tokentemp;
      // var tokenUser = await SharedPref.getUser(key: SharedPref.profile);
    }
  }

  static checkToken(statusCode) {
    if (statusCode == 403) {
      // Global.showBanDialog(context);
      // naviController.currentIndex.value = 3;
      // Get.off(() => NaviScreen());
      Get.snackbar(
        "Alert",
        "သင့်အကောင့် Lock ကျနေပါသည်။",
        backgroundColor: Colors.lightGreenAccent,
      );
      return null;
    } else {
      return true;
    }
  }

  static void showBanDialog(context) {
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
                    image: AssetImage('assets/images/AccountLockPopup.png'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 70.0, left: 15, right: 15),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 15, right: 15),
                  //   child: Text(
                  //     "Logout".tr,
                  //     style:
                  //         const TextStyle(fontSize: 18),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: Text("သင့်အကောင့် Lock ကျနေပါသည်။"),
                  ),
                  InkWell(
                    onTap: () async {
                      SystemNavigator.pop();
                    },
                    child: Container(
                      width: 80,
                      height: 30,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          //color: CustomColors.mainColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      child: Text(
                        'OK'.tr,
                        style: const TextStyle(
                          fontSize: 12,
                          // color: CustomColors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static void showLogInDialog() {
    Get.defaultDialog(
        title: "Login".tr,
        titleStyle: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
        middleText: 'You need to login first'.tr,
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Container(
              width: 80,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  border: Border.all(color: Colors.deepOrange, width: 1)),
              child: Text(
                'Cancel'.tr,
                style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.back();
              //  NaviController.to.currentIndex.value = 3;
              Get.back();
            },
            child: Container(
              width: 80,
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Text(
                'Login'.tr,
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ]);
  }

  static void showComingSoonDialog(screenSize) {
    Get.defaultDialog(
        titleStyle: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold),
        title: "Alert",
        middleText: "Coming Soon".tr,
        actions: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 80,
              height: 30,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ]);
  }

  static Future<void> launchToSite(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
    )) {
      throw 'Could not launch $url';
    }
  }

  static AppBar defalultAppBar =
      //  AppBar(
      //   title: Text(
      //     "DelimenPannel",
      //     style: TextStyle(fontSize: 18),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Constants.blue,
      //   leading: IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.menu,
      //       )),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           showDialog(
      //             context: context,
      //             builder: (context) {
      //               return StatefulBuilder(
      //                   builder: (BuildContext context, StateSetter setState) {
      //                 return Container(
      //                   // margin: EdgeInsets.only(bottom: 100),
      //                   height: MediaQuery.of(context).size.height * 0.2,
      //                   child: AlertDialog(
      //                     contentPadding: EdgeInsets.zero,
      //                     titleTextStyle:
      //                         const TextStyle(fontSize: 14, color: Colors.black),
      //                     content: Container(
      //                       width: MediaQuery.of(context).size.width,
      //                       height: MediaQuery.of(context).size.height * 0.17,
      //                       padding: const EdgeInsets.symmetric(
      //                           horizontal: 10, vertical: 20),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                         children: [
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.only(left: 15, right: 15),
      //                             child: Text(
      //                               "You have 10 notifications",
      //                               style: const TextStyle(fontSize: 12),
      //                             ),
      //                           ),
      //                           Divider(),
      //                           Row(
      //                             children: [
      //                               Icon(
      //                                 Icons.person_add,
      //                                 color: Constants.realBlue,
      //                               ),
      //                               Padding(
      //                                 padding: const EdgeInsets.only(
      //                                     left: 15, right: 15),
      //                                 child: Text(
      //                                   "5 new members joined today",
      //                                   style: const TextStyle(fontSize: 12),
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           Divider(),
      //                           Center(
      //                               child: Text(
      //                             'View all',
      //                             style: TextStyle(fontSize: 12),
      //                           )),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               });
      //             },
      //           );
      //         },
      //         icon: Icon(
      //           Icons.notifications_outlined,
      //         )),
      //     InkWell(
      //       onTap: () {
      //         showDialog(
      //           context: context,
      //           builder: (context) {
      //             return StatefulBuilder(
      //                 builder: (BuildContext context, StateSetter setState) {
      //               return Container(
      //                 height: MediaQuery.of(context).size.height * 0.2,
      //                 child: AlertDialog(
      //                   contentPadding: EdgeInsets.zero,
      //                   titleTextStyle:
      //                       const TextStyle(fontSize: 14, color: Colors.black),
      //                   content: Container(
      //                     color: Constants.blue,
      //                     width: MediaQuery.of(context).size.width,
      //                     height: MediaQuery.of(context).size.height * 0.25,
      //                     padding: const EdgeInsets.symmetric(
      //                         horizontal: 10, vertical: 20),
      //                     child: Column(
      //                       //  mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                       children: [
      //                         Container(
      //                           //  margin: EdgeInsets.symmetric(horizontal: 5),
      //                           padding: EdgeInsets.only(right: 10),
      //                           child: CircleAvatar(
      //                             radius: 37,
      //                             backgroundColor: Colors.white24,
      //                             child: CircleAvatar(
      //                               maxRadius: 35,
      //                               backgroundColor: Colors.black45,
      //                               child: Icon(
      //                                 Icons.person,
      //                                 size: 55,
      //                                 color: Colors.white54,
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 20,
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 15, right: 15),
      //                           child: Text(
      //                             "aung naing",
      //                             style: const TextStyle(
      //                                 fontSize: 12, color: Colors.white70),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 3,
      //                         ),
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 15, right: 15),
      //                           child: Text(
      //                             "Delivery Men",
      //                             style: const TextStyle(
      //                                 fontSize: 12, color: Colors.white70),
      //                           ),
      //                         ),
      //                         SizedBox(
      //                           height: 3,
      //                         ),
      //                         Center(
      //                             child: Text(
      //                           'Delivery Management System',
      //                           style:
      //                               TextStyle(fontSize: 12, color: Colors.white70),
      //                         )),
      //                       ],
      //                     ),
      //                   ),
      //                   actions: [
      //                     Container(
      //                       // color: Colors.black12,
      //                       padding: EdgeInsets.only(left: 8),
      //                       child: Row(
      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                         children: [
      //                           OutlinedButton(
      //                             // style: TextButton.styleFrom(
      //                             //     padding: const EdgeInsets.only(left: 70)),
      //                             onPressed: () {
      //                               Get.to(ProfileScreen());
      //                             },
      //                             child: Center(
      //                               child: const Text(
      //                                 "Profile",
      //                                 style: TextStyle(
      //                                     color: Colors.black54, fontSize: 12),
      //                               ),
      //                             ),
      //                           ),
      //                           OutlinedButton(
      //                             // style: TextButton.styleFrom(
      //                             //     padding: const EdgeInsets.only(left: 30)),
      //                             onPressed: () {
      //                               Get.to(() => LoginScreen());
      //                               // Get.back();
      //                             },
      //                             child: Center(
      //                               child: const Text("Sign out",
      //                                   style: TextStyle(
      //                                       color: Colors.black54, fontSize: 12)),
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               );
      //             });
      //           },
      //         );
      //       },
      //       child: Container(
      //         padding: EdgeInsets.only(right: 10),
      //         child: CircleAvatar(
      //           maxRadius: 12,
      //           backgroundColor: Colors.black45,
      //           child: Icon(
      //             Icons.person,
      //             size: 20,
      //             color: Colors.white54,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // );
      AppBar(
    automaticallyImplyLeading: false,
    // backgroundColor: CustomColors.white,
    title: Container(
      height: 30,
      child: Row(children: [
        Container(
          height: 30,
          child: Image.asset("assets/icons/appstore.png"),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person_rounded,
            // color: CustomColors.mainColor,
          ),
        ),
      ]),
    ),
  );

  static LinearGradient shimmerGradient = const LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );

  static removeRememberUser() {
    final RememberController rememberController = Get.find();
    final rememberUsername = rememberController.readRememberUsername();
    final rememberPassword = rememberController.readRememberPassword();
    if (rememberUsername != null && rememberPassword != null) {
      rememberController.removeRememberUsername();
      rememberController.removeRememberPassword();
    }
  }

  //2021-06-10T16:14:18.000000Z
  static String dateTimeConvert({required String dateTime}) {
    final date =
        DateFormat("EEE, d MMM yyyy h:mm a").format(DateTime.parse(dateTime));
    return date;
  }

  LogOut() {
    SharedPref.clear();
    // Global.user = null;
    isLoginController.logout();
    // NaviController.to.currentIndex.value = 0;
  }
}
