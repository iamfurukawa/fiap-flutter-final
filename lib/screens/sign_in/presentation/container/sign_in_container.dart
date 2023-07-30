import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/container/shopping_list_container.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit_state.dart';
import 'package:shopping_list/screens/sign_in/presentation/screens/sign_in_error.dart';
import 'package:shopping_list/screens/sign_in/presentation/screens/sign_in_redirect.dart';
import 'package:shopping_list/screens/sign_in/presentation/screens/sign_in_screen.dart';

class SignInContainer extends BlocBuilder<SignInCubit, SignInCubitState> {

  static const routeName = '/sign_in_screen';

  SignInContainer({super.key})
      : super(
          builder: (context, state) {
            switch (state.status) {
              case SignInCubitStateStatus.ok:
                return SignInScreen();
              case SignInCubitStateStatus.logged:
                return const SignInRedirect(
                  route: ShoppingListContainer.routeName,
                );
              case SignInCubitStateStatus.error:
                return SignInError(
                  errorMessage: state.error ?? "",
                );
            }
          },
        );
}
