import 'package:uuid/uuid.dart';

class ShoppingItemEntity {
  String name;
  bool check;
  String uuid;

  ShoppingItemEntity({
    required this.name,
    this.check = false,
    String? uuid,
  }) : uuid = uuid ?? const Uuid().v4();
}
