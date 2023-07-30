import 'package:shopping_list/screens/register/domain/entities/register_entity.dart';

abstract class RegisterService {
  Future<void> register(RegisterEntity register);
}