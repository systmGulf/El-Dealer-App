import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
  // PARSE TO JSON
  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
