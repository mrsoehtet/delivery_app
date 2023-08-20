import 'package:delivery_app/screen/login.dart';
import 'package:delivery_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/getController.dart';
import '../model/order.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
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
                                    // Get.to(LoginScreen());
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
      //   drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "aung naing's Dashboard",
              style: TextStyle(
                fontSize: 20,
                // color: Colors.white,
              ),
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
                  ' Dashboard >',
                  style: TextStyle(fontSize: 12),
                ),
              ]),
            ),
            SingleChildScrollView(
              child: Expanded(
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.326,
                  margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                  child: InkWell(
                    //onTap: () => Get.to(DailyChoice()),
                    child: GridView.builder(
                        itemCount: orders.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 1.200,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 12,
                                crossAxisCount: 2),
                        itemBuilder: ((context, index) =>
                            _buildGiftCard(orders[index]))),
                  ),
                ),
              ),
            ),
            Card(
              child: Container(
                width: double.infinity,
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
                          style: TextStyle(fontSize: 16),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    // color: Constants.gray,
                    child: DataTable(
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
                            label: Center(
                          child: Text(
                            "#",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )),
                        DataColumn(
                            label: Center(
                          child: Text(
                            "Assign\n Date",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        )),
                        DataColumn(
                            label: Text(
                          "Pickup\nInfo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),
                        DataColumn(
                            label: Text(
                          "Can\nPickup\nDate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),
                        DataColumn(
                            label: Text(
                          "Ways",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),
                        DataColumn(
                            label: Text(
                          "Status",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),
                        DataColumn(
                            label: Text(
                          "Action",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        )),
                      ],
                      rows: orders!.map((order) {
                        return DataRow(cells: [
                          DataCell(Container(
                            padding: EdgeInsets.only(left: 5),
                            //  color: Colors.white,
                            child: Text(
                              '',
                            ),
                          )),
                          DataCell(Text(
                            'aaa',
                          )),
                          DataCell(Text('bbb')),
                          DataCell(Text('ccc')),
                          DataCell(Text('ccc')),
                          DataCell(Text('ccc')),
                          DataCell(
                              Text(
                                "ddd",
                                style: TextStyle(
                                    // color: Colors.blue,
                                    ),
                              ), onTap: () {
                            // Get.to(() => OrderDetailScreen(
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

  _buildGiftCard(Order order) {
    return InkWell(
      onTap: () {
        // Get.to(() => DailyChoice());
      },
      child: Container(
        // width: MediaQuery.of(context).size.height * 0.3,
        // height: MediaQuery.of(context).size.height * 0.3,
        child: Card(
          elevation: 5,
          //shadowColor: Colors.transparent,
          color: order.color,
          // shadowColor: Colors.black,
          child: Container(
            padding: EdgeInsets.only(top: 15),
            child: Column(children: [
              Text(
                order.id.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),

              // Divider(
              //   color: CustomColor.black,
              // ),

              Text(
                // '3D',
                order.pickup,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                height: 15,
              ),

              // Container(
              //   //   padding: EdgeInsets.only(top: 1),
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //           backgroundColor: Colors.transparent),
              //       onPressed: () {
              //         // Get.to(HomePage());
              //       },
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "More Info",
              //             style: TextStyle(fontSize: 15),
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Icon(
              //             Icons.arrow_forward_outlined,
              //             size: 20,
              //           )
              //         ],
              //       )),
              // )
              Container(
                width: double.infinity,
                height: 25,
                padding: EdgeInsets.only(left: 16, top: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4)),
                    color: Colors.black26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "More Info",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
