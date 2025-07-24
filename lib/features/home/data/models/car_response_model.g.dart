// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarsResponseModel _$CarsResponseModelFromJson(Map<String, dynamic> json) =>
    CarsResponseModel(
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      model: json['model'] as String?,
      version: (json['version'] as num?)?.toInt(),
      plateNumber: json['plateNumber'] as String?,
      color: json['color'] as String?,
      pricePerHour: (json['pricePerHour'] as num?)?.toInt(),
      pricePerDay: (json['pricePerDay'] as num?)?.toInt(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      brandId: (json['brandId'] as num?)?.toInt(),
      description: json['description'],
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'model': instance.model,
      'version': instance.version,
      'plateNumber': instance.plateNumber,
      'color': instance.color,
      'pricePerHour': instance.pricePerHour,
      'pricePerDay': instance.pricePerDay,
      'images': instance.images,
      'brandId': instance.brandId,
      'description': instance.description,
      'id': instance.id,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      filePath: json['filePath'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'filePath': instance.filePath,
    };
