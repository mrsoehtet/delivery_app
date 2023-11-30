import 'dart:convert';
import 'dart:io';
import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/model/pickupRequest/requestList/requestList.dart';
import 'package:delivery_app/screen/pickup/request/pickupRequestDetail.dart';
import 'package:delivery_app/screen/profile.dart';
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
import 'package:intl/intl.dart';
import '../../../controller/getController.dart';
import '../../../service/pickupRequestService.dart';
import '../../../utils/theme.dart';
import 'package:http/http.dart' as http;
import '../../login.dart';

class PickupRequestList extends StatefulWidget {
  const PickupRequestList({super.key});

  @override
  State<PickupRequestList> createState() => _PickupRequestListState();
}

class _PickupRequestListState extends State<PickupRequestList> {
  int? requestid;
  DateTime? start;
  DateTime? end;
  //  DateTimeRange dateRange = DateTimeRange(
  //   start: DateTime.now(),
  //   end: DateTime.now(
  //    DateTime.now().year,
  //     DateTime.now().month,DateTime.now().day+6
  //   ),
  // );

  // RequestList resList = new RequestList(true, [], '');

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

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
  var getResult = 'QR Code Result';
  var selectedImagePath = "";

  var preoreder_id;

  var _remove;
  var isButtonEnabled;
  bool isLoading = false;

  @override
  void initState() {
    requestServiceProvider;
    _remove = true;
    isButtonEnabled = true;
    super.initState();
  }

  Future<void> _refresh(bool reload, WidgetRef ref) async {
    // await getImage(ImageSource.camera);
    // await addQRCode();
    ref.invalidate(requestServiceProvider);
    return await Future.delayed(Duration(seconds: 2));
  }

  addQRCode() async {
    final token = await SharedPref.getData(key: SharedPref.token);

    final Map<String, dynamic> data = {
      "preorder_id": requestid.toString(),
      "order_code": getResult,
    };

    final response = await http
        .post(
          Uri.parse(APIURL.addWithQRCode),
          headers: {
            'Accept': 'application/json; charset=UTF-8',
            'Authorization': token!
          },
          body: data,

          // body: jsonEncode(data)
        )
        .whenComplete(() => getResult = 'QR Code Result');

    print("${response.body}");
    print(getResult);
    print(requestid);
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
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  Future<RequestList> getRequestInfo() async {
    final response = await http.get(Uri.parse(APIURL.pickupRequest));
    final responseJson = json.decode(response.body);
    return RequestList.fromJson(responseJson);
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
    await request
        .send()
        .then((response) async {
          response.stream.transform(utf8.decoder).listen((value) {
            var resData = jsonDecode(value);
            print("ResData : $resData");
            res = resData['message'];
          });
        })
        .whenComplete(() => selectedImagePath = "")
        .catchError((e) {
          print(e);
        });
    print(res);

    return res;
  }

  Future<String> getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    // var res = await uploadImage(pickedFile!.path, APIURL.addWayWithPhoto);
    print("Picked File ${pickedFile!.path}");
    // setState(() {
    if (pickedFile != null) {
      // OrderController.selectedImagePath.value = pickedFile.path;
      //selectedImagePath.value = pickedFile.path;
      print(" Image Result : ${selectedImagePath}");
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }
    //   });
    return pickedFile.path;
  }

