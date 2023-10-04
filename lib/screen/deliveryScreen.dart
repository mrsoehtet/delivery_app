import 'package:delivery_app/screen/delivery/cancelDeli/cancelDeliverScreen.dart';
import 'package:delivery_app/screen/delivery/doneDeliver/doneDeliverScreen.dart';
import 'package:delivery_app/screen/delivery/getWay/getWayScreen.dart';
import 'package:delivery_app/screen/delivery/processList/deliverProcess.dart';
import 'package:delivery_app/screen/delivery/returnDeli/returnDeliScreen.dart';
import 'package:delivery_app/screen/delivery/transferToWH/transferToWHScreen.dart';
import 'package:delivery_app/screen/login.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../controller/getController.dart';
import '../model/order.dart';
import '../utils/theme.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
              child: InkWell(
                  //onTap: () => Get.to(DailyChoice()),
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: (() {
                            Get.to(GetWayScreen());
                          }),
                          child: DeliveryCard(deliWay: 'Get Way')),
                      InkWell(
                          onTap: () => Get.to(TransferToWHScreen()),
                          child: DeliveryCard(deliWay: 'Transfer To WH')),
                      InkWell(
                          onTap: () => Get.to(DeliverProcessList()),
                          child:
                              DeliveryCard(deliWay: 'Delivery Process List')),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => Get.to(DoneDeliverScreen()),
                          child:
                              DeliveryCard(deliWay: 'Done (Delivered) List')),
                      InkWell(
                          onTap: () => Get.to(ReturnDeliverScreen()),
                          child: DeliveryCard(deliWay: 'Return')),
                      InkWell(
                          onTap: () => Get.to(CancelDeliverScreen()),
                          child: DeliveryCard(deliWay: 'Cancel (Back to OS)')),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DeliveryCard(
                        deliWay: 'Report',
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ])),
    );
  }
}

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key, required this.deliWay});
  final String deliWay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Card(
        color: Constants.gray,
        elevation: 5,
        //shadowColor: Colors.transparent,
        // shadowColor: Colors.black,
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(children: [
            Text(
              // delivery.name.toString(),
              deliWay,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
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
