import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/screens/sign_in/domain/entities/sign_in_entity.dart';
import 'package:shopping_list/screens/sign_in/domain/use_cases/sign_in_service.dart';
import 'package:shopping_list/screens/sign_in/domain/utils/domain_errors.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit_state.dart';

class SignInCubit extends Cubit<SignInCubitState> {
  SignInService signInService;

  SignInCubit({
    required this.signInService,
  }) : super(const SignInCubitState(status: SignInCubitStateStatus.ok));

  void onInit() async {
    FlutterNativeSplash.remove();
    emit(state.copyWith(
      status: SignInCubitStateStatus.ok,
    ));
  }

  void signIn(String email, String password) {
    try {
      var user = SignInEntity(email: email, password: password);
      signInService.signIn(user);
      emit(state.copyWith(
          status: SignInCubitStateStatus.logged,
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
        status: SignInCubitStateStatus.error,
        error: error.description
      ));
    }
  }
}

class SignInCubitProvider extends BlocProvider<SignInCubit> {
  SignInCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
          key: key,
          create: (_) => SignInCubit(
            signInService: GetIt.instance<SignInService>(),
          )..onInit(),
          child: child,
        );

  static SignInCubit of(BuildContext context) =>
      BlocProvider.of<SignInCubit>(context);
}
