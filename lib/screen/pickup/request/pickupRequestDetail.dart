import 'dart:convert';
import 'dart:io';
import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/model/pickupWays/pickupList/pickupList.dart';
import 'package:delivery_app/screen/deleteButtonScreen.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/service/pickupWays.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:delivery_app/utils/global.dart';
import 'package:delivery_app/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../controller/getController.dart';
import '../../../utils/theme.dart';
import 'package:http/http.dart' as http;
import '../../login.dart';

class PickupRequestDetails extends ConsumerStatefulWidget {
  final String id;
  const PickupRequestDetails({super.key, required this.id});

  @override
  ConsumerState<PickupRequestDetails> createState() =>
      _PickupRequestDetailsState();
}

class _PickupRequestDetailsState extends ConsumerState<PickupRequestDetails> {
  var orders = Get.find<OrderController>().orders;
  TextEditingController countController = TextEditingController();
  FocusNode countFocusNode = FocusNode();
  List<String> items = ["30", "50", "100", "All"];
  String? value;
  var getResult = 'QR Code Result';
  var parcelid;
  var deleteid;

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  //String? id;

  @override
  void initState() {
    _refresh();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.invalidate(pickupWaysServiceProvider(widget.id));
    });
    super.initState();
  }

  buildBottomNavigationMenu(context, naviController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: Global.changePage,
            currentIndex: naviController.currentIndex.value,
            // backgroundColor: Color.fromRGBO(101, 10, 10, 0.8),
            backgroundColor: Constants.blue,
            unselectedItemColor: Colors.white,
            selectedItemColor: Constants.red,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.home,
                    size: 20.0,
                  ),
                ),
                label: 'Home'.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.card_giftcard,
                    size: 20.0,
                  ),
                ),
                label: 'Pickup'.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.qr_code,
                    size: 20.0,
                  ),
                ),
                label: 'Scan'.tr,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.delivery_dining,
                    size: 20.0,
                  ),
                ),
                label: 'Delivery',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.person_sharp,
                    size: 20.0,
                  ),
                ),
                label: 'Account'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NaviController naviController = Get.put(NaviController());

    return WillPopScope(
      onWillPop: () {
        Get.back(result: true);
        return Future(() => true);
      },
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
        appBar: AppBar(
          title: Text(
            "DelimenPannel",
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Constants.blue,
          leading: IconButton(
              onPressed: () {
                Get.back(result: true);
              },
              icon: Icon(
                Icons.arrow_back,
              )),
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
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          titleTextStyle: const TextStyle(
                              fontSize: 14, color: Colors.black),
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
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
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
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                    // style: TextButton.styleFrom(
                                    //     padding: const EdgeInsets.only(left: 70)),
                                    onPressed: () {
                                      Get.to(()=>ProfileScreen());
                                    },
                                    child: Center(
                                      child: const Text(
                                        "Profile",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12),
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
            child: Consumer(builder: (context, ref, child) {
          return Container(
            margin: EdgeInsets.all(16),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Delimen",
                    style: TextStyle(
                      fontSize: 20,
                      // color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Got Parcel List",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              ref.watch(pickupWaysServiceProvider(widget.id)).when(
                  data: (pickupList) {
                onPressed(id) {
                  setState() {
                    pickupList.data!.remove(pickupList.data![id]);
                  }
                }

                return Card(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (() {
                                setState(() {
                                  parcelid = widget.id;
                                });
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.72,
                                        child: AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          titleTextStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                          content: StatefulBuilder(builder:
                                              (context, SetStateDialog) {
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.8,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 20),
                                              child: Column(
                                                // mainAxisAlignment:
                                                //     MainAxisAlignment.spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 15,
                                                                right: 15),
                                                        child: Text(
                                                          "Pickup Parcel",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons.cancel,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Divider(),
                                                  Obx((() => OrderController
                                                              .selectedImagePath
                                                              .value ==
                                                          ''
                                                      ? Text(
                                                          'Select image camera/gallery',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: Constants
                                                                  .tDefaultSize))
                                                      : Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.3,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.2,
                                                          child: Column(
                                                            children: [
                                                              Image.file(File(
                                                                OrderController
                                                                    .selectedImagePath
                                                                    .value,
                                                              )),
                                                              //FileImage(_image);
                                                            ],
                                                          ),
                                                        ))),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              getImage(
                                                                  ImageSource
                                                                      .camera);
                                                            },
                                                            child: Image.asset(
                                                              'assets/icons/camera.png',
                                                              width: 100,
                                                              height: 100,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Take Photo',
                                                            style: TextStyle(
                                                                fontSize: Constants
                                                                    .tDefaultSize,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Divider(
                                                    color: Colors.grey,
                                                    thickness: 1,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 15,
                                                                right: 15,
                                                                bottom: 10),
                                                        child: Text(
                                                          'Scan',
                                                          style: TextStyle(
                                                              fontSize: Constants
                                                                  .tDefaultSize,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          scanQRCode();
                                                        },
                                                        child: Image.asset(
                                                          'assets/icons/scanner.png',
                                                          width: 90,
                                                          height: 90,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          SetStateDialog(() {
                                                            setState() {
                                                              getResult;
                                                            }
                                                          });
                                                        },
                                                        child: Text(
                                                          getResult,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: Constants
                                                                  .tDefaultSize,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 20),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          4),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.19,
                                                              decoration: BoxDecoration(
                                                                  color: Constants
                                                                      .yellow,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              3)),
                                                              child: Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () =>
                                                                        Get.back(),
                                                                    child: Text(
                                                                      'cancel',
                                                                      //  textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                          fontSize: Constants
                                                                              .tDefaultSize,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 95,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          8,
                                                                      vertical:
                                                                          4),
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.15,
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                      Constants
                                                                          .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              3)),
                                                              child: Row(
                                                                children: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      print(
                                                                          "QR Code Result ****************: ");
                                                                      addQRCode();

                                                                      Fluttertoast.showToast(
                                                                          msg:
                                                                              'Successful Scan',
                                                                          toastLength: Toast
                                                                              .LENGTH_SHORT,
                                                                          gravity: ToastGravity
                                                                              .CENTER,
                                                                          timeInSecForIosWeb:
                                                                              1,
                                                                          backgroundColor: Colors
                                                                              .green,
                                                                          fontSize:
                                                                              14);
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                      'send',
                                                                      style: TextStyle(
                                                                          fontSize: Constants
                                                                              .tDefaultSize,
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      // Text(
                                                      //     "$requestid")
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      );
                                    });
                                  },
                                );
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2, vertical: 4),
                                width: MediaQuery.of(context).size.width * 0.33,
                                decoration: BoxDecoration(
                                    //  color: Constants.realBlue,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/icons/scanner.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    // Icon(
                                    //   Icons.telegram,
                                    //   color: Colors.white,
                                    // ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Scan',
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.grey[500],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () => Get.back(),
                                  child: Icon(
                                    Icons.cancel,
                                    color: Colors.grey[500],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '${pickupList.clinet}',
                                style: TextStyle(
                                    fontSize: Constants.tDefaultSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '${pickupList.date}',
                                style: TextStyle(
                                    fontSize: Constants.tDefaultSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       'Show',
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Container(
                      //       width: MediaQuery.of(context).size.width * 0.27,
                      //       height: 35,
                      //       margin: EdgeInsets.all(16),
                      //       decoration: BoxDecoration(
                      //           border: Border.all(color: Colors.grey)),
                      //       padding: EdgeInsets.symmetric(horizontal: 7),
                      //       child: DropdownButtonHideUnderline(
                      //         child: DropdownButton<String>(
                      //           value: value,
                      //           isExpanded: true,
                      //           items: items.map(buildMenuItem).toList(),
                      //           onChanged: (value) =>
                      //               setState(() => this.value = value),
                      //         ),
                      //       )

                      //       // value: selecttownshipDetailPick,

                      //       ,
                      //     ),
                      //     // SizedBox(
                      //     //   width: MediaQuery.of(context).size.height * 0.12,
                      //     //   height: 35,
                      //     //   child: TextFormField(
                      //     //     controller: countController,
                      //     //     focusNode: countFocusNode,
                      //     //     decoration: InputDecoration(
                      //     //       // labelText: "user name",
                      //     //       labelStyle: TextStyle(fontSize: 12),
                      //     //       //  suffixIcon: Icon(Icons.person),
                      //     //       fillColor: Colors.white,
                      //     //       focusedBorder: OutlineInputBorder(
                      //     //         //  borderRadius: BorderRadius.circular(10.0),
                      //     //         borderSide: BorderSide(
                      //     //           color: Colors.black12,
                      //     //         ),
                      //     //       ),
                      //     //       enabledBorder: OutlineInputBorder(
                      //     //         // borderRadius: BorderRadius.circular(10.0),
                      //     //         borderSide: BorderSide(
                      //     //           color: Colors.grey,
                      //     //           // width: 2.0,
                      //     //         ),
                      //     //       ),
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //     SizedBox(
                      //       width: 5,
                      //     ),
                      //     Text(
                      //       'entries',
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search :',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.2,
                            height: 35,
                            child: TextFormField(
                              controller: countController,
                              focusNode: countFocusNode,
                              decoration: InputDecoration(
                                // labelText: "user name",
                                labelStyle: TextStyle(fontSize: 12),
                                //  suffixIcon: Icon(Icons.person),
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  //  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black12,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    //  width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // ref.watch(pickupWaysServiceProvider(widget.id)).when(
                      //     data: (pickupList) {
                      //   print(pickupList);
                      //   return
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        // color: Constants.gray,
                        child: LiquidPullToRefresh(
                          onRefresh: (() async {
                            await _refresh();
                          }),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: pickupList.data == null
                                  ? Container()
                                  : DataTable(
                                      headingRowColor:
                                          MaterialStateProperty.all(
                                              Constants.gray),
                                      dataRowColor: MaterialStateProperty.all(
                                          Colors.white),
                                      decoration: BoxDecoration(
                                          //color: Colors.grey
                                          ),
                                      horizontalMargin: 8,
                                      columnSpacing: 18,
                                      border: TableBorder.all(
                                          color: Colors.black12),
                                      columns: [
                                        DataColumn(
                                            label: Text(
                                          "#",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Constants.tDefaultSize,
                                          ),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "Track Code",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Constants.tDefaultSize,
                                          ),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "Receiver Name",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Constants.tDefaultSize,
                                          ),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "Parcel Info",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Constants.tDefaultSize,
                                          ),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "Photo",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Constants.tDefaultSize,
                                          ),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "Status",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Constants.tDefaultSize,
                                          ),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          "Action",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Constants.tDefaultSize,
                                          ),
                                        )),
                                      ],
                                      rows: pickupList.data!.map((pickup) {
                                        return DataRow(cells: [
                                          DataCell(Container(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              (pickupList.data!
                                                          .indexOf(pickup) +
                                                      1)
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      Constants.tSmallSize),
                                            ),
                                          )),
                                          DataCell(Text(
                                            pickup.order_code!,
                                            style: TextStyle(
                                                fontSize: Constants.tSmallSize),
                                          )),
                                          DataCell(pickup.to_name != null
                                              ? Text(
                                                  pickup.to_name!,
                                                  style: TextStyle(
                                                      fontSize:
                                                          Constants.tSmallSize),
                                                )
                                              : Text('')),
                                          DataCell(pickup.item_info != null
                                              ? Text(
                                                  //'testing',
                                                  pickup.item_info!,
                                                  style: TextStyle(
                                                      fontSize:
                                                          Constants.tSmallSize),
                                                )
                                              : Text('')),
                                          DataCell(pickup.photo_1 != null
                                              ? Text(
                                                  // '',
                                                  pickup.photo_1!,
                                                  style: TextStyle(
                                                      fontSize:
                                                          Constants.tSmallSize),
                                                )
                                              : Text('')),
                                          DataCell(pickup.status != null
                                              ? Text(
                                                  'Picked Up',

                                                  // pickup.status!,
                                                  style: TextStyle(
                                                      fontSize:
                                                          Constants.tSmallSize),
                                                )
                                              : Text(
                                                  '',

                                                  //pickup.status!,
                                                  style: TextStyle(
                                                      fontSize:
                                                          Constants.tSmallSize),
                                                )),
                                          DataCell(
                                              Center(
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: Constants.realRed,
                                                ),
                                              ), onTap: () {
                                            setState(() {
                                              deleteid = pickup.id;

                                              print(
                                                  "Delete Id In Screen %%%%%%%%%%%%%%%%%%%%%% $deleteid");
                                            });

                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return StatefulBuilder(builder:
                                                    (BuildContext context,
                                                        StateSetter setState) {
                                                  return Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.2,
                                                    child: AlertDialog(
                                                      backgroundColor:
                                                          Constants.realRed,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      titleTextStyle:
                                                          const TextStyle(
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.black),
                                                      content: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.17,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 10,
                                                                vertical: 20),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 15,
                                                                      right:
                                                                          15),
                                                              child: Text(
                                                                "Delete Confirmation",
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                            Divider(),
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              15,
                                                                          right:
                                                                              15),
                                                                  child: Text(
                                                                    "Are you sure want to delete?",
                                                                    style: const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Divider(),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            OutlinedButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                  ref.invalidate(
                                                                      pickupWaysServiceProvider(
                                                                          widget
                                                                              .id));
                                                                },
                                                                style: OutlinedButton
                                                                    .styleFrom(
                                                                  side: BorderSide(
                                                                      //  width: 5.0,
                                                                      color: Colors.white),
                                                                ),
                                                                child: Text(
                                                                  'Close',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          Constants
                                                                              .tSmallSize,
                                                                      color: Colors
                                                                          .white),
                                                                )),
                                                            OutlinedButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  //  _data.remove(_data[id]);
                                                                  // pickupList!.data.remove(
                                                                  //     pickupList
                                                                  //         .data['id]);
                                                                  _deleteData(
                                                                      deleteid,
                                                                      true);
                                                                });

                                                                print(
                                                                    "Confirm Button in Id^^^^^^^^^^^^^^^^^^^^^^^^ $deleteid");

                                                                Fluttertoast.showToast(
                                                                    msg:
                                                                        'Delete Successfully.',
                                                                    toastLength:
                                                                        Toast
                                                                            .LENGTH_SHORT,
                                                                    gravity: ToastGravity
                                                                        .CENTER,
                                                                    timeInSecForIosWeb:
                                                                        1,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .green,
                                                                    fontSize:
                                                                        14);
                                                                // _refresh();
                                                                Get.back();
                                                              },
                                                              style:
                                                                  OutlinedButton
                                                                      .styleFrom(
                                                                side: BorderSide(
                                                                    //  width: 5.0,
                                                                    color: Colors.white),
                                                              ),
                                                              child: Text(
                                                                'Confirm Delete',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        Constants
                                                                            .tSmallSize,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                });
                                              },
                                            );

                                            // Get.to(() => OrderDetailScreen(
                                            //       orderId: order.id!,
                                            //       orderStatus: order.last_status!.name!,
                                            //       order_id: order.orderId.toString(),
                                            //     )
                                            //     );
                                          })
                                        ]);
                                      }).toList(),
                                    ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.04,
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Text(
                                'Previous',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                            ),
                            Container(
                              width: 30,
                              color: Constants.blue,
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                            Text(
                              'Next',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Footer',
                            //textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ]),
                  ),
                );
              }, error: (Object error, StackTrace stackTrace) {
                return Text("Error $error");
              }, loading: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ]),
          );
        }

                //child:

                )),
      ),
    );
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

  onPressed(id) {
    setState() {
      // _data.remove(_data[id]);
    }
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      String text = qrCode;
      List<String> substrings = text.split('/');
      print(substrings);
      print(substrings[0]);
      print(substrings[1]);
      print(substrings[2]);
      print(substrings[3]);
      print(substrings[4]);

      if (!mounted) return;

      setState(() {
        getResult = 'QR Code Result : ${substrings[4]} ';
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  Future<void> _refresh() async {
    ref.invalidate(pickupWaysServiceProvider(widget.id));
    return await Future.delayed(Duration(seconds: 2));
  }

  addQRCode() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      "preorder_id": parcelid.toString(),
      "order_code": getResult,
    };

    final response = await http.post(
      Uri.parse(APIURL.addWithQRCode),
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: data,
    );

    print("${response.body}");
    print(getResult);
  }

  Future<String?> uploadImage(filename, url) async {
    print("Hello from profile Image Upload $filename");
    var res;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    final token = await SharedPref.getData(key: SharedPref.token);
    request.headers['Authorization'] = token!;
    request.headers['Accept'] = "application/json";
    request.fields['preorder_id'] = parcelid.toString();
    request.files.add(await http.MultipartFile.fromPath('photo', filename));

    print("${request.fields['preorder_id']}");

    print("Token : $request");

    await request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((value) {
        var resData = jsonDecode(value);
        print("ResData : $resData");
        res = resData['message'];
      });
    }).catchError((e) {
      print(e);
    });
    print(res);

    return res;
  }

  getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    var res = await uploadImage(pickedFile!.path, APIURL.addWayWithPhoto);
    print("Picked File ${pickedFile!.path}");
    setState(() {
      if (pickedFile != null) {
        OrderController.selectedImagePath.value = pickedFile.path;
        //selectedImagePath.value = pickedFile.path;
        print(" Image Result : ${OrderController.selectedImagePath.value}");
      } else {
        Get.snackbar('Error', 'No image selected',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    });

    print(res);
  }

  Future<void> _deleteData(int id, bool delLoading) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final response = await http.delete(
      Uri.parse('https://newbrdemo.icgwebdevelopment.com/api/delete_way/$id'),
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
    );

    _refresh();
    print("Delete id ******************$id");

    print("Detete response ************* ${response.body}");
  }
}
