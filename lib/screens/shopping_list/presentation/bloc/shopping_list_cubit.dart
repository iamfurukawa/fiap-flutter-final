import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_item_entity.dart';
import 'package:shopping_list/screens/shopping_list/domain/entities/shopping_list_entity.dart';
import 'package:shopping_list/screens/shopping_list/domain/use_cases/shopping_list_service.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';
import 'package:shopping_list/screens/shopping_list/domain/utils/domain_errors.dart';

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
      var newList = ShoppingListEntity(items: [...state.shoppingList.items, newItem]);
      var updatedShoppingList = await shoppingListService.save(newList);

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

  void delete(String uuid) async {
    try {
      var updatedItems = [...state.shoppingList.items];
      updatedItems.removeWhere((item) => item.uuid == uuid);

      emit(state.copyWith(
        status: ShoppingListCubitStateStatus.ok,
        shoppingList: ShoppingListEntity(items: updatedItems),
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
          status: ShoppingListCubitStateStatus.error,
          error: error.description));
    }
  }

  void edit(String newName, String uuid) async {
    try {
      var updatedItems = [...state.shoppingList.items];
      updatedItems = updatedItems.map((item) {
        if(item.uuid == uuid) {
          item.name = newName;
        }
        return item;
      }).toList();

      emit(state.copyWith(
        status: ShoppingListCubitStateStatus.ok,
        shoppingList: ShoppingListEntity(items: updatedItems),
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
          status: ShoppingListCubitStateStatus.error,
          error: error.description));
    }
  }

  void toogleMark(String uuid) {
    try {
      var updatedItems = state.shoppingList.items.map((item) {
        if (item.uuid == uuid) item.check = !item.check;
        return item;
      })
      .toList();

      emit(state.copyWith(
        status: ShoppingListCubitStateStatus.ok,
        shoppingList: ShoppingListEntity(items: updatedItems),
      ));
    } on DomainError catch (error) {
      emit(state.copyWith(
          status: ShoppingListCubitStateStatus.error,
          error: error.description));
    }
  }

  void goToEdit(String uuid) {
    emit(state.copyWith(
      status: ShoppingListCubitStateStatus.editItem,
      shoppingItem: state.shoppingList.items.firstWhere((item) => item.uuid == uuid)
    ));
  }

  void goToAdd() {
    emit(state.copyWith(
      status: ShoppingListCubitStateStatus.newItem,
    ));
  }
}

class ShoppingListCubitProvider extends BlocProvider<ShoppingListCubit> {
  ShoppingListCubitProvider({
    Key? key,
    Widget? child,
  }) : super(
    key: key,
    create: (_) => ShoppingListCubit(
      shoppingListService: GetIt.instance<ShoppingListService>(),
    )..onInit(),
    child: child,
  );

  static ShoppingListCubit of(BuildContext context) =>
      BlocProvider.of<ShoppingListCubit>(context);
}
