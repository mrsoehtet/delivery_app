import 'package:delivery_app/error/errorScreen.dart';
import 'package:delivery_app/screen/pickup/request/pickupRequestDetail.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/service/pickupRequestService.dart';
import 'package:delivery_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../controller/getController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? requestid;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  var orders = Get.find<OrderController>().orders;
  var _remove;
  var assignCount = 0;

  @override
  void initState() {
    _remove = true;
    assignCount;
    super.initState();
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
      //   drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Consumer(builder: (context, ref, child) {
          return Container(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                // width: MediaQuery.of(context).size.width * 0.95,
                height: 40,
                decoration: BoxDecoration(color: Constants.gray),
                child: Row(children: [
                  Icon(
                    Icons.person,
                    size: 30,
                  ),
                  Text(
                    "aung naing's Dashboard",
                    style: TextStyle(fontSize: 18),
                  ),
                  // Text(
                  //   ' Dashboard >',
                  //   style: TextStyle(fontSize: 12),
                  // ),
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                margin: EdgeInsets.symmetric(vertical: 16, horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildGiftCard(
                            1, "Pickup\n(Assigned)", Constants.realRed),
                        _buildGiftCard(0, "Pickup Process", Constants.yellow),
                        _buildGiftCard(
                            0, "Delivery Process", Constants.realBlue),
                        _buildGiftCard(0, "Total Done", Constants.green),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
              _remove
                  ? Card(
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
                                    InkWell(
                                      onTap: () {
                                        setState(() {});
                                        _remove = !_remove;
                                      },
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
                            for (var i = 0; i < requestList.data!.length; i++) {
                              if (requestList.data![i]!.status == "Assigned") {
                                setState(() {
                                  assignCount += 1;
                                });
                              }
                            }
                            return requestList.data!.isNotEmpty
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.45,
                                    // color: Constants.gray,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: DataTable(
                                          headingRowColor:
                                              MaterialStateProperty.all(
                                                  Constants.gray),
                                          dataRowColor:
                                              MaterialStateProperty.all(
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
                                                label: Center(
                                              child: Text(
                                                "#",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize:
                                                      Constants.tDefaultSize,
                                                ),
                                              ),
                                            )),
                                            DataColumn(
                                                label: Center(
                                              child: Text(
                                                "Assign Date",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize:
                                                      Constants.tDefaultSize,
                                                ),
                                              ),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              "Pickup Info",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Constants.tDefaultSize,
                                              ),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              "",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Constants.tDefaultSize,
                                              ),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              "",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Constants.tDefaultSize,
                                              ),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              "",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Constants.tDefaultSize,
                                              ),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              "Can Pickup Date",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Constants.tDefaultSize,
                                              ),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              "Ways",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Constants.tDefaultSize,
                                              ),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              "Status",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Constants.tDefaultSize,
                                              ),
                                            )),
                                            DataColumn(
                                                label: Text(
                                              "Action",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize:
                                                    Constants.tDefaultSize,
                                              ),
                                            )),
                                          ],
                                          //rows: orders!.map((order) {
                                          rows:
                                              requestList.data!.map((request) {
                                            return
                                                // request!.status == null?
                                                DataRow(cells: [
                                              DataCell(Container(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  (requestList.data!.indexOf(
                                                              request) +
                                                          1)
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize:
                                                          Constants.tSmallSize),
                                                ),
                                              )),
                                              DataCell(Text(
                                                request.assign_date!,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )),
                                              DataCell(Text(
                                                request!.name!,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )),
                                              DataCell(Text(
                                                request!.phone!,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )),
                                              DataCell(Text(
                                                request!.address!,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              )),
                                              DataCell(Text(
                                                //'done',
                                                request!.township!,
                                                style: TextStyle(
                                                  fontSize:
                                                      Constants.tSmallSize,
                                                ),
                                              )),
                                              DataCell(Text(
                                                //'done',
                                                request!.can_pickup_date!,
                                                style: TextStyle(
                                                  fontSize:
                                                      Constants.tSmallSize,
                                                ),
                                              )),
                                              DataCell(
                                                  request!.no_of_way != null
                                                      ? Text(
                                                          request.no_of_way!,
                                                          style: TextStyle(
                                                            fontSize: Constants
                                                                .tSmallSize,
                                                          ),
                                                        )
                                                      : Container()),
                                              DataCell(request.status != null
                                                  ? Text(
                                                      //'done',
                                                      request.status!,
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize,
                                                          color:
                                                              Constants.blue),
                                                    )
                                                  : Text(
                                                      'Assigned',
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize,
                                                          color:
                                                              Constants.blue),
                                                    )),
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
                                              )
                                            ]);
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          }, error: (Object error, StackTrace stackTrace) {
                            return ErrorScreen(
                              aspectR: 1,
                              iconSize: 100,
                              textSize: 18,
                              profile: true,
                            );
                          }, loading: () {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                          // Divider(),
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
                        ]),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              )
            ]),
          );
        }),
      ),
    );
  }

  _buildGiftCard(int id, String name, Color color) {
    return InkWell(
      onTap: () {
        // Get.to(() => DailyChoice());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.22,
        height: MediaQuery.of(context).size.height * 0.115,
        child: Card(
          elevation: 5,
          //shadowColor: Colors.transparent,
          //color: order.color,
          color: color,
          // shadowColor: Colors.black,
          child: Container(
            padding: EdgeInsets.only(top: 3),
            child: Column(children: [
              Text(
                // order.id.toString(),
                id.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                // '3D',
                // order.pickup,
                name,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                height: 15,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
