import 'dart:ui';

class Order {
  int id;
  String pickup;
  Color color;

  Order({required this.id, required this.pickup, required this.color});

  factory Order.fromJson(dynamic data) {
    return Order(id: data['id'], pickup: data['pickup'], color: data['color']);
  }
}
