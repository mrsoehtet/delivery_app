import 'dart:collection';
import 'package:get/get.dart';

class NaviController extends GetxController {
  static NaviController get to => Get.find();
  var navigationQueue = ListQueue<int>().obs;

  var currentIndex = 0.obs;

  void addQueueLastToIndexandRemoveLastIndex() {
    currentIndex = navigationQueue.value.last.obs;
    navigationQueue.value.removeLast();
  }

  void addIndexToQueueLast(int index) {
    navigationQueue.value.addLast(index);
  }

  // Widget get currentPage => pages[currentIndex.value];

  void changePage(int _index) {
    currentIndex.value = _index;
  }
}


// import 'dart:collection';
// import 'package:get/get.dart';

// class NaviController extends GetxController {
//   static NaviController get to => Get.find();
//   var navigationQueue = ListQueue<int>().obs;

//   var currentIndex = 0.obs;

//   void addQueueLastToIndexandRemoveLastIndex() {
//     currentIndex = navigationQueue.value.last.obs;
//     navigationQueue.value.removeLast();
//   }

//   void addIndexToQueueLast(int index) {
//     navigationQueue.value.addLast(index);
//   }

//   // Widget get currentPage => pages[currentIndex.value];

//   void changePage(int _index) {
//     currentIndex.value = _index;
//   }
// }
