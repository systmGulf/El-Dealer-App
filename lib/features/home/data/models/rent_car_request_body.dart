import 'package:json_annotation/json_annotation.dart';
part 'rent_car_request_body.g.dart';

@JsonSerializable()
class RentCarRequestBody {
  final String startDateTime;
  final String endDateTime;
  final String fullName;
  final String phoneNumber;
  final String email;
  final int carId;

  RentCarRequestBody({
    required this.startDateTime,
    required this.endDateTime,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.carId,
  });
  Map<String, dynamic> toJson() => _$RentCarRequestBodyToJson(this);
}
