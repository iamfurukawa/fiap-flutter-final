import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/register/presentation/bloc/register_cubit.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit.dart';

class RegisterError extends StatelessWidget {
  final String errorMessage;

  const RegisterError({
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
          onPressed: () => context.read<RegisterCubit>().onInit(),
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
