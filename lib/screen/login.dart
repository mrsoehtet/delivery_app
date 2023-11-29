import 'package:delivery_app/appStart/appstart.dart';
import 'package:delivery_app/appStart/naviScreen.dart';
import 'package:delivery_app/utils/global.dart';
import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../controller/rememberController.dart';
import '../service/authorizeService.dart';
import '../utils/sharedPref.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  RememberController rememberController = Get.put(RememberController());
  bool _remember = false;
  String? rememberName;
  String? rememberPassword;
  // bool showPassword = false;
  bool isloading = false;

  var _isObscured;
  bool? isChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    _isObscured = true;
    super.initState();
    checkRememberUser();
  }

  checkRememberUser() async {
    rememberName = rememberController.readRememberUsername();
    rememberPassword = rememberController.readRememberPassword();
    if (rememberName != "" &&
        rememberName != null &&
        rememberPassword != "" &&
        rememberPassword != null) {
      setState(() {
        nameController.text = rememberName!;
        passwordController.text = rememberPassword!;
        _remember = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // bool? isChecked = false;

    return Scaffold(
      //backgroundColor: Colors.blue[100],
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: size.height / 2),
              height: size.height / 5 * 2.1,
              decoration: BoxDecoration(
                  color: Constants.gray,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        40,
                      ),
                      bottomRight: Radius.circular(40))),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/rabbit.png',
                      width: 70,
                      height: 70,
                      // scale: 0.1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bunny",
                        style: TextStyle(
                            color: Constants.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(
                        "Run",
                        style: TextStyle(fontSize: 30, color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width * 0.85,
                          // height: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Center(
                                  child: Text(
                                    'Delimen Login',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 45,
                                  child: TextFormField(
                                    controller: nameController,
                                    focusNode: nameFocusNode,
                                    decoration: InputDecoration(
                                      labelText: "user name",
                                      labelStyle: TextStyle(fontSize: 12),
                                      suffixIcon: Icon(Icons.person),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  height: 45,
                                  child: TextFormField(
                                    obscureText: _isObscured,
                                    controller: passwordController,
                                    focusNode: passwordFocusNode,
                                    decoration: InputDecoration(
                                      labelText: "password",
                                      labelStyle: TextStyle(fontSize: 12),
                                      suffixIcon: IconButton(
                                        icon: _isObscured
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscured = !_isObscured;
                                          });
                                        },
                                      ),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          _remember = !_remember;
                                        });
                                      },
                                      child: _remember
                                          ? Icon(
                                              Icons.check_box,
                                              color: Colors.blue,
                                              size: 25,
                                            )
                                          : Icon(
                                              Icons.check_box_outline_blank,
                                              color: Colors.blue,
                                              size: 25,
                                            ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Remember User".tr,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(.9),
                                          fontSize: 12),
                                    ),
                                    // Checkbox(
                                    //     value: isChecked,
                                    //     activeColor: Colors.blue,
                                    //     tristate: true,
                                    //     onChanged: (newBool) {
                                    //       setState(() {
                                    //         isChecked = newBool;
                                    //       });
                                    //     }),
                                    // Text(
                                    //   "Remember me",
                                    //   style: TextStyle(fontSize: 12),
                                    // ),
                                    SizedBox(
                                      width: 45,
                                    ),
                                    Consumer(
                                      builder: (context, ref, child) {
                                        return isloading
                                            ? Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.22,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.0575,
                                                padding: EdgeInsets.all(15),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: Constants.blue),
                                                child: SizedBox(
                                                  height: 30,
                                                  width: 30,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                    //strokeWidth: 2,
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  nameFocusNode.unfocus();
                                                  passwordFocusNode.unfocus();
                                                  if (nameController.text !=
                                                          "" &&
                                                      passwordController.text !=
                                                          "") {
                                                    setState(() {
                                                      isloading = true;
                                                    });
                                                    ref
                                                        .watch(
                                                            authServiceProvider)
                                                        .login(
                                                          phone: nameController
                                                              .text,
                                                          password:
                                                              passwordController
                                                                  .text,
                                                        )
                                                        .then((value) async {
                                                      print(value);
                                                      var status =
                                                          value["status"];
                                                      if (status.toString() ==
                                                          "true") {
                                                        var token =
                                                            value["token"];
                                                        await SharedPref.setData(
                                                            key: SharedPref
                                                                .token,
                                                            value:
                                                                "Bearer $token");
                                                        if (_remember) {
                                                          print("Remember");
                                                          rememberController
                                                              .saveRememberUserName(
                                                                  username:
                                                                      nameController
                                                                          .text);
                                                          rememberController
                                                              .saveRememberPassword(
                                                                  password:
                                                                      passwordController
                                                                          .text);
                                                        } else {
                                                          rememberController
                                                              .removeRememberUsername();
                                                          rememberController
                                                              .removeRememberPassword();
                                                        }
                                                        Global.isLogIn = true;
                                                        Global.loginStatus();
                                                        setState(() {
                                                          isloading = false;
                                                        });
                                                        Get.off(() =>
                                                            NaviScreen());
                                                      } 
                                                      else {
                                                        setState(() {
                                                          isloading = false;
                                                          nameController
                                                              .clear();
                                                          passwordController
                                                              .clear();
                                                          Get.snackbar(
                                                            "Alert",
                                                            "အကောင့်ဝင်ခြင်း မအောင်မြင်ပါ",
                                                            backgroundColor:
                                                                Colors
                                                                    .redAccent,
                                                          );
                                                        });
                                                      }
                                                    });
                                                  } else {
                                                    Get.snackbar(
                                                      "Alert",
                                                      "Please Enter Required Field",
                                                      backgroundColor:
                                                          Colors.redAccent,
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.22,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.0575,
                                                  padding: EdgeInsets.all(15),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Constants.blue
                                                      // gradient: LinearGradient(
                                                      //     colors: [
                                                      //       Colors.red,
                                                      //       Colors.red.shade200
                                                      //     ])
                                                      ),
                                                  child: Text(
                                                    'Login',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        //     .withOpacity(.8),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              );
                                      },
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
