import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shopping_list/screens/register/presentation/bloc/register_cubit.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit.dart';
import 'package:shopping_list/screens/sign_in/presentation/container/sign_in_container.dart';
import 'package:shopping_list/shared/colors_system.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register_screen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsSystem.background,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, SignInContainer.routeName),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: ColorsSystem.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Registrar", style: TextStyle(fontSize: 32)),
            const SizedBox(height: 32),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
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
              controller: _passwordController,
              obscureText: true,
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
                context.read<RegisterCubit>().register(_passwordController.text, _emailController.text);
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
