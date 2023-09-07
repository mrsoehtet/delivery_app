import 'package:flutter/cupertino.dart';

class RemoveProvider with ChangeNotifier {
  final List<dynamic> _myList = [];
  List<dynamic> get myList => _myList;

  void addToList(String data) {
    _myList.add(data);
    notifyListeners();
  }
  void removeToList(String data) {
    _myList.remove(data);
    notifyListeners();
  }
}
