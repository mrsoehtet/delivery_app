class PickedUp {
  int id;
  PickedUp({required this.id});

  factory PickedUp.fromJson(dynamic data) {
    return PickedUp(id: data['id']);
  }
}
