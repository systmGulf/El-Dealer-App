// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandResponseModel _$BrandResponseModelFromJson(Map<String, dynamic> json) =>
    BrandResponseModel(
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

Map<String, dynamic> _$BrandResponseModelToJson(BrandResponseModel instance) =>
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
      name: json['name'] as String?,
      logo: json['logo'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ValueToJson(Value instance) => <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'id': instance.id,
    };
