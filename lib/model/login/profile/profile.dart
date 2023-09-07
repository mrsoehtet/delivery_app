import 'package:delivery_app/model/login/login/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile.freezed.dart';
part 'profile.g.dart';


@freezed
class Profile with _$Profile {
  const factory Profile(
    String? status,
    User? user,
    String? token,
  ) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
