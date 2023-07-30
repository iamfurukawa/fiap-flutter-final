import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';
import 'package:shopping_list/screens/shopping_list/domain/use_cases/shopping_list_service.dart';

class ShoppingListServiceImpl implements ShoppingListService {
  @override
  Future<ShoppingListEntity> retrieve() async {
    await Future.delayed(const Duration(seconds: 2));
    return const ShoppingListEntity(items: []);
  }

  @override
  Future<ShoppingListEntity> save(ShoppingListEntity shoppingList) async {
    await Future.delayed(const Duration(seconds: 2));
    return shoppingList;
  }
  
}