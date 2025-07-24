import 'package:json_annotation/json_annotation.dart';
part 'car_response_model.g.dart';

@JsonSerializable()
class CarsResponseModel {
  List<Value>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  CarsResponseModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });
  factory CarsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CarsResponseModelFromJson(json);
}

@JsonSerializable()
class Value {
  String? model;
  int? version;
  String? plateNumber;
  String? color;
  int? pricePerHour;
  int? pricePerDay;
  List<Images>? images;
  int? brandId;
  dynamic? description;
  int? id;

  Value({
    this.model,
    this.version,
    this.plateNumber,
    this.color,
    this.pricePerHour,
    this.pricePerDay,
    this.images,
    this.brandId,
    this.description,
    this.id,
  });

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

@JsonSerializable()
class Images {
  String? filePath;

  Images({this.filePath});

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}
