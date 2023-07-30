import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';
import 'package:shopping_list/screens/shopping_list/presentation/screens/shopping_list_add.dart';
import 'package:shopping_list/screens/shopping_list/presentation/screens/shopping_list_edit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/screens/shopping_list_error.dart';
import 'package:shopping_list/screens/shopping_list/presentation/screens/shopping_list_screen.dart';

class ShoppingListContainer extends BlocBuilder<ShoppingListCubit, ShoppingListCubitState> {

  static const routeName = '/shopping_list_screen';

  ShoppingListContainer({super.key}) : super(
    builder: (context, state) {
      switch (state.status) {
        case ShoppingListCubitStateStatus.ok:
          return ShoppingListScreen();
        case ShoppingListCubitStateStatus.newItem:
          return ShoppingListAdd();
        case ShoppingListCubitStateStatus.editItem:
          return ShoppingListEdit();
        case ShoppingListCubitStateStatus.error:
          return ShoppingListError(
            errorMessage: state.error != null
                ? '\n\nErro retornado: $state.error'
                : '',
          );
      }
    },
  );
}