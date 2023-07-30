import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_item_entity.dart';

class ShoppingListEntity {
  final List<ShoppingItemEntity> items;

  const ShoppingListEntity({
    required this.items,
  });
}
