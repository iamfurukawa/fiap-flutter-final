import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';

class ShoppingListError extends StatelessWidget {
  final String errorMessage;

  const ShoppingListError({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.read<ShoppingListCubit>().onInit(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Text(
            'Ops, parece que ocorreu um erro ao logar!$errorMessage',
            style: const TextStyle(
              fontSize: 18,
            )
        ),
      ),
    );
  }
}
