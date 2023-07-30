import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/screens/sign_in/domain/entities/sign_in_entity.dart';
import 'package:shopping_list/screens/sign_in/domain/use_cases/sign_in_service.dart';
import 'package:shopping_list/screens/sign_in/domain/utils/domain_errors.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInCubit extends Cubit<SignInCubitState> {
  SignInService signInService;

  SignInCubit({
    required this.signInService,
  }) : super(const SignInCubitState(status: SignInCubitStateStatus.ok));

  void onInit() async {
    FlutterNativeSplash.remove();
    final user = FirebaseAuth.instance.currentUser;

    if(user == null) {
      emit(state.copyWith(
        status: SignInCubitStateStatus.ok,
      ));
      return;
    }

    emit(state.copyWith(
      status: SignInCubitStateStatus.logged,
    ));

  }

  void signIn(String email, String password) async {
    try {
      var user = SignInEntity(email: email, password: password);
      await signInService.signIn(user);
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
