import 'package:get_it/get_it.dart';
import 'package:shopping_list/screens/sign_in/data/use_cases/sign_in_service_impl.dart';
import 'package:shopping_list/screens/sign_in/domain/use_cases/sign_in_service.dart';

class SignInServiceLocator {
  static GetIt di = GetIt.instance;

  static void setup() {
    di.registerFactory<SignInService>(() => SignInServiceImpl());
  }
}
