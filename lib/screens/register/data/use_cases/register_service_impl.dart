import 'package:shopping_list/screens/register/domain/entities/register_entity.dart';
import 'package:shopping_list/screens/register/domain/use_cases/register_service.dart';
import 'package:shopping_list/screens/register/domain/utils/domain_errors.dart';

class RegisterServiceImpl implements RegisterService {

  @override
  Future<void> register(RegisterEntity register) async {
    //throw DomainError.timeOut;
    await Future.delayed(const Duration(seconds: 1));
  }

}