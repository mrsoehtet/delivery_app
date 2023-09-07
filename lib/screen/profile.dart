import 'package:delivery_app/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DelimenPannel",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Constants.blue,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            )),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        titleTextStyle:
                            const TextStyle(fontSize: 14, color: Colors.black),
                        content: Container(
                          color: Constants.blue,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Column(
                            //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                //  margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.only(right: 10),
                                child: CircleAvatar(
                                  radius: 37,
                                  backgroundColor: Colors.white24,
                                  child: CircleAvatar(
                                    maxRadius: 35,
                                    backgroundColor: Colors.black45,
                                    child: Icon(
                                      Icons.person,
                                      size: 55,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "aung naing",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white70),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Text(
                                  "Delivery Men",
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white70),
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Center(
                                  child: Text(
                                'Delivery Management System',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white70),
                              )),
                            ],
                          ),
                        ),
                        actions: [
                          Container(
                            // color: Colors.black12,
                            padding: EdgeInsets.only(left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  // style: TextButton.styleFrom(
                                  //     padding: const EdgeInsets.only(left: 70)),
                                  onPressed: () {
                                    // Get.to(LoginScreen());
                                  },
                                  child: Center(
                                    child: const Text(
                                      "Profile",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12),
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  // style: TextButton.styleFrom(
                                  //     padding: const EdgeInsets.only(left: 30)),
                                  onPressed: () {
                                    Get.to(() => LoginScreen());
                                    // Get.back();
                                  },
                                  child: Center(
                                    child: const Text("Sign out",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
                },
              );
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(children: [
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
            Card(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.425,
                child: Column(children: [
                  SizedBox(
                    height: 16,
                  ),
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
                          backgroundColor: Constants.profileBlue,
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "aung naing",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "Delivery Men",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
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
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontSize: 12,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                              fontSize: 12,
                              //color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
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
                      decoration: InputDecoration(
                        labelText: "deli men",
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
                      decoration: InputDecoration(
                        labelText: "09455006007",
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
                      decoration: InputDecoration(
                        labelText: "next change address",
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
                  SizedBox(
                    height: 35,
                    child: TextFormField(
                      controller: stateController,
                      focusNode: stateFocusNode,
                      decoration: InputDecoration(
                        labelText: "Select State",
                        labelStyle: TextStyle(fontSize: 12),
                        suffixIcon: Icon(Icons.arrow_drop_down),
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
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                    child: TextFormField(
                      controller: townshipController,
                      focusNode: townshipFocusNode,
                      decoration: InputDecoration(
                        labelText: "Select Township",
                        labelStyle: TextStyle(fontSize: 12),
                        suffixIcon: Icon(Icons.arrow_drop_down),
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.29,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Constants.blue),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Update",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Icon(Icons.change_circle_sharp)
                            ],
                          )),
                    ),
                  ),
                ]),
              ),
            )
          ]),
        ),
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
}
