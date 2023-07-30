import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';

class ShoppingListAdd extends StatelessWidget {
  final TextEditingController _newItem = TextEditingController();

  ShoppingListAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Shopping List Add"),
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.white70,
          body: Column(
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
                  context.read<ShoppingListCubit>().add(_newItem.text);
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
