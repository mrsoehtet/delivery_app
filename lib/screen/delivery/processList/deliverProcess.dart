import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/screen/delivery/getWay/getWayDetail.dart';
import 'package:delivery_app/screen/example.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/screen/signatureScreen.dart';
import 'package:delivery_app/service/deliveryProcessListService.dart';
import 'package:delivery_app/service/orderDetailService.dart';
import 'package:delivery_app/service/pickupDoneSevice.dart';
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
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../../controller/getController.dart';
import '../../../utils/theme.dart';
import '../../login.dart';

class DeliverProcessList extends StatefulWidget {
  const DeliverProcessList({super.key});

  @override
  State<DeliverProcessList> createState() => _DeliverProcessListState();
}

class _DeliverProcessListState extends State<DeliverProcessList> {
  String? orderid;
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  TextEditingController orderCodeController = TextEditingController();
  FocusNode orderCodeFocusNode = FocusNode();
  TextEditingController dateInput = TextEditingController();
  FocusNode dateInputFocusNode = FocusNode();

  var orders = Get.find<OrderController>().orders;
  TextEditingController countController = TextEditingController();
  FocusNode countFocusNode = FocusNode();
  List<String> items = [
    "ဖုန်းဆက်မရ",
    "ဖုန်းပိတ်ထား",
    "မဝယ်ဖြစ်တော့ပါ",
    "ရက်ချိန်းပြောင်း",
    "Others"
  ];
  String? value;
  String? cancelValue;
  var _remove;
  String formattedDate = '';

  var getResult = 'QR Code Result';
  @override
  void initState() {
    _remove = true;
    //_loadData();

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

  parcelReturn() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      "order_code": getResult,
      "return_type": value,
      "date": dateInput.text,
    };

    final response = await http.post(
      Uri.parse(APIURL.returnParcel),
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: data,
    );

