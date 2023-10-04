import 'dart:convert';
import 'dart:io';
import 'package:delivery_app/model/idArrange/idArrange.dart';
import 'package:delivery_app/model/pickupRequest/request/request.dart';
import 'package:delivery_app/model/pickupRequest/requestList/requestList.dart';
import 'package:delivery_app/screen/pickup/request/pickupRequestDetail.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/utils/constants.dart';
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
import '../../../controller/getController.dart';
import '../../../service/pickupRequestService.dart';
import '../../../utils/theme.dart';
import 'package:http/http.dart' as http;
import '../../login.dart';

class PickupRequestList extends StatefulWidget {
  const PickupRequestList({super.key});

  // @override
  // State<PickupRequestList> createState() => _PickupRequestListState();}

  @override
  State<PickupRequestList> createState() => _PickupRequestListState();
}

class _PickupRequestListState extends State<PickupRequestList> {
  int? requestid;
  //  Future<Null> _refreshScreen(BuildContext context) async {
  //   ref.invalidate(requestServiceProvider);
  //   ref.read(requestServiceProvider);
  // }

  RequestList resList = new RequestList(true, [], '');

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  var orders = Get.find<OrderController>().orders;
  var getResult = 'QR Code Result';
  var selectedImagePath = "".obs;
  // bool showDialogVisible = false;
  // File? _image = null;
  var preoreder_id;

  var _remove;

  @override
  void initState() {
    requestServiceProvider;
    // RequestService().getUserProfile();
    _refresh(true);
    // WidgetsBinding.instance.addPostFrameCallback((_) => _refreshIndicatorKey.currentState!.show());
    _remove = true;
    super.initState();
  }

