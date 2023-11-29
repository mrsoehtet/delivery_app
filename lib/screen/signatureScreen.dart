import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:delivery_app/utils/global.dart';
import 'package:delivery_app/utils/sharedPref.dart';
import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:http/http.dart' as http;

class SignatureScreen extends StatefulWidget {
  final String id;
  const SignatureScreen({super.key, required this.id});

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
  Uint8List? exportedImage;
  ByteData eSignImage = ByteData(0);
  String imagePath = "";

  // dynamic exportedImage;

  SignatureController controller = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.red,
    exportBackgroundColor: Colors.black,
  );

  //final signature = controller.toPngByets(height:100.round(),width:100.round());

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

  sendESign(filename) async {
    final token = await SharedPref.getData(key: SharedPref.token);

    var res;
    var request = http.MultipartRequest('POST', Uri.parse(APIURL.deliveryDone));
    request.headers['Authorization'] = token!;
    request.headers['Accept'] = "application/json";
    request.fields['order_code'] = widget.id;
    request.files.add(await http.MultipartFile.fromPath('esign', filename));
    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    print(request);
    print("Token : ${request.fields}");
    print("Token : ${request.files}");
    print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
    //var res = await request.send();
    //await request.send().then((response) => print(response));
    await request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((value) {
        var resData = jsonDecode(value);
        print("ResData : $resData");
        res = resData['message'];
      });
    }).whenComplete(() {
      Get.back();
      Get.back();
      Get.snackbar("Alert", "Done!", backgroundColor: Colors.greenAccent);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    final NaviController naviController = Get.put(NaviController());

    return Scaffold(
      bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
      appBar: AppBar(
        title: Text('Signature'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            widget.id,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          imagePath == ""
              ? Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                    )),
                    child: Signature(
                      controller: controller,
                      // width: 300,
                      // height: 200,
                      backgroundColor: Colors.white38,
                    ),
                  ),
                )
              : Image.file(File(imagePath)),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    // var data = await controller.toByteData(format: ui.ImageByteFormat.png);
                    var data =
                        await controller.toPngBytes(width: 200, height: 100);
                    final tempDir = await getTemporaryDirectory();
                    File file =
                        await File('${tempDir.path}/image.png').create();
                    file.writeAsBytesSync(data!);
                    setState(() {
                      imagePath = file.path;
                    });
                    // setState(() {
                    //   sendESign();
                    // });
                    print('Esign ${file.path}');
                    sendESign(file.path);

                    // Now you can save or use the PNG data as needed
                    // For example, you can save it to a file using the path_provider package.
                  },
                  // onPressed: () async {

                  //   exportedImage = await controller.toPngBytes();
                  //   setState(() {
                  //     sendESign();
                  //   });
                  //   print('Esign $exportedImage');
                  // },
                  child: Text('Send')),
              ElevatedButton(
                  onPressed: () {
                    controller.clear();
                  },
                  child: Text('Clear')),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          //  if (file.path != null) Image.memory(exportedImage!)
        ],
      ),
    );
  }
}
