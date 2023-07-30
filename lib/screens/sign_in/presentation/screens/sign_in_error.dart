import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit.dart';
import 'package:shopping_list/shared/colors_system.dart';

class SignInError extends StatelessWidget {
  final String errorMessage;

  const SignInError({
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
          onPressed: () => context.read<SignInCubit>().onInit(),
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
