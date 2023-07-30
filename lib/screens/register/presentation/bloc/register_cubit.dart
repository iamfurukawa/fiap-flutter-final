import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/screens/register/domain/entities/register_entity.dart';
import 'package:shopping_list/screens/register/domain/use_cases/register_service.dart';
import 'package:shopping_list/screens/register/presentation/bloc/register_cubit_state.dart';
import 'package:shopping_list/screens/sign_in/domain/utils/domain_errors.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterService registerService;

  RegisterCubit({
    required this.registerService,
  }) : super(const RegisterCubitState(status: RegisterCubitStateStatus.ok));

  void onInit() async {
    FlutterNativeSplash.remove();
    emit(state.copyWith(
      status: RegisterCubitStateStatus.ok,
    ));
  }

  void signIn(String email, String password) {
    try {
      var user = RegisterEntity(email: email, password: password);
      registerService.register(user);
      emit(state.copyWith(
        status: RegisterCubitStateStatus.register,
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
          status: RegisterCubitStateStatus.error,
          error: error.description
      ));
    }
  }
}

class RegisterCubitProvider extends BlocProvider<RegisterCubit> {
  RegisterCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
    key: key,
    create: (_) => RegisterCubit(
      registerService: GetIt.instance<RegisterService>(),
    )..onInit(),
    child: child,
  );

  static RegisterCubit of(BuildContext context) =>
      BlocProvider.of<RegisterCubit>(context);
}
