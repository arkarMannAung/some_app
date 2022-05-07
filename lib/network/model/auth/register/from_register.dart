import 'package:json_annotation/json_annotation.dart';
part 'from_register.g.dart';

@JsonSerializable()
class FromRegister {
  int code;
  String message;
  int status;
  FromRegister(this.code,this.message,this.status);
  factory FromRegister.fromJson( Map<String,dynamic> json ) => _$FromRegisterFromJson(json);
}