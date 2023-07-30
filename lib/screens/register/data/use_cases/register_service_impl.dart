import 'package:shopping_list/screens/register/domain/entities/register_entity.dart';
import 'package:shopping_list/screens/register/domain/use_cases/register_service.dart';

class RegisterServiceImpl implements RegisterService {

  @override
  Future<void> register(RegisterEntity register) async {
    await Future.delayed(const Duration(seconds: 1));
  }

}