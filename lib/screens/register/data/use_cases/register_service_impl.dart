import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list/screens/register/domain/entities/register_entity.dart';
import 'package:shopping_list/screens/register/domain/use_cases/register_service.dart';
import 'package:shopping_list/screens/register/domain/utils/domain_errors.dart';

class RegisterServiceImpl implements RegisterService {

  final authInstance = FirebaseAuth.instance;

  @override
  Future<void> register(RegisterEntity register) async {
    try {
      await authInstance.createUserWithEmailAndPassword(email: register.email.trim(), password: register.password.trim());
    } on FirebaseException catch (error) {
      switch (error.code) {
        case 'weak-password':
          throw DomainError.weakPassword;
        case 'invalid-email':
          throw DomainError.invalidEmail;
        case 'operation-not-allowed':
          throw DomainError.operationNotAllowed;
        case 'email-already-in-use':
          throw DomainError.emailAlreadyInUse;
        default:
          throw DomainError.failedToCreateUser;
      }
    }
  }

}