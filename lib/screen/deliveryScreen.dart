import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/screen/delivery/cancelDeli/cancelDeliverScreen.dart';
import 'package:delivery_app/screen/delivery/doneDeliver/doneDeliverScreen.dart';
import 'package:delivery_app/screen/delivery/getWay/getWayScreen.dart';
import 'package:delivery_app/screen/delivery/processList/deliverProcess.dart';
import 'package:delivery_app/screen/delivery/returnDeli/returnDeliScreen.dart';
import 'package:delivery_app/screen/delivery/transferToWH/transferToWHScreen.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../utils/theme.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
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

      //  bottomNavigationBar: buildBottomNavigationMenu(context, naviController),
      // backgroundColor: Color.fromARGB(0, 212, 245, 242),
      appBar: AppBar(
        title: Text(
          "Delivery",
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
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: (() {
                            Get.to(() => GetWayScreen());
                          }),
                          child: DeliveryCard(
                              deliWay: 'Get Way',
                              image: 'assets/icons/exit.png')),
                      InkWell(
                          onTap: () => Get.to(() => TransferToWHScreen()),
                          child: DeliveryCard(
                              deliWay: 'Transfer To WH',
                              image: 'assets/icons/transfer.png')),
                      // InkWell(
                      //     onTap: () => Get.to(DeliverProcessList()),
                      //     child: DeliveryCard(
                      //       deliWay: 'Delivery Process List',
                      //       image: 'assets/icons/processing.png',
                      //     )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () => Get.to(() => DeliverProcessList()),
                          child: DeliveryCard(
                            deliWay: 'Delivery Process List',
                            image: 'assets/icons/processing.png',
                          )),
                      InkWell(
                          onTap: () => Get.to(() => DoneDeliverScreen()),
                          child: DeliveryCard(
                            deliWay: 'Done (Delivered) List',
                            image: 'assets/icons/work-in-progress.png',
                          )),
                      // InkWell(
                      //     onTap: () => Get.to(ReturnDeliverScreen()),
                      //     child: DeliveryCard(
                      //         deliWay: 'Return',
                      //         image: 'assets/icons/work-in-progress.png')),
                      // InkWell(
                      //     onTap: () => Get.to(CancelDeliverScreen()),
                      //     child: DeliveryCard(
                      //         deliWay: 'Cancel (Back to OS)',
                      //         image: 'assets/icons/work-in-progress.png')),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () => Get.to(() => ReturnDeliverScreen()),
                          child: DeliveryCard(
                              deliWay: 'Return',
                              image: 'assets/icons/return.png')),
                      InkWell(
                          onTap: () => Get.to(() => CancelDeliverScreen()),
                          child: DeliveryCard(
                              deliWay: 'Cancel (Back to OS)',
                              image: 'assets/icons/multiply.png')),
                      // DeliveryCard(
                      //     deliWay: 'Report',
                      //     image: 'assets/icons/work-in-progress.png'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      DeliveryCard(
                          deliWay: 'Report',
                          image: 'assets/icons/report (1).png'),
                    ],
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  DeliveryCard({super.key, required this.deliWay, required this.image});
  final String deliWay;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        // color: Constants.gray,
        elevation: 5,
        //shadowColor: Colors.transparent,
        // shadowColor: Colors.black,
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(children: [
            Image.asset(
              image,
              scale: 13,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              // delivery.name.toString(),
              deliWay,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),

            // Divider(
            //   color: CustomColor.black,
            // ),
          ]),
        ),
      ),
    );
  }
}
