import 'package:json_annotation/json_annotation.dart';
part 'brand_response_model.g.dart';

@JsonSerializable()
class BrandResponseModel {
  List<Value>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  BrandResponseModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory BrandResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseModelFromJson(json);
}

@JsonSerializable()
class Value {
  String? name;
  String? logo;
  int? id;

  Value({this.name, this.logo, this.id});

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}
