import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';
import 'package:shopping_list/screens/shopping_list/presentation/container/shopping_list_container.dart';
import 'package:shopping_list/shared/colors_system.dart';

class ShoppingListAdd extends StatelessWidget {
  final TextEditingController _newItem = TextEditingController();

  ShoppingListAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Novo Item"),
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
                  controller: _newItem,
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
                    if (_newItem.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            'Por favor, preencha o nome do item.',
                          ),
                        ),
                      );

                      return;
                    }

                    context.read<ShoppingListCubit>().add(_newItem.text);
                  },
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
