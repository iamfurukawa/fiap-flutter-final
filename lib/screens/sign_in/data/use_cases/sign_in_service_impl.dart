import 'package:shopping_list/screens/sign_in/domain/entities/sign_in_entity.dart';
import 'package:shopping_list/screens/sign_in/domain/use_cases/sign_in_service.dart';

class SignInServiceImpl implements SignInService {

  @override
  Future<void> signIn(SignInEntity signIn) async {
    await Future.delayed(const Duration(seconds: 2));
  }
  
}