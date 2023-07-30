import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_item_entity.dart';
import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';

enum ShoppingListCubitStateStatus { ok, newItem, editItem, error }

class ShoppingListCubitState {
  final ShoppingListCubitStateStatus status;
  final ShoppingListEntity shoppingList;
  final ShoppingItemEntity? shoppingItem;
  final String? error;

  const ShoppingListCubitState({
    required this.status,
    required this.shoppingList,
    this.shoppingItem,
    this.error,
  });

  ShoppingListCubitState copyWith({
    ShoppingListCubitStateStatus? status,
    ShoppingListEntity? shoppingList,
    ShoppingItemEntity? shoppingItem,
    String? error,
  }) {
    return ShoppingListCubitState(
      status: status ?? this.status,
      shoppingList: shoppingList ?? this.shoppingList,
      shoppingItem: shoppingItem ?? this.shoppingItem,
      error: error ?? this.error,
    );
  }
}
