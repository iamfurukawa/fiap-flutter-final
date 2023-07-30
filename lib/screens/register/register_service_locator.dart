import 'package:get_it/get_it.dart';
import 'package:shopping_list/screens/register/data/use_cases/register_service_impl.dart';
import 'package:shopping_list/screens/register/domain/use_cases/register_service.dart';

class RegisterServiceLocator {
  static GetIt di = GetIt.instance;

  static void setup() {
    di.registerFactory<RegisterService>(() => RegisterServiceImpl());
  }
}
