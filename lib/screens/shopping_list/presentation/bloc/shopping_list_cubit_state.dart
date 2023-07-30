import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';

enum ShoppingListCubitStateStatus { ok, error }

class ShoppingListCubitState {
  final ShoppingListCubitStateStatus status;
  final ShoppingListEntity shoppingList;
  final String? error;

  const ShoppingListCubitState({
    required this.status,
    required this.shoppingList,
    this.error,
  });

  ShoppingListCubitState copyWith({
    ShoppingListCubitStateStatus? status,
    ShoppingListEntity? shoppingList,
    String? error,
  }) {
    return ShoppingListCubitState(
      status: status ?? this.status,
      shoppingList: shoppingList ?? this.shoppingList,
      error: error ?? this.error,
    );
  }
}
