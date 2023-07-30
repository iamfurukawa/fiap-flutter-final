import 'package:shopping_list/screens/sign_in/domain/entities/sign_in_entity.dart';

class SignInModel {

  final String email;
  final String password;

  const SignInModel({
    required this.email,
    required this.password,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'],
      password: json['password'],
    );
  }

  SignInEntity toEntity() {
    return SignInEntity(
      email: email,
      password: password,
    );
  }
}