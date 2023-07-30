import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';

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
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.white70,
          body: Column(
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
                onPressed: () {
                  context.read<ShoppingListCubit>().edit(_editItem.text, state.shoppingItem!.uuid);
                },
                child: const Text('Salvar'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ShoppingListCubit>().delete(state.shoppingItem!.uuid);
                },
                child: const Text('Deletar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
