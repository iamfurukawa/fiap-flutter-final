import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';

abstract class ShoppingListService {
  Future<ShoppingListEntity> save(ShoppingListEntity shoppingList);

  Future<ShoppingListEntity> retrieve();
}