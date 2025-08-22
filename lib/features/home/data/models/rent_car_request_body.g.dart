// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rent_car_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RentCarRequestBody _$RentCarRequestBodyFromJson(Map<String, dynamic> json) =>
    RentCarRequestBody(
      startDateTime: json['startDateTime'] as String,
      endDateTime: json['endDateTime'] as String,
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      carId: (json['carId'] as num).toInt(),
    );

Map<String, dynamic> _$RentCarRequestBodyToJson(RentCarRequestBody instance) =>
    <String, dynamic>{
      'startDateTime': instance.startDateTime,
      'endDateTime': instance.endDateTime,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'carId': instance.carId,
    };
