import 'package:delivery_app/controller/naviController.dart';
import 'package:delivery_app/screen/pickup/process/pickupProcess.dart';
import 'package:delivery_app/screen/profile.dart';
import 'package:delivery_app/service/orderDetailService.dart';
import 'package:delivery_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/getController.dart';
import '../../../utils/theme.dart';
import '../../login.dart';

class GetWayDetail extends StatefulWidget {
  final String id;

  const GetWayDetail({super.key, required this.id});

  @override
  State<GetWayDetail> createState() => _GetWayDetailState();
}

class _GetWayDetailState extends State<GetWayDetail> {
  var _remove;
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

  @override
  void initState() {
    //_refresh();
    _remove = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // ref.invalidate(pickupWaysServiceProvider(widget.id));
    });
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

    return WillPopScope(
      onWillPop: () {
        Get.back(result: true);
        return Future(() => true);
      },
      child: Scaffold(
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
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
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
                      "Order Detail",
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
                      ' Delimen >',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      ' Order Detail',
                      style: TextStyle(fontSize: 12),
                    ),
                  ]),
                ),
                SizedBox(
                  height: 16,
                ),
                ref.watch(orderDetailProvider(widget.id)).when(
                    data: (orderDetailList) {
                  String apiDateString =
                      "${orderDetailList!.order!.created_at!}"; // Replace this with your API date
                  DateTime apiDate = DateTime.parse(apiDateString);
                  String formattedDate =
                      DateFormat('dd-MM-yyyy H:m a').format(apiDate);
                  print(formattedDate);

                  String orderApiDate =
                      "${orderDetailList!.order!.created_at!}"; // Replace this with your API date
                  DateTime orderDate = DateTime.parse(orderApiDate);
                  String lastOrderDate =
                      DateFormat('dd-MM-yyyy a').format(orderDate);
                  return _remove
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
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order Code :: ${orderDetailList.order!.order_code!}',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              //  'Created Date :: 21-08-2023 01:22 PM:',
                                              'Created Date :: $formattedDate',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                            // Text(
                                            //   'Done',
                                            //   style: TextStyle(
                                            //       fontSize: 12,
                                            //       color: Constants.green),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: Row(
                                        children: [
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
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Pickup Info',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Constants.blue),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black12)),
                                      child: Column(children: [
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Client (${orderDetailList.client_code!.code})   :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                orderDetailList
                                                    .order!.from_name!,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //  color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Phone   :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                orderDetailList
                                                    .order!.from_phone!,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Address  :  ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                orderDetailList
                                                    .order!.from_addres!,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'State  :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                orderDetailList
                                                    .order!.from_township!,
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Destination Info',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Constants.green),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black12)),
                                      child: Column(children: [
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Receiver  :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              orderDetailList.order!.to_name !=
                                                      null
                                                  ? Text(
                                                      orderDetailList
                                                          .order!.to_name!,
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //  color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              //   orderDetailList.order!.to_phone !=null?

                                              Text(
                                                'Phone  :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              orderDetailList.order!.to_phone !=
                                                      null
                                                  ? Text(
                                                      orderDetailList
                                                          .order!.to_phone!,
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Address  :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              orderDetailList
                                                          .order!.to_address !=
                                                      null
                                                  ? Text(
                                                      orderDetailList
                                                          .order!.to_address!,
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'State  :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              orderDetailList
                                                          .order!.to_township !=
                                                      null
                                                  ? Text(
                                                      orderDetailList
                                                          .order!.to_township!,
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Parcel Info',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Constants.yellow),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black12)),
                                      child: Column(children: [
                                        Container(
                                          // color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Item Info :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              orderDetailList
                                                          .order!.item_info !=
                                                      null
                                                  ? Text(
                                                      orderDetailList
                                                          .order!.item_info!,
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Container(
                                          //  color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Dimension (CM)  :',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              orderDetailList.order!.width !=
                                                      null
                                                  ? Text(
                                                      '${orderDetailList.order!.width!} * ${orderDetailList.order!.height!} * ${orderDetailList.order!.length!} ',
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize),
                                                    )
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          width: 200,
                                          height: 200,
                                          child: Image(
                                              image: NetworkImage(
                                            // 'https://newbrdemo.icgwebdevelopment.com/${orderDetailList.image_url}/${orderDetailList.order!.photo_1}',
                                            'https://newbr.icgwebdevelopment.com/${orderDetailList.image_url}/${orderDetailList.order!.photo_1}',
                                          )),
                                        ),
                                        SizedBox(
                                          height: 40,
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Pricing Detail',
                                        style: TextStyle(
                                            fontSize: 16, color: Constants.red),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black12)),
                                      child: Column(children: [
                                        Container(
                                          color: Colors.red[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Description',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '          Price',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                'Total',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Item Amount',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              orderDetailList
                                                          .order!.item_amount !=
                                                      null
                                                  ? Text(
                                                      orderDetailList
                                                          .order!.item_amount!,
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize),
                                                    )
                                                  : Text(
                                                      '0',
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .tSmallSize),
                                                    ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //  color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Delivery Fee',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '  ${orderDetailList.order!.deli_fee}',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Pickup Fee',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '  ${orderDetailList.order!.puckup_fee!}',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Total Service\n Amount',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                ' ${orderDetailList.order!.service_total!}',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Net Total',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '                           ${orderDetailList.order!.net_total!}',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '${orderDetailList.order!.net_total!} Ks',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Payment : Pay Sender',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Constants.blue,
                                                  fontSize:
                                                      Constants.tSmallSize,
                                                ),
                                              ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                  fontSize:
                                                      Constants.tSmallSize,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.grey[200],
                                          padding: EdgeInsets.symmetric(
                                              vertical: 7, horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Remark :: ',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        Constants.tSmallSize,
                                                    color: Constants.red),
                                              ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                              Text(
                                                '',
                                                style: TextStyle(
                                                    fontSize:
                                                        Constants.tSmallSize),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Delivery Status (Tracking)',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.8,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Order Date :: $lastOrderDate',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black87),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Divider(),

                              SizedBox(
                                height: 10,
                              )
                            ]),
                          ),
                        )
                      : Container();
                }, error: (Object error, StackTrace stackTrace) {
                  return Text('$error');
                }, loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ]),
            );
          },
        )),
      ),
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
