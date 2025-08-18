import 'package:json_annotation/json_annotation.dart';
part 'saved_car_response_model.g.dart';

@JsonSerializable()
class SavedCarResponseModel {
  List<Value>? value;
  int? status;
  bool? isSuccess;
  String? successMessage;
  String? correlationId;
  List<dynamic>? errors;
  List<dynamic>? validationErrors;

  SavedCarResponseModel({
    this.value,
    this.status,
    this.isSuccess,
    this.successMessage,
    this.correlationId,
    this.errors,
    this.validationErrors,
  });

  factory SavedCarResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SavedCarResponseModelFromJson(json);
}

@JsonSerializable()
class Value {
  List<String>? images;
  String? thumbnailImage;
  String? description;
  int? year;
  String? color;
  int? price;
  String? plateNumber;
  int? maxSpeed;
  int? seats;
  int? luggage;
  bool? isActive;
  int? transmission;
  int? carSize;
  int? brandId;
  int? modelId;
  int? typeId;
  int? categoryId;
  int? fuelId;
  int? id;

  Value({
    this.images,
    this.thumbnailImage,
    this.description,
    this.year,
    this.color,
    this.price,
    this.plateNumber,
    this.maxSpeed,
    this.seats,
    this.luggage,
    this.isActive,
    this.transmission,
    this.carSize,
    this.brandId,
    this.modelId,
    this.typeId,
    this.categoryId,
    this.fuelId,
    this.id,
  });
  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}
