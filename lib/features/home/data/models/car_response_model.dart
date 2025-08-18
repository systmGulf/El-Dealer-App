import 'package:json_annotation/json_annotation.dart';
part 'car_response_model.g.dart';

@JsonSerializable()
class CarsResponseModel {
  Value? value;
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
  int? totalCount;
  List<Items>? items;

  Value({this.totalCount, this.items});

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

@JsonSerializable()
class Items {
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
  int? transmission;
  int? carSize;
  Brand? brand;
  Model? model;
  Category? category;
  Category? type;
  Category? fuel;
  int? id;

  Items({
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
    this.transmission,
    this.carSize,
    this.brand,
    this.model,
    this.category,
    this.type,
    this.fuel,
    this.id,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@JsonSerializable()
class Brand {
  String? name;
  String? logo;
  int? id;

  Brand({this.name, this.logo, this.id});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
}

@JsonSerializable()
class Model {
  String? name;
  int? brandId;
  int? id;

  Model({this.name, this.brandId, this.id});

  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
}

@JsonSerializable()
class Category {
  String? name;
  int? id;

  Category({this.name, this.id});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
