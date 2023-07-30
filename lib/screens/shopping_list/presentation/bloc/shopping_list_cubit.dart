import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_item_entity.dart';
import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';
import 'package:shopping_list/screens/shopping_list/domain/use_cases/shopping_list_service.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';
import 'package:shopping_list/screens/sign_in/domain/utils/domain_errors.dart';

class ShoppingListCubit extends Cubit<ShoppingListCubitState> {
  ShoppingListService shoppingListService;

  ShoppingListCubit({
    required this.shoppingListService,
  }) : super(
    const ShoppingListCubitState(
      status: ShoppingListCubitStateStatus.ok,
      shoppingList: ShoppingListEntity(items: []),
    ),
  );

  void onInit() async {
    try {
      FlutterNativeSplash.remove();
      ShoppingListEntity shoppingList = await shoppingListService.retrieve();

      emit(state.copyWith(
        shoppingList: shoppingList,
        status: ShoppingListCubitStateStatus.ok,
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
          status: ShoppingListCubitStateStatus.error,
          error: error.description));
    }
  }

  void add(String name) async {
    try {
      var newItem = ShoppingItemEntity(name: name);
      state.shoppingList.items.add(newItem);
      var updatedShoppingList = await shoppingListService.save(state.shoppingList);

      emit(state.copyWith(
        shoppingList: updatedShoppingList,
        status: ShoppingListCubitStateStatus.ok,
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
          status: ShoppingListCubitStateStatus.error,
          error: error.description));
    }
  }

  void toogleMark(String uuid) {
    try {
      state.shoppingList.items.map((item) {
        if (item.uuid == uuid) item.check = !item.check;
        return item;
      });

      emit(state.copyWith(
        status: ShoppingListCubitStateStatus.ok,
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
          status: ShoppingListCubitStateStatus.error,
          error: error.description));
    }
  }
}

class ShoppingListCubitProvider extends BlocProvider<ShoppingListCubit> {
  ShoppingListCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
    key: key,
    create: (_) =>
    ShoppingListCubit(
      shoppingListService: GetIt.instance<ShoppingListService>(),
    )
      ..onInit(),
    child: child,
  );

  static ShoppingListCubit of(BuildContext context) =>
      BlocProvider.of<ShoppingListCubit>(context);
}
