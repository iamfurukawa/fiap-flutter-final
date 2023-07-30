import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/register/presentation/bloc/register_cubit.dart';
import 'package:shopping_list/screens/register/presentation/bloc/register_cubit_state.dart';
import 'package:shopping_list/screens/register/presentation/screens/register_error.dart';
import 'package:shopping_list/screens/register/presentation/screens/register_redirect.dart';
import 'package:shopping_list/screens/register/presentation/screens/register_screen.dart';
import 'package:shopping_list/screens/shopping_list/presentation/container/shopping_list_container.dart';

class RegisterContainer extends BlocBuilder<RegisterCubit, RegisterCubitState> {

  static const routeName = '/register_screen';

  RegisterContainer({super.key}) : super(
    builder: (context, state) {
      switch (state.status) {
        case RegisterCubitStateStatus.ok:
          return const RegisterScreen();
        case RegisterCubitStateStatus.register:
          return const RegisterRedirect(
            route: ShoppingListContainer.routeName,
          );
        case RegisterCubitStateStatus.error:
          return RegisterError(
            errorMessage: state.error ?? "",
          );
      }
    },
  );
}
