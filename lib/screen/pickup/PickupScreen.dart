import 'package:delivery_app/screen/pickup/donePickup/pickupDone.dart';
import 'package:delivery_app/screen/pickup/process/pickupProcessDetails.dart';
import 'package:delivery_app/screen/pickup/request/pickupRequest.dart';
import 'package:delivery_app/screen/pickup/report/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../login.dart';
import '../profile.dart';
import 'process/pickupProcess.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({super.key});

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  List<String> orders = [
    'Request List',
    'Pickup Process List',
    'Pickup Done List',
    'Report List'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pickup",
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
                Get.to(ProfileScreen());
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return StatefulBuilder(
                //         builder: (BuildContext context, StateSetter setState) {
                //       return Container(
                //         height: MediaQuery.of(context).size.height * 0.2,
                //         child: AlertDialog(
                //           contentPadding: EdgeInsets.zero,
                //           titleTextStyle: const TextStyle(
                //               fontSize: 14, color: Colors.black),
                //           content: Container(
                //             color: Constants.blue,
                //             width: MediaQuery.of(context).size.width,
                //             height: MediaQuery.of(context).size.height * 0.25,
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 10, vertical: 20),
                //             child: Column(
                //               //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                //               children: [
                //                 Container(
                //                   //  margin: EdgeInsets.symmetric(horizontal: 5),
                //                   padding: EdgeInsets.only(right: 10),
                //                   child: CircleAvatar(
                //                     radius: 37,
                //                     backgroundColor: Colors.white24,
                //                     child: CircleAvatar(
                //                       maxRadius: 35,
                //                       backgroundColor: Colors.black45,
                //                       child: Icon(
                //                         Icons.person,
                //                         size: 55,
                //                         color: Colors.white54,
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 20,
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       left: 15, right: 15),
                //                   child: Text(
                //                     "aung naing",
                //                     style: const TextStyle(
                //                         fontSize: 12, color: Colors.white70),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 3,
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(
                //                       left: 15, right: 15),
                //                   child: Text(
                //                     "Delivery Men",
                //                     style: const TextStyle(
                //                         fontSize: 12, color: Colors.white70),
                //                   ),
                //                 ),
                //                 SizedBox(
                //                   height: 3,
                //                 ),
                //                 Center(
                //                     child: Text(
                //                   'Delivery Management System',
                //                   style: TextStyle(
                //                       fontSize: 12, color: Colors.white70),
                //                 )),
                //               ],
                //             ),
                //           ),
                //           actions: [
                //             Container(
                //               // color: Colors.black12,
                //               padding: EdgeInsets.only(left: 8),
                //               child: Row(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   OutlinedButton(
                //                     // style: TextButton.styleFrom(
                //                     //     padding: const EdgeInsets.only(left: 70)),
                //                     onPressed: () {
                //                       Get.to(ProfileScreen());
                //                     },
                //                     child: Center(
                //                       child: const Text(
                //                         "Profile",
                //                         style: TextStyle(
                //                             color: Colors.black54,
                //                             fontSize: 12),
                //                       ),
                //                     ),
                //                   ),
                //                   OutlinedButton(
                //                     // style: TextButton.styleFrom(
                //                     //     padding: const EdgeInsets.only(left: 30)),
                //                     onPressed: () {
                //                       Get.to(() => LoginScreen());
                //                       // Get.back();
                //                     },
                //                     child: Center(
                //                       child: const Text("Sign out",
                //                           style: TextStyle(
                //                               color: Colors.black54,
                //                               fontSize: 12)),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             )
                //           ],
                //         ),
                //       );
                //     });
                //   },
                // );
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
          children: [_buildPickupTile()],
        )
        //  ListView.builder(
        //     itemCount: 1,
        //     itemBuilder: ((context, index) {
        //       return _buildPickupTile(orders[index]);
        //     }))
        );
  }

  Container _buildPickupTile() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          InkWell(
            onTap: (() => Get.to(PickupRequestList())),
            child: Card(
              color: Colors.blueAccent,
              child: ListTile(
                title: Text(
                  'Request List',
                  style: TextStyle(
                      fontSize: Constants.tDefaultSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: InkWell(
                    onTap: (() => Get.to(PickupRequestList())),
                    child: Icon(Icons.circle_outlined)),
              ),
            ),
          ),
          InkWell(
            onTap: (() => Get.to(PickupProcess())),
            child: Card(
              color: Colors.green,
              child: ListTile(
                title: Text(
                  'Pickup Process List',
                  style: TextStyle(
                      fontSize: Constants.tDefaultSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.circle_outlined),
              ),
            ),
          ),
          InkWell(
            onTap: (() => Get.to(PickupDoneList())),
            child: Card(
              color: Constants.red,
              child: ListTile(
                title: Text(
                  'Pickup Done List',
                  style: TextStyle(
                      fontSize: Constants.tDefaultSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.circle_outlined),
              ),
            ),
          ),
          InkWell(
            onTap: (() => Get.to(ReportList())),
            child: Card(
              color: Colors.grey,
              child: ListTile(
                title: Text(
                  'Report List',
                  style: TextStyle(
                      fontSize: Constants.tDefaultSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.circle_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
