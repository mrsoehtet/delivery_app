import 'dart:io';

import 'package:delivery_app/screen/pickup/request/pickupRequestDetail.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controller/getController.dart';
import '../../../error/errorScreen.dart';
import '../../../service/pickupRequestService.dart';
import '../../../utils/theme.dart';
import '../../login.dart';

class PickupRequestList extends StatefulWidget {
  const PickupRequestList({super.key});

  // @override
  // State<PickupRequestList> createState() => _PickupRequestListState();}

  @override
  State<PickupRequestList> createState() => _PickupRequestListState();
}

class _PickupRequestListState extends State<PickupRequestList> {
  //  Future<Null> _refreshScreen(BuildContext context) async {
  //   ref.invalidate(requestServiceProvider);
  //   ref.read(requestServiceProvider);
  // }
  var orders = Get.find<OrderController>().orders;
  var getResult = 'QR Code Result';

  var _remove;

  @override
  void initState() {
    // RequestService().getUserProfile();
    _remove = true;
    super.initState();
  }

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
                                    Get.to(ProfileScreen());
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
      body: SingleChildScrollView(child: Consumer(
        builder: (context, ref, child) {
          // final requestPick = ref!.watch(requestServiceProvider);
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
                    "To Pickup",
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
                    ' Delimen >',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    ' To Pickup',
                    style: TextStyle(fontSize: 12),
                  ),
                ]),
              ),
              SizedBox(
                height: 16,
              ),
              _remove
                  ? Card(
                      child: Container(
                      // width: double.infinity,
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
                              Text(
                                'To Pickup List',
                                style: TextStyle(
                                    fontSize: 16, color: Constants.red),
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
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        ref.watch(requestServiceProvider).when(
                            data: (requestList) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.74,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            // color: Constants.gray,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  //   dataRowHeight: 50, headingRowHeight: 30,
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
                                      "Assign Date",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Pickup Info",
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
                                      "",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Can Pickup Date",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: Constants.tDefaultSize,
                                      ),
                                    )),
                                    DataColumn(
                                        label: Text(
                                      "Ways",
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
                                  //rows: orders!.map((order) {
                                  rows: requestList.map((request) {
                                    return DataRow(cells: [
                                      DataCell(Container(
                                        padding: EdgeInsets.only(left: 5),
                                        //  color: Colors.white,
                                        child: Text(
                                          //  '1',

                                          request.id.toString(),

                                          // request.id.toString(),
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        ),
                                      )),
                                      DataCell(Text(
                                        //'21-08-2023 01:23 am',
                                        request.assign_date!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        // 'Jang Mi',
                                        request.name!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        //'09964483525',
                                        request.phone!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        // 'South Okkalapa',
                                        request.address!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(Text(
                                        //'Dagon',
                                        request.township!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(
                                          //request.no_of_way != null
                                          Text(
                                        // 'Yangon',
                                        request.state_name!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )
                                          // : Container()
                                          ),
                                      DataCell(Text(
                                        //'2023-08-21',
                                        request.can_pickup_date!,
                                        style: TextStyle(
                                            fontSize: Constants.tSmallSize),
                                      )),
                                      DataCell(request.no_of_way != null
                                          ? Text(
                                              //'2',
                                              request.no_of_way.toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      Constants.tSmallSize),
                                            )
                                          : Container()),
                                      DataCell(request.status != null
                                          ? Text(
                                              //'done',
                                              request.status.toString(),
                                              style: TextStyle(
                                                  // color: Constants.green,
                                                  fontSize:
                                                      Constants.tSmallSize),
                                            )
                                          : Container()),
                                      DataCell(
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Get.to(PickupRequestDetails());
                                              },
                                              child: Icon(
                                                Icons.message,
                                                color: Constants.blue,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (() {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return StatefulBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            StateSetter
                                                                setState) {
                                                      return Container(
                                                        // margin: EdgeInsets.only(bottom: 100),
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.72,
                                                        child: AlertDialog(
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          titleTextStyle:
                                                              const TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .black),
                                                          content: Container(
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.8,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        20),
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
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              15,
                                                                          right:
                                                                              15),
                                                                      child:
                                                                          Text(
                                                                        "Pickup Parcel",
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                16),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () =>
                                                                          Get.back(),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .cancel,
                                                                        color: Colors
                                                                            .grey,
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
                                                                                FontWeight.bold,
                                                                            fontSize: Constants.tDefaultSize))
                                                                    : Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            0.3,
                                                                        height: MediaQuery.of(context).size.height *
                                                                            0.2,
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Image.file(File(
                                                                              OrderController.selectedImagePath.value,
                                                                            )),
                                                                            // Text(
                                                                            //   'Parcel',
                                                                            //   style: TextStyle(
                                                                            //     fontSize: Constants
                                                                            //         .tDefaultSize,
                                                                            //   ),
                                                                            // )
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
                                                                          onTap:
                                                                              () {
                                                                            OrderController.getImage(ImageSource.camera);
                                                                          },
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/icons/camera.png',
                                                                            width:
                                                                                100,
                                                                            height:
                                                                                100,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'Take Photo',
                                                                          style: TextStyle(
                                                                              fontSize: Constants.tDefaultSize,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                              width: MediaQuery.of(context).size.width * 0.19,
                                                                              decoration: BoxDecoration(color: Constants.yellow, borderRadius: BorderRadius.circular(3)),
                                                                              child: Row(
                                                                                children: [
                                                                                  Text(
                                                                                    'cancel',
                                                                                    //  textAlign: TextAlign.center,
                                                                                    style: TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width: 100,
                                                                            ),
                                                                            Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                              width: MediaQuery.of(context).size.width * 0.15,
                                                                              decoration: BoxDecoration(color: Constants.green, borderRadius: BorderRadius.circular(3)),
                                                                              child: Row(
                                                                                children: [
                                                                                  Text(
                                                                                    'send',
                                                                                    //  textAlign: TextAlign.center,
                                                                                    style: TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),

                                                                    // Column(
                                                                    //   children: [
                                                                    //     InkWell(
                                                                    //       onTap: () {
                                                                    //         OrderController.getImage(
                                                                    //             ImageSource.gallery);
                                                                    //       },
                                                                    //       child: Image.asset(
                                                                    //         'assets/icons/gallery.png',
                                                                    //         width: 100,
                                                                    //         height: 100,
                                                                    //       ),
                                                                    //     ),
                                                                    //     Text(
                                                                    //       'Gallery',
                                                                    //       style: TextStyle(
                                                                    //           fontSize: Constants
                                                                    //               .tDefaultSize,
                                                                    //           fontWeight:
                                                                    //               FontWeight.bold),
                                                                    //     ),
                                                                    //   ],
                                                                    // ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Divider(
                                                                  color: Colors
                                                                      .grey,
                                                                  thickness: 1,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              15,
                                                                          right:
                                                                              15,
                                                                          bottom:
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        'Scan',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                Constants.tDefaultSize,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        scanQRCode();
                                                                      },
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/icons/scanner.png',
                                                                        width:
                                                                            90,
                                                                        height:
                                                                            90,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      getResult,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            Constants.tDefaultSize,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              20),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Container(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.19,
                                                                            decoration:
                                                                                BoxDecoration(color: Constants.yellow, borderRadius: BorderRadius.circular(3)),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text(
                                                                                  'cancel',
                                                                                  //  textAlign: TextAlign.center,
                                                                                  style: TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                95,
                                                                          ),
                                                                          Container(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.15,
                                                                            decoration:
                                                                                BoxDecoration(color: Constants.green, borderRadius: BorderRadius.circular(3)),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Text(
                                                                                  'send',
                                                                                  //  textAlign: TextAlign.center,
                                                                                  style: TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                  },
                                                );
                                              }),
                                              child: Icon(
                                                Icons.telegram,
                                                color: Colors.blue,
                                              ),
                                            ),
                                            Icon(
                                              Icons.flag_circle,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                        //   onTap: () {
                                        // Get.to(() => PickupRequestDetails());

                                        // Get.to(() => OrderDetailScreen(
                                        //       orderId: order.id!,
                                        //       orderStatus: order.last_status!.name!,
                                        //       order_id: order.orderId.toString(),
                                        //     )
                                        //     );
                                        //}
                                      )
                                    ]);
                                  }).toList(),
                                ),
                              ),
                            ),
                          );
                        }, error: (Object error, StackTrace stackTrace) {
                          return Text(error.toString());
                          // ErrorScreen(
                          //   aspectR: 1,
                          //   iconSize: 100,
                          //   textSize: 18,
                          //   profile: true,
                          // );
                        }, loading: () {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
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
                    )
                      //: Container(),
                      )
                  : Container(),
            ]),
          );
        },
      )),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
