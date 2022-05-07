import 'package:json_annotation/json_annotation.dart';
part 'to_register.g.dart';

@JsonSerializable()
class ToRegister {
  String username;
  String phone;
  String password;
  ToRegister({required this.username, required this.phone, required this.password});
  Map<String, dynamic> toJson() => _$ToRegisterToJson(this);
}
