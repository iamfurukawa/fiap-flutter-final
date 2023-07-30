import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/shared/colors_system.dart';

class ShoppingListError extends StatelessWidget {
  final String errorMessage;

  const ShoppingListError({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsSystem.background,
      appBar: AppBar(
        backgroundColor: ColorsSystem.background,
        leading: IconButton(
          onPressed: () => context.read<ShoppingListCubit>().onInit(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
              'Ops, parece que ocorreu um erro ao logar!$errorMessage',
              style: const TextStyle(
                fontSize: 18,
              )
          ),
        ),
      ),
    );
  }
}