  Future<List<String>> fetchRandomIds() async {
    final response = await http.get(Uri.parse(APIURL.pickupRequest));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => item['id'].toString()).toList();
    } else {
      throw Exception('Failed to load random IDs');
    }
  }

  Future<List<String>> getSortedRollNumbers() async {
    List<String> randomIds = await fetchRandomIds();
    randomIds.sort(); // Sort the random IDs
    List<String> rollNumbers = [];
    for (int i = 0; i < randomIds.length; i++) {
      rollNumbers.add('Roll Number ${i + 1}: ${randomIds[i]}');
    }
    return rollNumbers;
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
              //       ' To Pickup',
              //       style: TextStyle(fontSize: 12),
              //     ),
              //   ]),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              _remove
                  ? ref.watch(requestServiceProvider).when(data: (requestList) {
                      return Card(
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
                                // Text(
                                //   'Date Filter',
                                //   style: TextStyle(
                                //       fontSize: 16, color: Constants.red),
                                // ),

                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () async {
                                              final result =
                                                  await showDateRangePicker(
                                                      context: context,
                                                      firstDate: DateTime(2000),
                                                      lastDate: DateTime.now()
                                                          .add(Duration(
                                                              days: 365)));

                                              if (result != null) {
                                                setState(() {
                                                  start = result.start;

                                                  end = result.end;
                                                });
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.date_range),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Filter',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 110,
                                          ),
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
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        // ElevatedButton(
                                        //   onPressed: () async {
                                        //     final result =
                                        //         await showDateRangePicker(
                                        //             context: context,
                                        //             firstDate: DateTime(2000),
                                        //             lastDate: DateTime.now()
                                        //                 .add(Duration(
                                        //                     days: 365)));

                                        //     if (result != null) {
                                        //       setState(() {
                                        //         start = result.start;

                                        //         end = result.end;
                                        //       });
                                        //     }
                                        //   },
                                        //   child: Text(
                                        //     'Filter',
                                        //     style: TextStyle(
                                        //         fontSize: 16,
                                        //         color: Colors.white),
                                        //   ),
                                        // ),
                                        // SizedBox(
                                        //   width: 10,
                                        // ),
                                        start != null
                                            ? Column(
                                                // crossAxisAlignment:
                                                //     CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text('Start Date :'),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 8,
                                                                vertical: 4),
                                                        decoration: BoxDecoration(
                                                            border:
                                                                Border.all(),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: start != null
                                                            ? Text(
                                                                DateFormat(
                                                                        "dd-MM-yyyy")
                                                                    .format(
                                                                        start!),
                                                                // requestList.data![index]['assigned_date'],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Constants
                                                                        .blue),
                                                              )
                                                            : Container(),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  //  Text('to'),
                                                  Row(
                                                    children: [
                                                      Text('End Date :'),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal: 8,
                                                                  vertical: 4),
                                                          decoration: BoxDecoration(
                                                              border:
                                                                  Border.all(),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Text(
                                                            DateFormat(
                                                                    "dd-MM-yyyy")
                                                                .format(end!),
                                                            // requestList.data![index]['assigned_date'],
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Constants
                                                                    .blue),
                                                          )
                                                          // Text(
                                                          //   end?.toIso8601String() ??
                                                          //       '-',
                                                          //   style: TextStyle(
                                                          //       fontSize: 12,
                                                          //       color: Constants
                                                          //           .blue),
                                                          // ),
                                                          ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          ref.watch(requestServiceProvider).when(
                              data: (requestList) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.55,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              // color: Constants.gray,
                              child: RefreshIndicator(
                                key: _refreshIndicatorKey,
                                onRefresh: () async {
                                  await _refresh(true, ref);
                                  // await _refreshReq();
                                },
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                      //   dataRowHeight: 50, headingRowHeight: 30,
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
                                      rows: requestList.data!.map((request) {
                                        String apiDateString =
                                            "${request!.assign_date!}"; // Replace this with your API date
                                        DateTime apiDate =
                                            DateTime.parse(apiDateString);
                                        String formattedDate =
                                            DateFormat('dd-MM-yyyy ')
                                                .format(apiDate);
                                        print(formattedDate);

                                        return
                                            // request!.status != null?
                                            DataRow(cells: [
                                          DataCell(Container(
                                            padding: EdgeInsets.only(left: 5),
                                            child: Text(
                                              (requestList.data!
                                                          .indexOf(request) +
                                                      1)
                                                  .toString(),

                                              // request.id.toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      Constants.tSmallSize),
                                            ),
                                          )),
                                          DataCell(Text(
                                            //'21-08-2023 01:23 am',
                                            // request!.assign_date!,
                                            "$formattedDate",

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
                                          DataCell(request.no_of_way != null &&
                                                  request.no_of_way != -1
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
                                                  onTap: () async {
                                                    setState(() {
                                                      requestid = request.id!;
                                                    });
                                                    bool res = await Get.to(
                                                        PickupRequestDetails(
                                                            id: requestid
                                                                .toString()));
                                                    if (res) {
                                                      ref.invalidate(
                                                          requestServiceProvider);
                                                    }
                                                  },
                                                  child: Container(
                                                    // padding:
                                                    //     EdgeInsets.symmetric(
                                                    //         horizontal: 3),
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
                                                InkWell(
                                                  onTap: (() {
                                                    setState(() {
                                                      requestid = request.id!;
                                                    });
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          // margin: EdgeInsets.only(bottom: 100),
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.7,
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
                                                                    setStateDialog) {
                                                              return Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.7,
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
                                                                    Text(
                                                                      'Take Photo',
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            Constants.tDefaultSize,
                                                                      ),
                                                                    ),
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
                                                                            Container(
                                                                              width: MediaQuery.of(context).size.width * 0.3,
                                                                              height: MediaQuery.of(context).size.height * 0.2,
                                                                              child: InkWell(
                                                                                onTap: () async {
                                                                                  final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
                                                                                  setStateDialog(() {
                                                                                    selectedImagePath = pickedFile!.path;
                                                                                  });
                                                                                  //  OrderController.getImage(ImageSource.camera);
                                                                                  //  getImage(ImageSource.camera);
                                                                                },
                                                                                child: selectedImagePath != ""
                                                                                    ? Container(
                                                                                        width: MediaQuery.of(context).size.width * 0.3,
                                                                                        height: MediaQuery.of(context).size.height * 0.2,
                                                                                        child: Image.file(File(
                                                                                          selectedImagePath,
                                                                                        )),
                                                                                      )
                                                                                    : Image.asset(
                                                                                        'assets/icons/camera.png',
                                                                                        width: 100,
                                                                                        height: 100,
                                                                                      ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10,
                                                                            ),
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
                                                                            scanQRCode(setStateDialog);
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
                                                                        Text(
                                                                          getResult,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              fontSize: Constants.tDefaultSize,
                                                                              fontWeight: FontWeight.bold),
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
                                                                            // mainAxisAlignment:
                                                                            //   MainAxisAlignment.spaceAround,
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
                                                                              Consumer(builder: (context, ref, child) {
                                                                                return isLoading
                                                                                    ? Card(
                                                                                        color: Constants.green,
                                                                                        elevation: 5,
                                                                                        child: Container(
                                                                                          width: 48,
                                                                                          height: 30,
                                                                                          alignment: Alignment.center,
                                                                                          child: Container(
                                                                                            width: 18,
                                                                                            height: 18,
                                                                                            child: CircularProgressIndicator(
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : InkWell(
                                                                                        highlightColor: Colors.transparent,
                                                                                        splashColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          // final token = await SharedPref.getData(key: SharedPref.token)
                                                                                          setStateDialog(() {
                                                                                            isLoading = true;
                                                                                          });

                                                                                          if (selectedImagePath != "") {
                                                                                            await uploadImage(selectedImagePath, APIURL.addWayWithPhoto);
                                                                                          } else {
                                                                                            addQRCode();
                                                                                          }
                                                                                          ref.invalidate(requestServiceProvider);
                                                                                          Fluttertoast.showToast(msg: 'Successful Scan', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.green, fontSize: 14);

                                                                                          setStateDialog(() {
                                                                                            isLoading = false;
                                                                                          });
                                                                                          Get.back();
                                                                                        },
                                                                                        child: Card(
                                                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                                                                                          color: Constants.green,
                                                                                          elevation: 5,
                                                                                          child: Container(
                                                                                            width: 48,
                                                                                            height: 30,
                                                                                            alignment: Alignment.center,
                                                                                            child: Text(
                                                                                              "send",
                                                                                              style: const TextStyle(fontSize: 14, color: Colors.white),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                              }),

                                                                              // Container(
                                                                              //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                                              //   width: MediaQuery.of(context).size.width * 0.15,
                                                                              //   decoration: BoxDecoration(color: Constants.green,
                                                                              //    borderRadius: BorderRadius.circular(3)),
                                                                              //   child: Row(
                                                                              //     children: [
                                                                              //       InkWell(
                                                                              //         onTap: isButtonEnabled
                                                                              //             ? () {
                                                                              //                 setState(() async {
                                                                              //                   isButtonEnabled = !isButtonEnabled;

                                                                              //                   if (selectedImagePath != "") {
                                                                              //                     await uploadImage(selectedImagePath, APIURL.addWayWithPhoto);
                                                                              //                   } else {
                                                                              //                     addQRCode();
                                                                              //                   }
                                                                              //                   ref.invalidate(requestServiceProvider);
                                                                              //                   Fluttertoast.showToast(msg: 'Successful Scan', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.green, fontSize: 14);
                                                                              //                   Get.back();
                                                                              //                   // setState(() {
                                                                              //                   //   isButtonEnabled = !isButtonEnabled;
                                                                              //                   // });
                                                                              //                 });

                                                                              //               }

                                                                              //             : (){},
                                                                              //         child: Text(
                                                                              //           'send',
                                                                              //           style: TextStyle(fontSize: Constants.tDefaultSize,
                                                                              //           color: Colors.white),
                                                                              //         ),
                                                                              //       ),
                                                                              //     ],
                                                                              //   ),
                                                                              // ),
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
                                                                  EdgeInsets
                                                                      .zero,
                                                              titleTextStyle:
                                                                  const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black),
                                                              content:
                                                                  Container(
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height *
                                                                    0.17,
                                                                padding: const EdgeInsets
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
                                                                      child:
                                                                          Text(
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
                                                                        Padding(
                                                                          padding: const EdgeInsets
                                                                              .only(
                                                                              left: 15,
                                                                              right: 15),
                                                                          child:
                                                                              Text(
                                                                            "Are you sure want to done?",
                                                                            style:
                                                                                const TextStyle(fontSize: 14, color: Colors.black),
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
                                                                              fontSize: Constants.tSmallSize,
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
                                                                            backgroundColor:
                                                                                Colors.green,
                                                                            fontSize: 14);
                                                                        Get.back();
                                                                      },
                                                                      style: ElevatedButton
                                                                          .styleFrom(
                                                                        backgroundColor:
                                                                            Colors.green,
                                                                        side: BorderSide(
                                                                            //  width: 5.0,
                                                                            color: Colors.white),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Confirm',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                Constants.tSmallSize,
                                                                            color: Colors.black),
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
                                '',
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
                          );
                    }, error: (Object error, StackTrace stackTrace) {
                      return Text('$error');
                    }, loading: () {
                      return CircularProgressIndicator();
                    })
                  : Container(),
            ]),
          );
        },
      )),
    );
  }
}
