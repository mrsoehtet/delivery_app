import 'package:collection/collection.dart';
import '../model/pickupRequest/request/request.dart';

List<Request> nullList = [];
List<Request> notnullList = [];

Map<String?, List<Request>>? categoryData;
List<String?> categoryList = [];
void groupPickup(List<Request> pickup) {
  final groups = groupBy(pickup, (Request r) {
    return r.status;
  });
  categoryData = groups;
  categoryList = groups.keys.toList();
  print(categoryList);

  for (var i = 0; i < categoryList.length; i++) {
    if (categoryList[i] == null) {
      nullList.addAll(categoryData![categoryList[i]]!);
    } else {
      notnullList.addAll(categoryData![categoryList[i]]!);
    }
  }
}
