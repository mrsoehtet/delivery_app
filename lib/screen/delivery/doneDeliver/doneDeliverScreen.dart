import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/screen/delivery/getWay/getWayDetail.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/service/deliveryDoneService.dart';
import 'package:delivery_app/service/orderDetailService.dart';
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
import 'package:intl/intl.dart';

import '../../../controller/getController.dart';
import '../../../utils/theme.dart';
import '../../login.dart';
import 'doneDeliverDetail.dart';
import 'package:http/http.dart' as http;

class DoneDeliverScreen extends StatefulWidget {
  const DoneDeliverScreen({super.key});

  @override
  State<DoneDeliverScreen> createState() => _DoneDeliverScreenState();
}

class _DoneDeliverScreenState extends State<DoneDeliverScreen> {
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
  var orders = Get.find<OrderController>().orders;
  TextEditingController countController = TextEditingController();
  FocusNode countFocusNode = FocusNode();
  List<String> items = ["30", "50", "100", "All"];
  String? value;
  var _remove;

  @override
  void initState() {
    _remove = true;
    super.initState();
  }

  var getResult = 'QR Code Result';
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
              Get.to(() => ProfileScreen());
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
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Done Delivery List",
                    style: TextStyle(
                      fontSize: 20,
                      // color: Colors.white,
                    ),
                  ),

                  // Text(
                  //   "Done Delivery List",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.27,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
                              // margin: EdgeInsets.only(bottom: 100),
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                titleTextStyle: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                                content: StatefulBuilder(
                                    builder: (context, SetStateDialog) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.38,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Text(
                                                "Scan QR Code",
                                                style: const TextStyle(
                                                    fontSize: 16),
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
                                                color: Colors.grey,
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
                                              padding: const EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  bottom: 10),
                                              child: Text(
                                                'Scan',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tDefaultSize,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tDefaultSize,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 4),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.19,
                                                    decoration: BoxDecoration(
                                                        color: Constants.yellow,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
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
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 95,
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 4),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                    decoration: BoxDecoration(
                                                        color: Constants.green,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3)),
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
                                                                gravity:
                                                                    ToastGravity
                                                                        .CENTER,
                                                                timeInSecForIosWeb:
                                                                    1,
                                                                backgroundColor:
                                                                    Colors
                                                                        .green,
                                                                fontSize: 14);
                                                            Get.back();
                                                          },
                                                          child: Text(
                                                            'send',
                                                            style: TextStyle(
                                                                fontSize: Constants
                                                                    .tDefaultSize,
                                                                color: Colors
                                                                    .white),
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
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      //width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                          // color: Constants.realBlue,
                          borderRadius: BorderRadius.circular(3)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/scanner.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text('Scan')
                          // Icon(
                          //   Icons.qr_code_2,
                          //   size: 30,
                          // )
                          // Text(
                          //   'GetWay',
                          //   //  textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //       fontSize: Constants.tDefaultSize,
                          //       color: Colors.white),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   // width: MediaQuery.of(context).size.width * 0.95,
              //   height: 30,
              //   decoration: BoxDecoration(color: Constants.gray),
              //   child: Row(children: [
              //     Icon(Icons.dashboard),
              //     Text(
              //       ' Home > ',
              //       style: TextStyle(fontSize: 12),
              //     ),
              //     Text(
              //       ' Delimen >',
              //       style: TextStyle(fontSize: 12),
              //     ),
              //     Text(
              //       ' Done Delivery List',
              //       style: TextStyle(fontSize: 12),
              //     ),
              //   ]),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
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
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 8),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       // Container(
                          //       //   padding:
                          //       //       EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          //       //   width: MediaQuery.of(context).size.width * 0.21,
                          //       //   decoration: BoxDecoration(
                          //       //       color: Constants.realBlue,
                          //       //       borderRadius: BorderRadius.circular(3)),
                          //       //   child: Row(
                          //       //     children: [
                          //       //       Text(
                          //       //         'GetWay',
                          //       //         //  textAlign: TextAlign.center,
                          //       //         style: TextStyle(
                          //       //             fontSize: Constants.tDefaultSize,
                          //       //             color: Colors.white),
                          //       //       ),
                          //       //     ],
                          //       //   ),
                          //       // ),
                          //       // Text(
                          //       //   'Order Request List',
                          //       //   style: TextStyle(fontSize: 16, color: Constants.green),
                          //       // ),
                          //       Row(
                          //         children: [
                          //           Icon(
                          //             Icons.remove,
                          //             color: Colors.grey[500],
                          //           ),
                          //           SizedBox(
                          //             width: 10,
                          //           ),
                          //           InkWell(
                          //             onTap: (() {
                          //               setState(() {
                          //                 _remove = !_remove;
                          //               });
                          //             }),
                          //             child: Icon(
                          //               Icons.cancel,
                          //               color: Colors.grey[500],
                          //             ),
                          //           )
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // Divider(),
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

                          ref.watch(deliDoneServiceProvider).when(
                              data: (deliDoneList) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              // color: Constants.gray,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    headingRowColor: MaterialStateProperty.all(
                                        Constants.gray),
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
                                        "Action",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: Constants.tDefaultSize,
                                        ),
                                      )),
                                    ],
                                    // rows: orders!.map((order) {
                                    rows: deliDoneList.map((deliDone) {
                                      String apiDateString =
                                          "${deliDone!.created_at!}"; // Replace this with your API date
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
                                            (deliDoneList.indexOf(deliDone) + 1)
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: Constants.tSmallSize),
                                          ),
                                        )),
                                        DataCell(Text(
                                          "$formattedDate",
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          //'11-230020',
                                          deliDone!.order_code!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          //'Ko Thura',
                                          deliDone.to_name!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          // '09964483525',
                                          deliDone.to_phone!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          //'12e Ad Road',
                                          deliDone.to_address!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliDone.to_township!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          deliDone.item_info!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          //'1.00',
                                          deliDone.weight!,
                                          style: TextStyle(
                                              // color: Constants.green,
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: (() async {
                                                    setState(() {
                                                      orderid =
                                                          deliDone.order_id!;
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
                                                    Icons.flag_circle,
                                                    color: Constants.green,
                                                  ),
                                                ),
                                              ],
                                            ), onTap: () {
                                          Get.to(() => DoneDeliverDetail());
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
                          // Container(
                          //   height: MediaQuery.of(context).size.height * 0.04,
                          //   width: MediaQuery.of(context).size.width * 0.4,
                          //   padding: EdgeInsets.symmetric(
                          //     horizontal: 3,
                          //   ),
                          //   decoration:
                          //       BoxDecoration(border: Border.all(color: Colors.black12)),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //     children: [
                          //       Container(
                          //         child: Text(
                          //           'Previous',
                          //           style: TextStyle(fontSize: 12, color: Colors.black54),
                          //         ),
                          //       ),
                          //       Container(
                          //         width: 30,
                          //         color: Constants.blue,
                          //         child: Center(
                          //           child: Text(
                          //             '1',
                          //             style: TextStyle(fontSize: 12, color: Colors.white),
                          //           ),
                          //         ),
                          //       ),
                          //       Text(
                          //         'Next',
                          //         style: TextStyle(fontSize: 12, color: Colors.black54),
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
        },
      )),
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

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      String text = qrCode;
      List<String> substrings = text.split('/');
      print(substrings);
      // print(substrings[0]);
      // print(substrings[1]);
      // print(substrings[2]);
      // print(substrings[3]);
      // print(substrings[4]);

      if (!mounted) return;

      setState(() {
        getResult = '${substrings[4]} ';
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  addQRCode() async {
    final token = await SharedPref.getData(key: SharedPref.token);
    // Map<String, dynamic> request = {
    //   'preorder_id':preorder_id,
    //   'order_code': order_code
    // };
    final Map<String, dynamic> data = {
      // "preorder_id": requestid.toString(),
      "order_code": getResult,
    };

    final response = await http.post(
      Uri.parse(APIURL.addWithQRCode),
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: data,

      // body: jsonEncode(data)
    );

    print("${response.body}");
    print(getResult);
    // print(requestid);
  }
}