    print(" ************* ${response.body}");
    print(getResult);
    print(value);
    print(dateInput.text);
  }

  parcelCancel() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      "order_code": getResult,
      "return_type": cancelValue,
      "date": dateInput.text,
    };

    final response = await http.post(
      Uri.parse(APIURL.cancelParcel),
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: data,
    );

    print(" ************* ${response.body}");
    print(getResult);
    print(cancelValue);
    print(")))))))))))))))))))))))))))) $cancelValue   $getResult");
    print(dateInput.text);
  }

  @override
  Widget build(BuildContext context) {
    final NaviController naviController = Get.put(NaviController());

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
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
                                    Get.to(() => ProfileScreen());
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
          child: Consumer(builder: ((context, ref, child) {
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
                  "Pickup Process",
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
            _remove
                ? Card(
                    child: Container(
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      //  margin: EdgeInsets.only(bottom: 100),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.5,
                                            child: AlertDialog(
                                              contentPadding: EdgeInsets.zero,
                                              titleTextStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                              content: StatefulBuilder(builder:
                                                  (context, setStateDialog) {
                                                return Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.38,
                                                  padding: const EdgeInsets
                                                      .symmetric(
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
                                                              "Scan QR Code",
                                                              style:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          16),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Get.back();
                                                              });
                                                            },
                                                            child: Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          )
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
                                                                  fontSize:
                                                                      Constants
                                                                          .tDefaultSize,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              scanQRCode(
                                                                  setStateDialog);
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
                                                          Text(
                                                            getResult,
                                                            textAlign: TextAlign
                                                                .center,
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
                                                          // Container(
                                                          //   margin: EdgeInsets
                                                          //       .symmetric(
                                                          //           horizontal:
                                                          //               20),
                                                          //   child: Row(
                                                          //     mainAxisAlignment:
                                                          //         MainAxisAlignment
                                                          //             .spaceEvenly,
                                                          //     children: [
                                                          //       Container(
                                                          //         padding: EdgeInsets
                                                          //             .symmetric(
                                                          //                 horizontal:
                                                          //                     8,
                                                          //                 vertical:
                                                          //                     4),
                                                          //         width: MediaQuery.of(
                                                          //                     context)
                                                          //                 .size
                                                          //                 .width *
                                                          //             0.19,
                                                          //         decoration: BoxDecoration(
                                                          //             color: Constants
                                                          //                 .yellow,
                                                          //             borderRadius:
                                                          //                 BorderRadius.circular(
                                                          //                     3)),
                                                          //         child: Row(
                                                          //           children: [
                                                          //             InkWell(
                                                          //               onTap: () =>
                                                          //                   Get.back(),
                                                          //               child:
                                                          //                   Text(
                                                          //                 'cancel',
                                                          //                 //  textAlign: TextAlign.center,
                                                          //                 style: TextStyle(
                                                          //                     fontSize: Constants.tDefaultSize,
                                                          //                     color: Colors.white),
                                                          //               ),
                                                          //             ),
                                                          //           ],
                                                          //         ),
                                                          //       ),
                                                          //       SizedBox(
                                                          //         width: 95,
                                                          //       ),
                                                          //       Container(
                                                          //         padding: EdgeInsets
                                                          //             .symmetric(
                                                          //                 horizontal:
                                                          //                     8,
                                                          //                 vertical:
                                                          //                     4),
                                                          //         width: MediaQuery.of(
                                                          //                     context)
                                                          //                 .size
                                                          //                 .width *
                                                          //             0.15,
                                                          //         decoration: BoxDecoration(
                                                          //             color: Constants
                                                          //                 .green,
                                                          //             borderRadius:
                                                          //                 BorderRadius.circular(
                                                          //                     3)),
                                                          //         child: Row(
                                                          //           children: [
                                                          //             InkWell(
                                                          //               onTap:
                                                          //                   () {
                                                          //                 print(
                                                          //                     "QR Code Result ****************: ");
                                                          //                 addQRCode();

                                                          //                 Fluttertoast.showToast(
                                                          //                     msg: 'Successful Scan',
                                                          //                     toastLength: Toast.LENGTH_SHORT,
                                                          //                     gravity: ToastGravity.CENTER,
                                                          //                     timeInSecForIosWeb: 1,
                                                          //                     backgroundColor: Colors.green,
                                                          //                     fontSize: 14);
                                                          //                 Get.back();
                                                          //               },
                                                          //               child:
                                                          //                   Text(
                                                          //                 'done',
                                                          //                 style: TextStyle(
                                                          //                     fontSize: Constants.tDefaultSize,
                                                          //                     color: Colors.white),
                                                          //               ),
                                                          //             ),
                                                          //           ],
                                                          //         ),
                                                          //       ),
                                                          //     ],
                                                          //   ),
                                                          // ),
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
                                        },
                                      );
                                    }),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 4),
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      // decoration: BoxDecoration(
                                      //     color: Constants.green,
                                      //     borderRadius: BorderRadius.circular(3)),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Image.asset(
                                              'assets/icons/work-in-progress.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                          )
                                          // Icon(
                                          //   Icons.flag,
                                          //   color: Colors.white,
                                          // ),
                                          // Text(
                                          //   'Done',
                                          //   //  textAlign: TextAlign.center,
                                          //   style: TextStyle(
                                          //       fontSize: Constants.tSmallSize,
                                          //       color: Colors.white),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  InkWell(
                                    onTap: (() {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setState) {
                                            return Container(
                                              // margin: EdgeInsets.only(bottom: 100),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              child: AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                titleTextStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                                content: StatefulBuilder(
                                                    builder: (context,
                                                        setStateDialog) {
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                    padding: const EdgeInsets
                                                        .symmetric(
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
                                                                      right:
                                                                          15),
                                                              child: Text(
                                                                "Scan QR Code For Return",
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            14),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  Get.back();
                                                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => PickupRequestList()));
                                                                  // showDialogVisible = false;
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons.cancel,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Divider(
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
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                'Scan',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        Constants
                                                                            .tDefaultSize,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                returnQRParcel(
                                                                    setStateDialog);
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                'assets/icons/scanner.png',
                                                                width: 90,
                                                                height: 90,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              getResult,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Constants
                                                                          .tDefaultSize,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 16,
                                                            ),
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.85,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                              //margin: EdgeInsets.all(16),

                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          7),
                                                              child:
                                                                  DropdownButtonHideUnderline(
                                                                child:
                                                                    DropdownButton<
                                                                        String>(
                                                                  hint: Text(
                                                                    "Select Cancel Type",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  value: value,
                                                                  isExpanded:
                                                                      true,
                                                                  items: items
                                                                      .map(
                                                                          buildMenuItem)
                                                                      .toList(),
                                                                  onChanged: (value) =>
                                                                      setState(() =>
                                                                          this.value =
                                                                              value),
                                                                ),
                                                              ),

                                                              // value: selecttownshipDetailPick,
                                                            ),
                                                            SizedBox(
                                                              height: 16,
                                                            ),
                                                            SizedBox(
                                                              height: 35,
                                                              child: TextField(
                                                                controller:
                                                                    dateInput,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12),

                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Select date',
                                                                  labelStyle:
                                                                      TextStyle(
                                                                          fontSize:
                                                                              12),
                                                                  suffixIcon:
                                                                      const Icon(
                                                                          Icons
                                                                              .calendar_month),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    borderSide:
                                                                        const BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    // borderRadius: BorderRadius.circular(10.0),
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .black54,
                                                                    ),
                                                                  ),
                                                                ),
                                                                readOnly: true,
                                                                //set it true, so that user will not able to edit text
                                                                onTap:
                                                                    () async {
                                                                  DateTime?
                                                                      pickedDate =
                                                                      await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate: DateTime
                                                                              .now(),
                                                                          firstDate: DateTime(
                                                                              1950),
                                                                          //DateTime.now() - not to allow to choose before today.
                                                                          lastDate:
                                                                              DateTime(2100));

                                                                  if (pickedDate !=
                                                                      null) {
                                                                    print(
                                                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                                                                    formattedDate = DateFormat(
                                                                            'dd-MM-yyyy')
                                                                        .format(
                                                                            pickedDate);
                                                                    print(
                                                                        ' ##########  $formattedDate');
                                                                    print(
                                                                        '%%%%%% $value');
                                                                    //formatted date output using intl package =>  2021-03-16
                                                                    setState(
                                                                        () {
                                                                      dateInput
                                                                              .text =
                                                                          formattedDate; //set output date to TextField value.
                                                                    });
                                                                  } else {}
                                                                },
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 16,
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            4),
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.19,
                                                                    decoration: BoxDecoration(
                                                                        color: Constants
                                                                            .yellow,
                                                                        borderRadius:
                                                                            BorderRadius.circular(3)),
                                                                    child: Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap: () =>
                                                                              Get.back(),
                                                                          child:
                                                                              Text(
                                                                            'cancel',
                                                                            style:
                                                                                TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 95,
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            4),
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.15,
                                                                    decoration: BoxDecoration(
                                                                        color: Constants
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.circular(3)),
                                                                    child: Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            parcelReturn();

                                                                            Fluttertoast.showToast(
                                                                                msg: 'Successful Return',
                                                                                toastLength: Toast.LENGTH_SHORT,
                                                                                gravity: ToastGravity.CENTER,
                                                                                timeInSecForIosWeb: 1,
                                                                                backgroundColor: Colors.green,
                                                                                fontSize: 14);
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'done',
                                                                            style:
                                                                                TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
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
                                          horizontal: 3, vertical: 4),
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Image.asset(
                                              'assets/icons/return.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (() {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(builder:
                                              (BuildContext context,
                                                  StateSetter setState) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              child: AlertDialog(
                                                contentPadding: EdgeInsets.zero,
                                                titleTextStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black),
                                                content: StatefulBuilder(
                                                    builder: (context,
                                                        setStateDialog) {
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.52,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 20),
                                                    child: Column(
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
                                                                      right:
                                                                          15),
                                                              child: Text(
                                                                "Cancel (Back to OS)",
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            14),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  Get.back();
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons.cancel,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Divider(
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
                                                                      bottom:
                                                                          10),
                                                              child: Text(
                                                                'Scan',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        Constants
                                                                            .tDefaultSize,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                cancelQRParcel(
                                                                    setStateDialog);
                                                              },
                                                              child:
                                                                  Image.asset(
                                                                'assets/icons/scanner.png',
                                                                width: 90,
                                                                height: 90,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              getResult,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      Constants
                                                                          .tDefaultSize,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 16,
                                                            ),
                                                            // SizedBox(
                                                            //   height: 35,
                                                            //   child:
                                                            //       TextFormField(
                                                            //     controller:
                                                            //         orderCodeController,
                                                            //     focusNode:
                                                            //         orderCodeFocusNode,
                                                            //     style: TextStyle(
                                                            //         fontSize:
                                                            //             12),
                                                            //     decoration:
                                                            //         InputDecoration(
                                                            //       labelText:
                                                            //           "type order code",
                                                            //       labelStyle:
                                                            //           TextStyle(
                                                            //               fontSize:
                                                            //                   12),
                                                            //       // suffixIcon: Icon(Icons.person),
                                                            //       fillColor:
                                                            //           Colors
                                                            //               .white,
                                                            //       focusedBorder:
                                                            //           OutlineInputBorder(
                                                            //         // borderRadius: BorderRadius.circular(10.0),
                                                            //         borderSide:
                                                            //             BorderSide(
                                                            //           color: Colors
                                                            //               .black54,
                                                            //         ),
                                                            //       ),
                                                            //       enabledBorder:
                                                            //           OutlineInputBorder(
                                                            //         //  borderRadius: BorderRadius.circular(10.0),
                                                            //         borderSide:
                                                            //             BorderSide(
                                                            //           color: Colors
                                                            //               .grey,
                                                            //           // width: 2.0,
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //   ),
                                                            // ),

                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.85,
                                                              height: 35,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),

                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          7),
                                                              child:
                                                                  DropdownButtonHideUnderline(
                                                                child:
                                                                    DropdownButton<
                                                                        String>(
                                                                  hint: Text(
                                                                    "Select Cancel Type",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                  value:
                                                                      cancelValue,
                                                                  isExpanded:
                                                                      true,
                                                                  items: items
                                                                      .map(
                                                                          buildMenuItem)
                                                                      .toList(),
                                                                  onChanged: (cvalue) =>
                                                                      setState(() =>
                                                                          this.cancelValue =
                                                                              cvalue),
                                                                ),
                                                              ),

                                                              // value: selecttownshipDetailPick,
                                                            ),
                                                            SizedBox(
                                                              height: 40,
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            4),
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.19,
                                                                    decoration: BoxDecoration(
                                                                        color: Constants
                                                                            .yellow,
                                                                        borderRadius:
                                                                            BorderRadius.circular(3)),
                                                                    child: Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap: () =>
                                                                              Get.back(),
                                                                          child:
                                                                              Text(
                                                                            'cancel',
                                                                            //  textAlign: TextAlign.center,
                                                                            style:
                                                                                TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 95,
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            8,
                                                                        vertical:
                                                                            4),
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.15,
                                                                    decoration: BoxDecoration(
                                                                        color: Constants
                                                                            .green,
                                                                        borderRadius:
                                                                            BorderRadius.circular(3)),
                                                                    child: Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            parcelCancel();

                                                                            Fluttertoast.showToast(
                                                                                msg: 'Successful Cancel',
                                                                                toastLength: Toast.LENGTH_SHORT,
                                                                                gravity: ToastGravity.CENTER,
                                                                                timeInSecForIosWeb: 1,
                                                                                backgroundColor: Colors.green,
                                                                                fontSize: 14);
                                                                            Get.back();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'done',
                                                                            style:
                                                                                TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
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
                                      // margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 2, vertical: 4),
                                      width: MediaQuery.of(context).size.width *
                                          0.21,
                                      // decoration: BoxDecoration(
                                      //     color: Constants.realRed,
                                      //     borderRadius: BorderRadius.circular(3)),
                                      child: Row(
                                        children: [
                                          Center(
                                            child: Image.asset(
                                              'assets/icons/multiply.png',
                                              width: 40,
                                              height: 40,
                                            ),
                                          )
                                          // Icon(
                                          //   Icons.cancel,
                                          //   color: Colors.white,
                                          // ),
                                          // Text(
                                          //   'Cancel',
                                          //   //  textAlign: TextAlign.center,
                                          //   style: TextStyle(
                                          //       fontSize: Constants.tSmallSize,
                                          //       color: Colors.white),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              // Text(
                              //   'Order Request List',
                              //   style: TextStyle(fontSize: 16, color: Constants.green),
                              // ),
                              Column(
                                children: [
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
                                        onTap: (() {
                                          setState(() {
                                            _remove = !_remove;
                                          });
                                        }),
                                        child: Icon(
                                          Icons.cancel,
                                          color: Colors.grey[500],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(),
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
                        //       decoration:
                        //           BoxDecoration(border: Border.all(color: Colors.grey)),
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
                              'Search:',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              width: 3,
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
                        //   ref.watch(deliProcessProvider).when(data:(deliProcessList){
                        // //  ref.watch(deliProcessProvider).when(data: (donePickupList) {
                        //     return
                        // Container(
                        //       height: MediaQuery.of(context).size.height * 0.5,
                        //       margin: EdgeInsets.symmetric(horizontal: 8),
                        //       // color: Constants.gray,
                        //       child: ListView(
                        //         scrollDirection: Axis.horizontal,
                        //         children: [
                        //           DataTable(
                        //             headingRowColor:
                        //                 MaterialStateProperty.all(Constants.gray),
                        //             dataRowColor:
                        //                 MaterialStateProperty.all(Colors.white),
                        //             decoration: BoxDecoration(
                        //                 //color: Colors.grey
                        //                 ),
                        //             horizontalMargin: 8,
                        //             columnSpacing: 18,
                        //             border: TableBorder.all(color: Colors.black12),
                        //             columns: [
                        //               DataColumn(
                        //                   label: Text(
                        //                 "#",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "Date",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "Code",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "To Delivery Info",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "Parcel Info",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "Weight",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "Remark",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "WH Note",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //               DataColumn(
                        //                   label: Text(
                        //                 "Action",
                        //                 textAlign: TextAlign.center,
                        //                 style: TextStyle(
                        //                   fontSize: Constants.tDefaultSize,
                        //                 ),
                        //               )),
                        //             ],
                        //             rows: orders!.map((order) {
                        //               return DataRow(cells: [
                        //                 DataCell(Container(
                        //                   padding: EdgeInsets.only(left: 5),
                        //                   //  color: Colors.white,
                        //                   child: Text(
                        //                     '1',
                        //                     style: TextStyle(
                        //                         fontSize: Constants.tSmallSize),
                        //                   ),
                        //                 )),
                        //                 DataCell(Text(
                        //                   '21-08-2023 01:23 am',
                        //                   style:
                        //                       TextStyle(fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   '11-230020',
                        //                   style:
                        //                       TextStyle(fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   'Ko Thura',
                        //                   style:
                        //                       TextStyle(fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   '09964483525',
                        //                   style:
                        //                       TextStyle(fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   'South Okkalapa',
                        //                   style:
                        //                       TextStyle(fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   'Dagon',
                        //                   style:
                        //                       TextStyle(fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   'This is sample parcel',
                        //                   style:
                        //                       TextStyle(fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   '1.00',
                        //                   style: TextStyle(
                        //                       // color: Constants.green,
                        //                       fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   'Befor 5 p.m',
                        //                   style: TextStyle(
                        //                       // color: Constants.green,
                        //                       fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(Text(
                        //                   'for Back to OS',
                        //                   style: TextStyle(
                        //                       color: Constants.realRed,
                        //                       fontSize: Constants.tSmallSize),
                        //                 )),
                        //                 DataCell(
                        //                     Row(
                        //                       children: [
                        //                         Center(
                        //                           child: Icon(
                        //                             Icons.message,
                        //                             color: Constants.blue,
                        //                           ),
                        //                         ),
                        //                         Center(
                        //                           child: Icon(
                        //                             Icons.cancel,
                        //                             color: Constants.realRed,
                        //                           ),
                        //                         ),
                        //                       ],
                        //                     ),
                        //                     onTap: () {})
                        //               ]);
                        //             }).toList(),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   }, error: (Object error, StackTrace stackTrace) {
                        //             return Text('$error');
                        //           }, loading: () {
                        //             return Center(
                        //               child: CircularProgressIndicator(),
                        //             );
                        //           }
                        //   ),

                        ref.watch(deliProcessServiceProvider).when(
                            data: (deliProcessList) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            // color: Constants.gray,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  headingRowColor:
                                      MaterialStateProperty.all(Constants.gray),
                                  dataRowColor:
                                      MaterialStateProperty.all(Colors.white),
                                  decoration: BoxDecoration(
                                      //color: Colors.grey
                                      ),
                                  horizontalMargin: 8,
                                  columnSpacing: 18,
                                  border:
                                      TableBorder.all(color: Colors.black12),
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
                                      "Date",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Code",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "To Delivery Info",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "",
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
                                      "Weight",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Remark",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "WH Note",
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
                                  //rows: orders!.map((order) {
                                  rows: deliProcessList.map((deliProcess) {
                                    String apiDateString =
                                        "${deliProcess!.created_at!}"; // Replace this with your API date
                                    DateTime apiDate =
                                        DateTime.parse(apiDateString);
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy H:m a')
                                            .format(apiDate);
                                    print(formattedDate);
                                    return DataRow(cells: [
                                      DataCell(Container(
                                        padding: EdgeInsets.only(left: 5),
                                        //  color: Colors.white,
                                        child: Text(
                                          (deliProcessList
                                                      .indexOf(deliProcess) +
                                                  1)
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        ),
                                      )),
                                      DataCell(Text(
                                        "$formattedDate",
                                        // '21-08-2023 01:23 am',
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        deliProcess!.order_code!,
                                        // '11-230020',
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        deliProcess!.to_name!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        deliProcess!.to_phone!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        deliProcess!.to_address!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        deliProcess!.to_township!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        deliProcess!.item_info!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        deliProcess!.weight!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(deliProcess.remark != null
                                          ? Text(
                                              deliProcess.remark!,
                                              style: TextStyle(
                                                  // color: Constants.green,
                                                  fontSize:
                                                      Constants.tSmallSize),
                                            )
                                          : Container()),
                                      DataCell(deliProcess!.staff_note != null
                                          ? Text(
                                              deliProcess!.staff_note!,
                                              // 'for Back to OS',
                                              style: TextStyle(
                                                  color: Constants.realRed,
                                                  fontSize:
                                                      Constants.tSmallSize),
                                            )
                                          : Container()),
                                      DataCell(
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: (() async {
                                                  setState(() {
                                                    orderid =
                                                        deliProcess.order_id!;
                                                  });
                                                  bool res = await Get.to(
                                                      GetWayDetail(
                                                          id: orderid
                                                              .toString()));

                                                  if (res) {
                                                    ref.invalidate(
                                                        orderDetailProvider);
                                                  }
                                                }),
                                                child: Center(
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    color: Constants.blue,
                                                    child: Icon(
                                                      Icons.menu,
                                                      size: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: Constants.realRed,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onTap: () {})
                                    ]);
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        }, error: (Object error, StackTrace stackTrace) {
                          return Text('$error');
                        }, loading: () {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),

                        SizedBox(
                          height: 16,
                        ),
                        // Text(
                        //   'Showing 1 to 2 of 2 entries',
                        //   style: TextStyle(fontSize: 14),
                        // ),
                        SizedBox(
                          height: 5,
                        ),

                        Divider(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '',
                              //textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ]),
                    ),
                  )
                : Container(),
          ]),
        );
      }))),
    );
  }

  void scanQRCode(stateChange) async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      String text = qrCode;
      List<String> substrings = text.split('/');
      print(substrings);

      if (!mounted) return;

      stateChange(() {
        getResult = '${substrings[4]} ';
      });
      Duration(seconds: 2);

      Get.to(() => SignatureScreen(id: getResult));
      // Get.to(()=>ESingature(id: getResult));
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  void returnQRParcel(stateChange) async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      String text = qrCode;
      List<String> substrings = text.split('/');
      print(substrings);

      if (!mounted) return;

      stateChange(() {
        getResult = '${substrings[4]} ';
      });
      Duration(seconds: 2);

      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  void cancelQRParcel(stateChange) async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      String text = qrCode;
      List<String> substrings = text.split('/');
      print(substrings);

      if (!mounted) return;

      stateChange(() {
        getResult = '${substrings[4]} ';
      });
      Duration(seconds: 2);

      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  addQRCode() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      "order_code": getResult,
    };

    final response = await http
        .post(
      Uri.parse(APIURL.deliveryGetWay),
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: data,
    )
        .whenComplete(() {
      getResult = 'QR Code Result';
      //  Get.to(SignatureScreen());
    });

    print("${response.body}");
    print(getResult);
    // print(requestid);
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
}
