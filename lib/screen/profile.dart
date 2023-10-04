import 'dart:convert';
import 'dart:io';
import 'package:delivery_app/appStart/appstart.dart';
import 'package:delivery_app/controller/getController.dart';
import 'package:delivery_app/screen/login.dart';
import 'package:delivery_app/service/authorizeService.dart';
import 'package:delivery_app/service/profileService.dart';
import 'package:delivery_app/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../utils/sharedPref.dart';
import '../utils/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController yourNameController = TextEditingController();
  FocusNode yourNameFocusNode = FocusNode();
  TextEditingController loginNameController = TextEditingController();
  FocusNode loginNameFocusNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneFocusNode = FocusNode();
  TextEditingController addressController = TextEditingController();
  FocusNode addressFocusNode = FocusNode();
  TextEditingController stateController = TextEditingController();
  FocusNode stateFocusNode = FocusNode();
  TextEditingController townshipController = TextEditingController();
  FocusNode townshipFocusNode = FocusNode();
  TextEditingController currentPasswordController = TextEditingController();
  FocusNode currentPasswordFocusNode = FocusNode();
  TextEditingController newPasswordController = TextEditingController();
  FocusNode newPasswordFocusNode = FocusNode();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocusNode = FocusNode();
  List<String> items = ["Yangon", "Mandalay", "Monywa", "Phay"];
  List<String> townships = ["Ahlone", "Hlaing", "SanChaung", "Insein"];
  String? value;
  String? township;
  bool isloading = false;
  var userid;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "DelimenPannel",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Constants.blue,
          leading: Text(''),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return Container(
                          // margin: EdgeInsets.only(bottom: 100),
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            titleTextStyle: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            content: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.17,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: Text(
                                      "You have 10 notifications",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person_add,
                                        color: Constants.realBlue,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Text(
                                          "5 new members joined today",
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Center(
                                      child: Text(
                                    'View all',
                                    style: TextStyle(fontSize: 12),
                                  )),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  );
                },
                icon: Icon(
                  Icons.notifications_outlined,
                )),
            InkWell(
              onTap: () {
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return StatefulBuilder(
                //         builder: (BuildContext context, StateSetter setState) {
                //       return Container(
                //         height: MediaQuery.of(context).size.height * 0.2,
                //         child: AlertDialog(
                //           contentPadding: EdgeInsets.zero,
                //           titleTextStyle: const TextStyle(
                //               fontSize: 14, color: Colors.black),
                //           content: Container(
                //             color: Constants.blue,
                //             width: MediaQuery.of(context).size.width,
                //             height: MediaQuery.of(context).size.height * 0.25,
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 10, vertical: 20),
                //             child: Column(
                //               //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 Stack(
                //                   children: [
                //                     Container(
                //                       //  margin: EdgeInsets.symmetric(horizontal: 5),
                //                       padding: EdgeInsets.only(right: 10),
                //                       child: CircleAvatar(
                //                         radius: 37,
                //                         backgroundColor: Colors.white24,
                //                         child: CircleAvatar(
                //                           maxRadius: 35,
                //                           backgroundColor: Colors.black45,
                //                           child: Icon(
                //                             Icons.person,
                //                             size: 55,
                //                             color: Colors.white54,
                //                           ),
                //                         ),
                //                       ),
                //                     ),

                //                   ],
                //                 ),
                //                 SizedBox(
                //                   height: 20,
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       left: 15, right: 15),
                //                   child: Text(
                //                     "aung naing",
                //                     style: const TextStyle(
                //                         fontSize: 12, color: Colors.white70),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 3,
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       left: 15, right: 15),
                //                   child: Text(
                //                     "Delivery Men",
                //                     style: const TextStyle(
                //                         fontSize: 12, color: Colors.white70),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 3,
                //                 ),
                //                 Center(
                //                     child: Text(
                //                   'Delivery Management System',
                //                   style: TextStyle(
                //                       fontSize: 12, color: Colors.white70),
                //                 )),
                //               ],
                //             ),
                //           ),
                //           actions: [
                //             Container(
                //               // color: Colors.black12,
                //               padding: EdgeInsets.only(left: 8),
                //               child: Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   OutlinedButton(
                //                     // style: TextButton.styleFrom(
                //                     //     padding: const EdgeInsets.only(left: 70)),
                //                     onPressed: () {
                //                       // Get.to(LoginScreen());
                //                     },
                //                     child: Center(
                //                       child: const Text(
                //                         "Profile",
                //                         style: TextStyle(
                //                             color: Colors.black54,
                //                             fontSize: 12),
                //                       ),
                //                     ),
                //                   ),
                //                   OutlinedButton(
                //                     // style: TextButton.styleFrom(
                //                     //     padding: const EdgeInsets.only(left: 30)),
                //                     onPressed: () {
                //                       Get.to(() => LoginScreen());
                //                       // Get.back();
                //                     },
                //                     child: Center(
                //                       child: const Text("Sign out",
                //                           style: TextStyle(
                //                               color: Colors.black54,
                //                               fontSize: 12)),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             )
                //           ],
                //         ),
                //       );
                //     });
                //   },
                // );
              },
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  maxRadius: 12,
                  backgroundColor: Colors.black45,
                  child: Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(child: Consumer(
          builder: (context, ref, child) {
            return Container(
                margin: EdgeInsets.all(16),
                child:
                    ref.watch(profileServiceProvider).when(data: (profileList) {
                  userid = profileList!.id;

                  return Column(children: [
                    Row(
                      children: [
                        Text(
                          "aung naing",
                          style: TextStyle(
                            fontSize: 20,
                            // color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      // width: MediaQuery.of(context).size.width * 0.95,
                      height: 30,
                      decoration: BoxDecoration(color: Constants.gray),
                      child: Row(children: [
                        Icon(Icons.dashboard),
                        Text(
                          ' Home > ',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          ' Dashboard >',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          ' Profile',
                          style: TextStyle(fontSize: 12),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Constants.realBlue,
                      ),
                      child: Row(children: [
                        Text(
                          'Delimen Control Panel::',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'You can change your\n info and Login Password.',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // ref.watch(profileServiceProvider).when(data: (profileList) {
                    //  return
                    Card(
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.425,
                        child: Column(children: [
                          SizedBox(
                            height: 16,
                          ),
                          Obx((() => OrderController
                                      .selectedImageAvatarPath.value ==
                                  ''
                              ? Stack(
                                  children: [
                                    Container(
                                      //  margin: EdgeInsets.symmetric(horizontal: 5),
                                      padding: EdgeInsets.only(right: 10),
                                      child: CircleAvatar(
                                        radius: 46,
                                        backgroundColor: Colors.black12,
                                        child: CircleAvatar(
                                          radius: 43,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            maxRadius: 37,
                                            backgroundColor:
                                                Constants.profileBlue,
                                            child: Icon(
                                              Icons.person,
                                              size: 60,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black54,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            onPressed: () {
                                              //userid = profileList!.id;
                                              setState(() {
                                                getAvatorImage(
                                                  ImageSource.gallery,
                                                );
                                              });
                                            },
                                            icon: Icon(
                                              Icons.camera_alt,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          )),
                                    )
                                  ],
                                )
                              // Text(
                              //     'Select image camera/gallery',
                              //     style: TextStyle(
                              //         fontWeight:
                              //             FontWeight.bold,
                              //         fontSize: Constants
                              //             .tDefaultSize))
                              : Stack(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.21,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.09,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 2, color: Colors.blue),
                                        ),
                                        child: ClipOval(
                                          child: SizedBox.fromSize(
                                            size: Size.fromRadius(46),
                                            child: Image.file(
                                              File(
                                                OrderController
                                                    .selectedImageAvatarPath
                                                    .value,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: -2,
                                      right: -1,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black54,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 2,
                                                  color: Colors.white)),
                                          width: 30,
                                          height: 30,
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                getAvatorImage(
                                                    ImageSource.gallery);
                                              });
                                            },
                                            icon: Center(
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                            ),
                                          )),
                                    ),
                                  ],
                                ))),
                          SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: profileList != null
                                ? Text(
                                    //  "aung naing",
                                    profileList.full_name!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  )
                                : Text('aung naing'),
                          ),
                          // : Text('aung naing')),
                          SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              "Delivery Men",
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ),
                          // Text(" userid $userid=${profileList!.id}"),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          _buildTwoText('Login Name', 'deli men'),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          _buildTwoText('Created Date', '13-Dec-2022'),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          _buildTwoText('Status', 'Active'),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                Get.to(() => LoginScreen());
                              },
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    // ref.watch(editProfileProvider).when(data: (editPhone) {
                    //return
                    Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: Column(children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            margin: EdgeInsets.symmetric(
                                // horizontal: 70,
                                ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TabBar(
                              padding: EdgeInsets.all(7),
                              unselectedLabelColor: Colors.black87,
                              labelStyle: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                              labelColor: Colors.white,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey,
                              ),
                              indicatorColor: Colors.white,
                              tabs: [
                                Tab(
                                  text: 'Edit Profile',
                                ),
                                Tab(
                                  text: 'Change Password',
                                )
                              ],
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.all(8.0),
                          //       child: Text(
                          //         "Edit Profile",
                          //         style: TextStyle(
                          //           fontSize: 12,
                          //           // color: Colors.white,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Card(
                          //       child: Container(
                          //         padding: EdgeInsets.symmetric(
                          //             horizontal: 35, vertical: 10),
                          //         child: Text(
                          //           "Change Password",
                          //           style: TextStyle(
                          //             fontSize: 12,
                          //             //color: Colors.grey,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: 16,
                          ),

                          Container(
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: TabBarView(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Your Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: yourNameController,
                                        focusNode: yourNameFocusNode,
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                          labelText: "aung naing",
                                          labelStyle: TextStyle(fontSize: 12),
                                          // suffixIcon: Icon(Icons.person),
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            //  borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              // width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Login Name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: loginNameController,
                                        focusNode: loginNameFocusNode,
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                          labelText: profileList!.login_name,
                                          labelStyle: TextStyle(fontSize: 12),
                                          // suffixIcon: Icon(Icons.person),
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            //  borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              // width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Phone',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: phoneController,
                                        focusNode: phoneFocusNode,
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                          labelText: profileList.phone,
                                          labelStyle: TextStyle(fontSize: 12),
                                          // suffixIcon: Icon(Icons.person),
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            //  borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              // width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'Address',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 35,
                                      child: TextFormField(
                                        controller: addressController,
                                        focusNode: addressFocusNode,
                                        style: TextStyle(fontSize: 12),
                                        decoration: InputDecoration(
                                          labelText: profileList.address,
                                          labelStyle: TextStyle(fontSize: 12),
                                          // suffixIcon: Icon(Icons.person),
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            // borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.black54,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            //  borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide(
                                              color: Colors.grey,
                                              // width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            'State / Township',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      //margin: EdgeInsets.all(16),

                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          hint: Text(
                                            "Select State",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          value: value,
                                          isExpanded: true,
                                          items:
                                              items.map(buildMenuItem).toList(),
                                          onChanged: (value) => setState(
                                              () => this.value = value),
                                        ),
                                      ),

                                      // value: selecttownshipDetailPick,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      //margin: EdgeInsets.all(16),

                                      padding:
                                          EdgeInsets.symmetric(horizontal: 7),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          hint: Text(
                                            "Select Township",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          value: township,
                                          isExpanded: true,
                                          items: townships
                                              .map(buildTownshipItem)
                                              .toList(),
                                          onChanged: (township) => setState(
                                              () => this.township = township),
                                        ),
                                      ),

                                      // value: selecttownshipDetailPick,
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Consumer(
                                      builder: (context, ref, child) {
                                        return isloading
                                            ? Align(
                                                alignment: Alignment.topLeft,
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
                                                              12),
                                                      color: Constants.blue),
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                    //strokeWidth: 2,
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  print('Show Error *********');
                                                  phoneFocusNode.unfocus();

                                                  if (phoneController.text !=
                                                      "") {
                                                    setState(() {
                                                      isloading = true;
                                                    });
                                                    ref
                                                        .watch(
                                                            authServiceProvider)
                                                        .update(
                                                          phone: phoneController
                                                              .text,
                                                        )
                                                        .then((value) async {
                                                      print(value);
                                                      var status =
                                                          value["status"];
                                                      if (status.toString() ==
                                                          "true") {
                                                        // var token =
                                                        //     value["token"];
                                                        // await SharedPref.setData(
                                                        //     key: SharedPref
                                                        //         .token,
                                                        //     value:
                                                        //         "Bearer $token");

                                                        setState(() {
                                                          isloading = false;
                                                          Get.snackbar(
                                                            "Alert",
                                                            "Phone Number Updated Successfully",
                                                            backgroundColor:
                                                                Colors.green,
                                                          );
                                                        });
                                                        Get.off(() =>
                                                            AppStartScreen());
                                                      } else {
                                                        setState(() {
                                                          isloading = false;
                                                          phoneController
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
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.29,
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.18,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.045,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Constants.blue,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              "Update",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .change_circle_sharp,
                                                              color:
                                                                  Colors.white,
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                              );
                                      },
                                    ),
                                  ],
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Current Password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 35,
                                        child: TextFormField(
                                          controller: currentPasswordController,
                                          focusNode: currentPasswordFocusNode,
                                          style: TextStyle(fontSize: 12),
                                          decoration: InputDecoration(
                                            labelText: "",
                                            labelStyle: TextStyle(fontSize: 12),

                                            // suffixIcon: Icon(Icons.person),
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                              // borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                color: Colors.black54,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              //  borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                                // width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'New Password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 35,
                                        child: TextFormField(
                                          controller: newPasswordController,
                                          focusNode: newPasswordFocusNode,
                                          style: TextStyle(fontSize: 12),
                                          decoration: InputDecoration(
                                            labelText: "",
                                            labelStyle: TextStyle(fontSize: 12),
                                            // suffixIcon: Icon(Icons.person),
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                              // borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                color: Colors.black54,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              //  borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                                // width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'Confirm Password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 35,
                                        child: TextFormField(
                                          controller: confirmPasswordController,
                                          focusNode: confirmPasswordFocusNode,
                                          style: TextStyle(fontSize: 12),
                                          decoration: InputDecoration(
                                            labelText: "",
                                            labelStyle: TextStyle(fontSize: 12),
                                            fillColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                              // borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                color: Colors.black54,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              //  borderRadius: BorderRadius.circular(10.0),
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                                // width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Consumer(
                                        builder: (context, ref, child) {
                                          return isloading
                                              ? Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.22,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.0575,
                                                    padding: EdgeInsets.all(15),
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: Constants.blue),
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Colors.white,
                                                      //strokeWidth: 2,
                                                    ),
                                                  ),
                                                )
                                              : GestureDetector(
                                                  onTap: () {
                                                    currentPasswordFocusNode
                                                        .unfocus();
                                                    newPasswordFocusNode
                                                        .unfocus();
                                                    confirmPasswordFocusNode
                                                        .unfocus();

                                                    if (currentPasswordController
                                                                .text !=
                                                            "" &&
                                                        newPasswordController
                                                                .text !=
                                                            "" &&
                                                        confirmPasswordController
                                                                .text !=
                                                            "") {
                                                      setState(() {
                                                        isloading = true;
                                                      });
                                                      ref
                                                          .watch(
                                                              authServiceProvider)
                                                          .changePassword(
                                                            old_password:
                                                                currentPasswordController
                                                                    .text,
                                                            new_password:
                                                                newPasswordController
                                                                    .text,
                                                            confirm_password:
                                                                confirmPasswordController
                                                                    .text,
                                                          )
                                                          .then((value) async {
                                                        print(value);
                                                        var status = value
                                                            .data["status"];
                                                        if (status.toString() ==
                                                            "true") {
                                                          setState(() {
                                                            isloading = false;
                                                          });
                                                          Get.off(() =>
                                                              LoginScreen());
                                                        } else {
                                                          setState(() {
                                                            isloading = false;
                                                            currentPasswordController
                                                                .clear();
                                                            newPasswordController
                                                                .clear();
                                                            confirmPasswordController
                                                                .clear();
                                                            // phoneController
                                                            //     .clear();

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
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: Constants
                                                                  .blue,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.2,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.045,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                "Change",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                width: 3,
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .change_circle_sharp,
                                                                color: Colors
                                                                    .white,
                                                              )
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ]);
                }, error: (Object error, StackTrace stackTrace) {
                  return Text(error.toString());
                }, loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }));
          },
        )),
      ),
    );
  }

  _buildTwoText(String t1, t2) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            t1,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            t2,
            style: TextStyle(color: Constants.blue, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Future<String?> uploadImage(filename, url) async {
    print("Hello from profile Image Upload $filename");
    var res;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    final token = await SharedPref.getData(key: SharedPref.token);
    request.headers['Authorization'] = token!;
    request.headers['Accept'] = "application/json";

    request.fields['delimen_id'] = userid.toString();

    request.files.add(await http.MultipartFile.fromPath('photo', filename));

    //request.files.add(await http.MultipartFile.fromPath('photo', filename));

    print("Profile userid ******************* $userid");

    print("Token : $request");
    // var response = await request.send();
    //var res = await request.send();
    //await request.send().then((response) => print(response));

    await request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((value) {
        var resData = jsonDecode(value);
        print("ResData : $resData");
        res = resData['message'];

        // setState(() {
        //   //uploadImage = imageRes.path;
        // });
      });
    }).catchError((e) {
      print(e);
    });
    print(res);

    return res;
  }

  // Future<void> uploadPhotoToApi(String imgaePath) async {
  //   final url = Uri.parse(APIURL.addWayWithPhoto);
  //   final request = http.MultipartRequest('POST', url);

  //   final file = File(imgaePath);
  //   final multipartFile = await http.MultipartFile.fromPath('photo', file.path);
  //   request.files.add(multipartFile);

  //   final response = await request.send();

  //   if (response.statusCode == 200) {
  //     print('Photo Uploaded Succefully');
  //   } else {
  //     print('Failed to upload photo with status code: ${response.statusCode}');
  //   }
  // }

  getAvatorImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    var res = await uploadImage(
      pickedFile!.path,
      APIURL.updateAvatar,
    );
    print("Picked File ${pickedFile!.path}");
    // var res = await uploadPhotoToApi(pickedFile.path);

    setState(() {
      if (pickedFile != null) {
        OrderController.selectedImageAvatarPath.value = pickedFile.path;

        print(
            "Photo Result *******: ${OrderController.selectedImageAvatarPath.value}");
      } else {
        Get.snackbar('Error', 'No image selected',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    });
    print(res);
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildTownshipItem(String township) {
    return DropdownMenuItem(
      value: township,
      child: Text(
        township,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
