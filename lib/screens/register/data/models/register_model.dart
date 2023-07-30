import 'package:shopping_list/screens/register/domain/entities/register_entity.dart';

class RegisterModel {

  final String email;
  final String password;

  const RegisterModel({
    required this.email,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'],
    );
  }

  RegisterEntity toEntity() {
    return RegisterEntity(
      email: email,
      password: password,
    );
  }
}