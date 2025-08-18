// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_car_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedCarResponseModel _$SavedCarResponseModelFromJson(
  Map<String, dynamic> json,
) => SavedCarResponseModel(
  value:
      (json['value'] as List<dynamic>?)
          ?.map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
  status: (json['status'] as num?)?.toInt(),
  isSuccess: json['isSuccess'] as bool?,
  successMessage: json['successMessage'] as String?,
  correlationId: json['correlationId'] as String?,
  errors: json['errors'] as List<dynamic>?,
  validationErrors: json['validationErrors'] as List<dynamic>?,
);

Map<String, dynamic> _$SavedCarResponseModelToJson(
  SavedCarResponseModel instance,
) => <String, dynamic>{
  'value': instance.value,
  'status': instance.status,
  'isSuccess': instance.isSuccess,
  'successMessage': instance.successMessage,
  'correlationId': instance.correlationId,
  'errors': instance.errors,
  'validationErrors': instance.validationErrors,
};

Value _$ValueFromJson(Map<String, dynamic> json) => Value(
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
  isActive: json['isActive'] as bool?,
  transmission: (json['transmission'] as num?)?.toInt(),
  carSize: (json['carSize'] as num?)?.toInt(),
  brandId: (json['brandId'] as num?)?.toInt(),
  modelId: (json['modelId'] as num?)?.toInt(),
  typeId: (json['typeId'] as num?)?.toInt(),
  categoryId: (json['categoryId'] as num?)?.toInt(),
  fuelId: (json['fuelId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
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
  'isActive': instance.isActive,
  'transmission': instance.transmission,
  'carSize': instance.carSize,
  'brandId': instance.brandId,
  'modelId': instance.modelId,
  'typeId': instance.typeId,
  'categoryId': instance.categoryId,
  'fuelId': instance.fuelId,
  'id': instance.id,
};
