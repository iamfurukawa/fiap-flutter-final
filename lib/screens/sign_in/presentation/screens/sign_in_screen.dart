import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/register/presentation/container/register_container.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit.dart';
import 'package:shopping_list/shared/colors_system.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSystem.background,
      ),
      backgroundColor: ColorsSystem.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                if (_passwordController.text.isEmpty || _emailController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        'Por favor, preencha os campos corretamente.',
                      ),
                    ),
                  );

                  return;
                }

                context.read<SignInCubit>().signIn(_emailController.text, _passwordController.text);
              },
              child: const Text('Entrar'),
            ),
            const SizedBox(height: 32),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, RegisterContainer.routeName);
                },
                child: const Text("Para realizar o cadastro clique aqui."),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
