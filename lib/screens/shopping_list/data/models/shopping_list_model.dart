import 'package:shopping_list/screens/shopping_list/data/models/shopping_item_model.dart';
import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';

class ShoppingListModel {

  final List<ShoppingItemModel> items;

  const ShoppingListModel({
    required this.items,
  });

  factory ShoppingListModel.fromJson(Map<String, dynamic> json) {
    return ShoppingListModel(
      items: json['items'],
    );
  }

  ShoppingListEntity toEntity() {
    return ShoppingListEntity(
      items: items.map((item) => item.toEntity()).toList(),
    );
  }
}