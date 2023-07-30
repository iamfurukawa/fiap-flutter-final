import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';

class ShoppingListScreen extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListCubitState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            hoverElevation: 50,
            onPressed: () {
              context.read<ShoppingListCubit>().goToAdd();
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text("Shopping List"),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.white70,
          body: ListView.builder(
            itemCount: state.shoppingList.items.length,
            itemBuilder: (context, index) {
              final item = state.shoppingList.items[index];

              return ListTile(
                onLongPress: () {
                  context.read<ShoppingListCubit>().goToEdit(item.uuid);
                },
                onTap: () {
                  context.read<ShoppingListCubit>().toogleMark(item.uuid);
                },
                title: Text(
                  item.name,
                  style: TextStyle(
                    decoration: item.check == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
