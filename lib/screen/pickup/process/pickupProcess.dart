import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/screen/delivery/getWay/getWayDetail.dart';
import 'package:delivery_app/screen/pickup/process/pickupProcessDetails.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/service/orderDetailService.dart';
import 'package:delivery_app/service/pickupProcessService.dart';
import 'package:delivery_app/service/pickupRequestService.dart';
import 'package:delivery_app/utils/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/getController.dart';
import '../../../utils/theme.dart';
import '../../login.dart';

class PickupProcess extends StatefulWidget {
  const PickupProcess({super.key});

  @override
  State<PickupProcess> createState() => _PickupProcessState();
}

class _PickupProcessState extends State<PickupProcess> {
  String? orderid;
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

  TextEditingController countController = TextEditingController();
  FocusNode countFocusNode = FocusNode();
  List<String> items = ["30", "50", "100", "All"];
  String? value;
  var _remove;

  @override
  void initState() {
    _remove = true;
    // TODO: implement initState
    super.initState();
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
      body: SingleChildScrollView(child: Consumer(
        builder: ((context, ref, child) {
          //  final pickup = ref.watch(requestServiceProvider);
          return Container(
            margin: EdgeInsets.all(16),
            child: Column(children: [
              Row(
                children: [
                  Text(
                    "Pickup Process List",
                    style: TextStyle(
                      fontSize: 20,
                      // color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // Text(
                  //   "Pickup Process",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
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
              //       ' Pickup Process',
              //       style: TextStyle(fontSize: 12),
              //     ),
              //   ]),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              _remove
                  ? Card(
                      child: Container(
                        width: double.infinity,
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
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 8),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text(
                          //         'Order Request List',
                          //         style: TextStyle(
                          //             fontSize: 16, color: Constants.green),
                          //       ),
                          //       Row(
                          //         children: [
                          //           Icon(
                          //             Icons.remove,
                          //             color: Colors.grey[500],
                          //           ),
                          //           SizedBox(
                          //             width: 10,
                          //           ),
                          //           InkWell(
                          //             onTap: (() {
                          //               setState(() {
                          //                 _remove = !_remove;
                          //               });
                          //             }),
                          //             child: Icon(
                          //               Icons.cancel,
                          //               color: Colors.grey[500],
                          //             ),
                          //           )
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // Divider(),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       'Show',
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Container(
                          //       width: MediaQuery.of(context).size.width * 0.27,
                          //       height: 35,
                          //       margin: EdgeInsets.all(16),
                          //       decoration: BoxDecoration(
                          //           border: Border.all(color: Colors.grey)),
                          //       padding: EdgeInsets.symmetric(horizontal: 7),
                          //       child: DropdownButtonHideUnderline(
                          //         child: DropdownButton<String>(
                          //           value: value,
                          //           isExpanded: true,
                          //           items: items.map(buildMenuItem).toList(),
                          //           onChanged: (value) =>
                          //               setState(() => this.value = value),
                          //         ),
                          //       ),

                          //       // value: selecttownshipDetailPick,
                          //     ),
                          //     SizedBox(
                          //       width: 5,
                          //     ),
                          //     Text(
                          //       'entries',
                          //       style: TextStyle(
                          //         fontSize: 14,
                          //       ),
                          //     )
                          //   ],
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Search:',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.height * 0.2,
                                height: 35,
                                child: TextFormField(
                                  controller: countController,
                                  focusNode: countFocusNode,
                                  decoration: InputDecoration(
                                    // labelText: "user name",
                                    labelStyle: TextStyle(fontSize: 12),
                                    //  suffixIcon: Icon(Icons.person),
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      //  borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.black12,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      // borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        //  width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ref.watch(processServiceProvider).when(
                              data: (processList) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.57,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              // color: Constants.gray,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: DataTable(
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
                                        "Pickup Date",
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
                                    rows: processList.map((process) {
                                      String apiDateString =
                                          "${process!.picked_up_date_time!}"; // Replace this with your API date
                                      DateTime apiDate =
                                          DateTime.parse(apiDateString);
                                      String formattedDate =
                                          DateFormat('dd-MM-yyyy a')
                                              .format(apiDate);
                                      print(formattedDate);
                                      //rows: orders!.map((order) {
                                      return DataRow(cells: [
                                        DataCell(Container(
                                          padding: EdgeInsets.only(left: 5),
                                          child: Text(
                                            // '1',
                                            (processList.indexOf(process) + 1)
                                                .toString(),

                                            style: TextStyle(
                                                fontSize: Constants.tSmallSize),
                                          ),
                                        )),
                                        DataCell(Text(
                                          "$formattedDate",
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          process.order_code!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          process.from_name!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          process.from_phone!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          process.from_addres!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          process.from_township!,
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(Text(
                                          'Yangon',
                                          style: TextStyle(
                                              fontSize: Constants.tSmallSize),
                                        )),
                                        DataCell(process.status != null
                                            ? Text(
                                                'Picked Up',
                                                style: TextStyle(
                                                    color: Constants.blue,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )
                                            : Text('')),
                                        DataCell(
                                          Center(
                                            child: Container(
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
                                          onTap: (() async {
                                            setState(() {
                                              orderid = process.order_id!;
                                            });
                                            bool res = await Get.to(
                                                GetWayDetail(
                                                    id: orderid.toString()));
                                            print("Id Id Id $orderid");
                                            if (res) {
                                              ref.invalidate(
                                                  orderDetailProvider);
                                            }
                                          }),
                                          //      onTap: () {
                                          //   //  Get.to(() => PickupProcessDetail());
                                          //   (
                                          //     () async {
                                          //     setState(() {
                                          //       orderid = process.order_id;
                                          //     });

                                          //     bool res = await Get.to(
                                          //         GetWayDetail(
                                          //             id: orderid.toString()));
                                          //     print('++++++ $orderid ');
                                          //     if (res) {
                                          //       ref.invalidate(
                                          //           orderDetailProvider);
                                          //     }
                                          //   });
                                          // }
                                        )
                                      ]);
                                    }).toList(),
                                  ),
                                ),
                              ),
                            );
                          }, error: (Object error, StackTrace stackTrace) {
                            return Text('$error');
                          }, loading: () {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                          SizedBox(
                            height: 16,
                          ),

                          SizedBox(
                            height: 5,
                          ),

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
                      ),
                    )
                  : Container(),
            ]),
          );
        }),
      )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }
}
