import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/screen/login.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:delivery_app/utils/global.dart';
import 'package:delivery_app/utils/sharedPref.dart';
import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class QRScanScreen extends StatefulWidget {
  const QRScanScreen({super.key});

  @override
  State<QRScanScreen> createState() => _QRScanScreenState();
}

class _QRScanScreenState extends State<QRScanScreen> {
  var getResult = 'QR Code Result';

  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

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
      //  bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
      appBar: AppBar(
        title: Text(
          "DelimenPannel",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Constants.blue,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, setStateDialog) {
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Text(
              'Scan',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
              setState() {
                getResult;
              }
            },
            child: Text(
              getResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Constants.tDefaultSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  width: MediaQuery.of(context).size.width * 0.19,
                  decoration: BoxDecoration(
                      color: Constants.yellow,
                      borderRadius: BorderRadius.circular(3)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: Text(
                          'cancel',
                          //  textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                              color: Colors.white),
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
                  decoration: BoxDecoration(
                      color: Constants.green,
                      borderRadius: BorderRadius.circular(3)),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          addQRCode();

                          Fluttertoast.showToast(
                              msg: 'Successful Scan',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              fontSize: 14);
                          // Get.back();
                        },
                        child: Text(
                          'send',
                          style: TextStyle(
                              fontSize: Constants.tDefaultSize,
                              color: Colors.white),
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
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      String text = qrCode;
      List<String> substrings = text.split('/');
      print(substrings);

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

          // body: jsonEncode(data)
        )
        .whenComplete(() => getResult = 'QR Code Result');

    print(" Get Way QR Code  QR Screen ${response.body}");
    print(getResult);
    // print(requestid);
  }
}
