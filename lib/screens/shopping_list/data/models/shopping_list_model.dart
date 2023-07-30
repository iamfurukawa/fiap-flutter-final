import 'package:shopping_list/screens/shopping_list/data/models/shopping_item_model.dart';
import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';

class ShoppingListModel {

  final String uuid;
  final List<ShoppingItemModel> items;

  const ShoppingListModel({
    required this.uuid,
    required this.items,
  });

  factory ShoppingListModel.fromJson(Map<String, dynamic> json) {
    return ShoppingListModel(
      uuid: json['uuid'],
      items: (json['items'] as List<dynamic>).map((item) => ShoppingItemModel.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'items': items.map((item) => item.toJson()).toList(),
    };
  }

  static ShoppingListModel fromEntity(ShoppingListEntity shoppingListEntity, String userId) {
    return ShoppingListModel(
      uuid: userId,
      items: shoppingListEntity.items.map((item) => ShoppingItemModel.fromEntity(item)).toList(),
    );
  }
  
  ShoppingListEntity toEntity() {
    return ShoppingListEntity(
      items: items.map((item) => item.toEntity()).toList(),
    );
  }
}