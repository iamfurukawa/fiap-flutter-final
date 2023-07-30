import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_item_entity.dart';

class ShoppingItemModel {
  final String name;
  final bool check;
  final String uuid;

  const ShoppingItemModel({required this.name, required this.check, required this.uuid});

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) {
    return ShoppingItemModel(
      name: json['name'],
      check: json['check'],
      uuid: json['uuid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'name': name,
      'check': check,
    };
  }

  static ShoppingItemModel fromEntity(ShoppingItemEntity item) {
    return ShoppingItemModel(
      name: item.name,
      check: item.check,
      uuid: item.uuid,
    );
  }

  ShoppingItemEntity toEntity() {
    return ShoppingItemEntity(
      name: name,
      check: check,
      uuid: uuid,
    );
  }
}
