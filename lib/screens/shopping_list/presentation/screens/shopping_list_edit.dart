import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';
import 'package:shopping_list/screens/shopping_list/presentation/container/shopping_list_container.dart';
import 'package:shopping_list/shared/colors_system.dart';

class ShoppingListEdit extends StatelessWidget {
  final TextEditingController _editItem = TextEditingController();

  ShoppingListEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListCubitState>(
      builder: (context, state) {
        _editItem.text = state.shoppingItem?.name ?? "";

        return Scaffold(
          appBar: AppBar(
            title: const Text("Shopping List Edit"),
            backgroundColor: ColorsSystem.background,
            leading: IconButton(
              onPressed: () => Navigator.pushReplacementNamed(context, ShoppingListContainer.routeName),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: ColorsSystem.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _editItem,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                    foregroundColor: MaterialStatePropertyAll(Colors.black),
                  ),
                  onPressed: () {
                    context.read<ShoppingListCubit>().edit(_editItem.text, state.shoppingItem!.uuid);
                  },
                  child: const Text('Salvar'),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    context.read<ShoppingListCubit>().delete(state.shoppingItem!.uuid);
                  },
                  child: const Text('Deletar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
