import 'package:shopping_list/screens/sign_in/domain/entities/sign_in_entity.dart';
import 'package:shopping_list/screens/sign_in/domain/use_cases/sign_in_service.dart';
import 'package:shopping_list/screens/sign_in/domain/utils/domain_errors.dart';

class SignInServiceImpl implements SignInService {

  @override
  Future<void> signIn(SignInEntity signIn) async {
    //throw DomainError.timeOut;

    await Future.delayed(const Duration(seconds: 2));
  }
  
}