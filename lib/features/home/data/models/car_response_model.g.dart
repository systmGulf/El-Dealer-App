// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarsResponseModel _$CarsResponseModelFromJson(Map<String, dynamic> json) =>
    CarsResponseModel(
      value:
          json['value'] == null
              ? null
              : Value.fromJson(json['value'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      isSuccess: json['isSuccess'] as bool?,
      successMessage: json['successMessage'] as String?,
      correlationId: json['correlationId'] as String?,
      errors: json['errors'] as List<dynamic>?,
      validationErrors: json['validationErrors'] as List<dynamic>?,
    );

Map<String, dynamic> _$CarsResponseModelToJson(CarsResponseModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'status': instance.status,
      'isSuccess': instance.isSuccess,
      'successMessage': instance.successMessage,
      'correlationId': instance.correlationId,
      'errors': instance.errors,
      'validationErrors': instance.validationErrors,
    };

Value _$ValueFromJson(Map<String, dynamic> json) => Value(
  totalCount: (json['totalCount'] as num?)?.toInt(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
  'totalCount': instance.totalCount,
  'items': instance.items,
};

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  thumbnailImage: json['thumbnailImage'] as String?,
  description: json['description'] as String?,
  year: (json['year'] as num?)?.toInt(),
  color: json['color'] as String?,
  price: (json['price'] as num?)?.toInt(),
  plateNumber: json['plateNumber'] as String?,
  maxSpeed: (json['maxSpeed'] as num?)?.toInt(),
  seats: (json['seats'] as num?)?.toInt(),
  luggage: (json['luggage'] as num?)?.toInt(),
  transmission: (json['transmission'] as num?)?.toInt(),
  carSize: (json['carSize'] as num?)?.toInt(),
  brand:
      json['brand'] == null
          ? null
          : Brand.fromJson(json['brand'] as Map<String, dynamic>),
  model:
      json['model'] == null
          ? null
          : Model.fromJson(json['model'] as Map<String, dynamic>),
  category:
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
  type:
      json['type'] == null
          ? null
          : Category.fromJson(json['type'] as Map<String, dynamic>),
  fuel:
      json['fuel'] == null
          ? null
          : Category.fromJson(json['fuel'] as Map<String, dynamic>),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
  'images': instance.images,
  'thumbnailImage': instance.thumbnailImage,
  'description': instance.description,
  'year': instance.year,
  'color': instance.color,
  'price': instance.price,
  'plateNumber': instance.plateNumber,
  'maxSpeed': instance.maxSpeed,
  'seats': instance.seats,
  'luggage': instance.luggage,
  'transmission': instance.transmission,
  'carSize': instance.carSize,
  'brand': instance.brand,
  'model': instance.model,
  'category': instance.category,
  'type': instance.type,
  'fuel': instance.fuel,
  'id': instance.id,
};

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
  name: json['name'] as String?,
  logo: json['logo'] as String?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
  'name': instance.name,
  'logo': instance.logo,
  'id': instance.id,
};

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
  name: json['name'] as String?,
  brandId: (json['brandId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
  'name': instance.name,
  'brandId': instance.brandId,
  'id': instance.id,
};

Category _$CategoryFromJson(Map<String, dynamic> json) =>
    Category(name: json['name'] as String?, id: (json['id'] as num?)?.toInt());

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'name': instance.name,
  'id': instance.id,
};
