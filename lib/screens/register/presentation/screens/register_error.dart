import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/register/presentation/bloc/register_cubit.dart';
import 'package:shopping_list/shared/colors_system.dart';

class RegisterError extends StatelessWidget {
  final String errorMessage;

  const RegisterError({
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
          onPressed: () => context.read<RegisterCubit>().onInit(),
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
              'Ops, parece que ocorreu uma falha\n\nErro retornado: $errorMessage',
              style: const TextStyle(
                fontSize: 18,
              )
          ),
        ),
      ),
    );
  }
}
