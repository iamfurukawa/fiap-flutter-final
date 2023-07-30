import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit.dart';

class SignInScreen extends StatelessWidget {

  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white70,
      body: Column(
        children: [
          const Text("Shopping List", style: TextStyle(fontSize: 32)),
          const SizedBox(height: 32),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
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
          TextField(
            obscureText: true,
            controller: _passwordController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Senha',
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
              context.read<SignInCubit>().signIn(_passwordController.text, _emailController.text);
            },
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
