import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User(
    int? id,
    String? full_name,
    String? login_name,
    String? password,
    String? phone,
    String? address,
    String? state,
    String? township,
    String? zone,
    String? branch_id,
    String? created_at,
    String? updated_at,
  ) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
/*
 
  "id": 1,
        "full_name": "aung naing",
        "User_name": "deli men",
        "password": "$2y$10$RTno3ITY9PH9I1H0vmzszur8hMk/F14wlc8ujtYVxYBWTXAcJldV.",
        "phone": "09421011451",
        "address": "next change address",
        "state": "12",
        "township": "Ahlone",
        "zone": null,
        "branch_id": "3",
        "created_at": "2022-12-12T21:34:34.000000Z",
        "updated_at": "2023-04-19T01:04:10.000000Z"
 */