  Future<Null> _refreshReq() {
    return getRequestInfo().then((_resList) {
      setState(() {
        resList = _resList;
      });
    });
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
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.menu,
        //     )),
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
                    "To Pickup List",
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
                      //  height: MediaQuery.of(context).size.height * 0.9,
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
                                'Date Filter',
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
                            height: MediaQuery.of(context).size.height * 0.6,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            // color: Constants.gray,
                            child: RefreshIndicator(
                              key: _refreshIndicatorKey,
                              onRefresh: () async {
                                await _refresh(true);
                                // await _refreshReq();
                              },
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
                                    //   dataRowHeight: 50, headingRowHeight: 30,
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
                                      // List<IDArrange> idArrange = [
                                      //   IDArrange(request!.id, roll_number)
                                      // ];
                                      return
                                          // request!.status != null?
                                          DataRow(cells: [
                                        DataCell(Container(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            request!.id.toString(),

                                            // request.id.toString(),
                                            style: TextStyle(
                                                fontSize: Constants.tSmallSize),
                                          ),
                                        )),
                                        DataCell(Text(
                                          //'21-08-2023 01:23 am',
                                          request!.assign_date!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          // 'Jang Mi',
                                          request!.name!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          //'09964483525',
                                          request!.phone!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          // 'South Okkalapa',
                                          request!.address!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          //'Dagon',
                                          request!.township!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(
                                            //request.no_of_way != null
                                            Text(
                                          // 'Yangon',
                                          request!.state_name!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )
                                            // : Container()
                                            ),
                                        DataCell(Text(
                                          //'2023-08-21',
                                          request!.can_pickup_date!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(request.no_of_way != null
                                            ? Text(
                                                //'2',
                                                request!.no_of_way.toString(),
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )
                                            : Container()),
                                        DataCell(request!.status != null
                                            ? Text(
                                                'done',
                                                // request!.status.toString(),
                                                style: TextStyle(
                                                    color: Constants.green,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )
                                            : Text(
                                                'Assigned',
                                                // request!.status.toString(),
                                                style: TextStyle(
                                                    color: Constants.blue,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )),
                                        DataCell(
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    requestid = request.id!;
                                                  });
                                                  Get.to(PickupRequestDetails(
                                                      id: requestid
                                                          .toString()));
                                                },
                                                child: Icon(
                                                  Icons.message,
                                                  color: Constants.blue,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (() {
                                                  setState(() {
                                                    requestid = request.id!;
                                                  });
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
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black),
                                                            content: StatefulBuilder(
                                                                builder: (context,
                                                                    SetStateDialog) {
                                                              return Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.8,
                                                                padding: const EdgeInsets
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
                                                                              left: 15,
                                                                              right: 15),
                                                                          child:
                                                                              Text(
                                                                            "Pickup Parcel",
                                                                            style:
                                                                                const TextStyle(fontSize: 16),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              Get.back();
                                                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => PickupRequestList()));
                                                                              // showDialogVisible = false;
                                                                            });
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.cancel,
                                                                            color:
                                                                                Colors.grey,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    Divider(),
                                                                    Obx((() => OrderController
                                                                                .selectedImagePath.value ==
                                                                            // selectedImagePath.value ==
                                                                            ''
                                                                        ? Text(
                                                                            'Select image camera/gallery',
                                                                            style:
                                                                                TextStyle(fontWeight: FontWeight.bold, fontSize: Constants.tDefaultSize))
                                                                        : Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.3,
                                                                            height:
                                                                                MediaQuery.of(context).size.height * 0.2,
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                // Image.file(File(_image.toString())),
                                                                                Image.file(File(
                                                                                  OrderController.selectedImagePath.value,
                                                                                )),
                                                                                //FileImage(_image);
                                                                              ],
                                                                            ),
                                                                          ))),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
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
                                                                                setState(() {
                                                                                  getImage(ImageSource.camera);
                                                                                });
                                                                                //  OrderController.getImage(ImageSource.camera);
                                                                                //  getImage(ImageSource.camera);
                                                                              },
                                                                              child: Image.asset(
                                                                                'assets/icons/camera.png',
                                                                                width: 100,
                                                                                height: 100,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Take Photo',
                                                                              style: TextStyle(fontSize: Constants.tDefaultSize, fontWeight: FontWeight.bold),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            // Row(
                                                                            //   children: [
                                                                            //     Container(
                                                                            //       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                            //       width: MediaQuery.of(context).size.width * 0.19,
                                                                            //       decoration: BoxDecoration(color: Constants.yellow, borderRadius: BorderRadius.circular(3)),
                                                                            //       child: Row(
                                                                            //         children: [
                                                                            //           InkWell(
                                                                            //             onTap: () => Get.back(),
                                                                            //             child: Text(
                                                                            //               'cancel',
                                                                            //               //  textAlign: TextAlign.center,
                                                                            //               style: TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                            //             ),
                                                                            //           ),
                                                                            //         ],
                                                                            //       ),
                                                                            //     ),
                                                                            //     SizedBox(
                                                                            //       width: 100,
                                                                            //     ),
                                                                            //     Container(
                                                                            //       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                            //       width: MediaQuery.of(context).size.width * 0.15,
                                                                            //       decoration: BoxDecoration(color: Constants.green, borderRadius: BorderRadius.circular(3)),
                                                                            //       child: Row(
                                                                            //         children: [
                                                                            //           InkWell(
                                                                            //             onTap: () {
                                                                            //               // OrderController.uploadImage(filename, url);
                                                                            //               Fluttertoast.showToast(msg: 'Successfully Added Way.', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.green, fontSize: 14);
                                                                            //               Get.back();
                                                                            //               // Navigator.of(context).pop();
                                                                            //             },
                                                                            //             child: Text(
                                                                            //               'send',
                                                                            //               //  textAlign: TextAlign.center,
                                                                            //               style: TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                            //             ),
                                                                            //           ),
                                                                            //           //  Text(requestid.toString())
                                                                            //         ],
                                                                            //       ),
                                                                            //     ),
                                                                            //   ],
                                                                            // )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Divider(
                                                                      color: Colors
                                                                          .grey,
                                                                      thickness:
                                                                          1,
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 15,
                                                                              right: 15,
                                                                              bottom: 10),
                                                                          child:
                                                                              Text(
                                                                            'Scan',
                                                                            style:
                                                                                TextStyle(fontSize: Constants.tDefaultSize, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            scanQRCode();
                                                                          },
                                                                          child:
                                                                              Image.asset(
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
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            SetStateDialog(() {
                                                                              setState() {
                                                                                getResult;
                                                                              }
                                                                            });
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            getResult,
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                TextStyle(fontSize: Constants.tDefaultSize, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Container(
                                                                          margin:
                                                                              EdgeInsets.symmetric(horizontal: 20),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                                width: MediaQuery.of(context).size.width * 0.19,
                                                                                decoration: BoxDecoration(color: Constants.yellow, borderRadius: BorderRadius.circular(3)),
                                                                                child: Row(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap: () => Get.back(),
                                                                                      child: Text(
                                                                                        'cancel',
                                                                                        //  textAlign: TextAlign.center,
                                                                                        style: TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 95,
                                                                              ),
                                                                              Container(
                                                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                                width: MediaQuery.of(context).size.width * 0.15,
                                                                                decoration: BoxDecoration(color: Constants.green, borderRadius: BorderRadius.circular(3)),
                                                                                child: Row(
                                                                                  children: [
                                                                                    InkWell(
                                                                                      onTap: () {
                                                                                        print("QR Code Result ****************: ");
                                                                                        addQRCode();

                                                                                        Fluttertoast.showToast(msg: 'Successful Scan', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.green, fontSize: 14);
                                                                                        Get.back();
                                                                                      },
                                                                                      child: Text(
                                                                                        'send',
                                                                                        style: TextStyle(fontSize: Constants.tDefaultSize, color: Colors.white),
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
                                                child: request.status == null
                                                    ? Icon(
                                                        Icons.telegram,
                                                        color: Colors.blue,
                                                      )
                                                    : Text(''),
                                              ),
                                              InkWell(
                                                onTap: (() {
                                                  setState(() {
                                                    requestid = request.id!;
                                                  });
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
                                                              0.2,
                                                          child: AlertDialog(
                                                            // backgroundColor: Constants.realRed,
                                                            contentPadding:
                                                                EdgeInsets.zero,
                                                            titleTextStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        14,
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
                                                                  0.17,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          10,
                                                                      vertical:
                                                                          20),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            15,
                                                                        right:
                                                                            15),
                                                                    child: Text(
                                                                      "Done Order",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ),
                                                                  Divider(),
                                                                  Row(
                                                                    children: [
                                                                      // Icon(
                                                                      //   Icons.person_add,
                                                                      //   color: Constants.realBlue,
                                                                      // ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                15,
                                                                            right:
                                                                                15),
                                                                        child:
                                                                            Text(
                                                                          "Are you sure want to done?",
                                                                          style: const TextStyle(
                                                                              fontSize: 14,
                                                                              color: Colors.black),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Divider(),

                                                                  // Center(
                                                                  //     child: Text(
                                                                  //   'View all',
                                                                  //   style: TextStyle(fontSize: 12),
                                                                  // )),
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
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            Constants.yellow,
                                                                        side: BorderSide(

                                                                            //  width: 5.0,
                                                                            color: Colors.white),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Close',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                Constants.tSmallSize,
                                                                            color: Colors.black),
                                                                      )),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      doneConfirm();
                                                                      Fluttertoast.showToast(
                                                                          msg:
                                                                              'Done Successfully.',
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
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .green,
                                                                      side: BorderSide(
                                                                          //  width: 5.0,
                                                                          color: Colors.white),
                                                                    ),
                                                                    child: Text(
                                                                      'Confirm',
                                                                      style: TextStyle(
                                                                          fontSize: Constants
                                                                              .tSmallSize,
                                                                          color:
                                                                              Colors.black),
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
                                                }),
                                                child: request.status == null
                                                    ? Icon(
                                                        Icons.flag_circle,
                                                        color: Colors.green,
                                                      )
                                                    : Text(''),
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
                                      // : DataRow(cells: [
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //     DataCell(Text('')),
                                      //   ]);
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }, error: (Object error, StackTrace stackTrace) {
                          return Text(error.toString());
                          // ErrorScreen(
                          //   aspectR: 1,
                          //   iconSize: 80,
                          //   textSize: 16,
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

  Future<void> _refresh(bool reload) async {
    // await getImage(ImageSource.camera);
    // await addQRCode();
    return await Future.delayed(Duration(seconds: 2));
  }

  addQRCode() async {
    final token = await SharedPref.getData(key: SharedPref.token);
    // Map<String, dynamic> request = {
    //   'preorder_id':preorder_id,
    //   'order_code': order_code
    // };
    final Map<String, dynamic> data = {
      "preorder_id": requestid.toString(),
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
    print(requestid);
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

  Future<RequestList> getRequestInfo() async {
    //final token = await SharedPref.getData(key: SharedPref.token);

    final response = await http.get(Uri.parse(APIURL.pickupRequest));
    final responseJson = json.decode(response.body);
    return RequestList.fromJson(responseJson);

    // final request = RequestList.fromJson(response.data);
    //return request.data;
  }

  Future<String?> uploadImage(filename, url) async {
    print("Hello from profile Image Upload $filename");
    var res;
    var request = http.MultipartRequest('POST', Uri.parse(url));
    final token = await SharedPref.getData(key: SharedPref.token);
    request.headers['Authorization'] = token!;
    request.headers['Accept'] = "application/json";
    request.fields['preorder_id'] = requestid.toString();
    request.files.add(await http.MultipartFile.fromPath('photo', filename));

    print("Token : $request");
    //var res = await request.send();
    //await request.send().then((response) => print(response));
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
    // setState(() {
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
    //   });

    print(res);
  }

  doneConfirm() async {
    final token = await SharedPref.getData(key: SharedPref.token);
    final Map<String, dynamic> data = {
      "preorder_id": requestid.toString(),
    };

    final response = await http.post(
      Uri.parse('https://newbrdemo.icgwebdevelopment.com/api/pickedup'),
      headers: {
        'Accept': 'application/json; charset=UTF-8',
        'Authorization': token!
      },
      body: data,
    );
    print("${response.body}");
    print("Done Pickup ********************** $requestid");
  }
}
