import 'package:delivery_app/screen/pickup/request/pickupRequestDetail.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../controller/getController.dart';
import '../../../utils/theme.dart';
import '../../login.dart';

class TransferToWHDetail extends StatefulWidget {
  const TransferToWHDetail({super.key});

  @override
  State<TransferToWHDetail> createState() => _TransferToWHDetailState();
}

class _TransferToWHDetailState extends State<TransferToWHDetail> {
  var orders = Get.find<OrderController>().orders;

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(children: [
            Row(
              children: [
                Text(
                  "Packages",
                  style: TextStyle(
                    fontSize: 20,
                    // color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Details",
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
                  ' Packages >',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  ' Detail',
                  style: TextStyle(fontSize: 12),
                ),
              ]),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
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
                          'Package ID : 26',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold
                              //color: Constants.red
                              ),
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
                            Icon(
                              Icons.cancel,
                              color: Colors.grey[500],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'WH :: YGN WAREHOUSE',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Text(
                                  ':: DATE TIME',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'TWH :: MLM WAREHOUSE',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 55,
                                ),
                                Text(
                                  '26-08-2023\n05:56 PM',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              'DE :: AUNG NAING',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.31,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    // color: Constants.gray,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        DataTable(
                          headingRowColor:
                              MaterialStateProperty.all(Constants.gray),
                          dataRowColor: MaterialStateProperty.all(Colors.white),
                          decoration: BoxDecoration(
                              //color: Colors.grey
                              ),
                          horizontalMargin: 8,
                          columnSpacing: 18,
                          border: TableBorder.all(color: Colors.black12),
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
                              "Track Code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: Constants.tDefaultSize,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "Order Date",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: Constants.tDefaultSize,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "From",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: Constants.tDefaultSize,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              "To",
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
                              "Item",
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
                              "Note",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: Constants.tDefaultSize,
                              ),
                            )),
                          ],
                          rows: orders!.map((order) {
                            return DataRow(cells: [
                              DataCell(Container(
                                padding: EdgeInsets.only(left: 5),
                                //  color: Colors.white,
                                child: Text(
                                  '1',
                                  style:
                                      TextStyle(fontSize: Constants.tSmallSize),
                                ),
                              )),
                              DataCell(Text(
                                '11-230014-12',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                              DataCell(Text(
                                '21-08-2023 01:23 am',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                              DataCell(Text(
                                'Client Name',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                              DataCell(Text(
                                'Ko lha',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                              DataCell(Text(
                                '09200300050,testing address, Mawlamyine',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                              DataCell(Text(
                                'Mon',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                              DataCell(Text(
                                'testin item(1) 1.00Kg',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                              DataCell(Text(
                                '',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                              DataCell(Text(
                                'testing',
                                style:
                                    TextStyle(fontSize: Constants.tSmallSize),
                              )),
                            ]);
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
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
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
