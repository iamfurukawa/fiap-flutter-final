import 'package:get_it/get_it.dart';
import 'package:shopping_list/screens/shopping_list/data/use_cases/shopping_list_service_impl.dart';
import 'package:shopping_list/screens/shopping_list/domain/use_cases/shopping_list_service.dart';

class ShoppingListServiceLocator {
  static GetIt di = GetIt.instance;

  static void setup() {
    di.registerFactory<ShoppingListService>(() => ShoppingListServiceImpl());
  }
}
