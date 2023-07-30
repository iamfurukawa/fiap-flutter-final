import 'package:shopping_list/screens/sign_in/domain/entities/sign_in_entity.dart';

abstract class SignInService {
  Future<void> signIn(SignInEntity signIn);
}