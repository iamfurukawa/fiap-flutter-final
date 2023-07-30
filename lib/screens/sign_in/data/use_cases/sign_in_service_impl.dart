import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list/screens/sign_in/domain/entities/sign_in_entity.dart';
import 'package:shopping_list/screens/sign_in/domain/use_cases/sign_in_service.dart';
import 'package:shopping_list/screens/sign_in/domain/utils/domain_errors.dart';

class SignInServiceImpl implements SignInService {

  final authInstance = FirebaseAuth.instance;

  @override
  Future<void> signIn(SignInEntity signIn) async {
    try {
      await authInstance.signInWithEmailAndPassword(email: signIn.email.trim(), password: signIn.password.trim());
    } on FirebaseException catch (error) {
      switch (error.code) {
        case 'user-disabled':
          throw DomainError.userDisabled;
        case 'invalid-email':
          throw DomainError.invalidEmail;
        case 'user-not-found':
          throw DomainError.userNotFound;
        case 'wrong-password':
          throw DomainError.wrongPassword;
        default:
          throw DomainError.failedToSignIn;
      }
    }
  }

}