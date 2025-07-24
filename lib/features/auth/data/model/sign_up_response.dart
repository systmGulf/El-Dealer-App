import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  Value? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  SignUpResponse({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class Value {
  String? token;
  String? id;
  String? name;
  String? email;
  dynamic? phoneNumber;
  dynamic? image;

  Value({
    this.token,
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.image,
  });

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}
