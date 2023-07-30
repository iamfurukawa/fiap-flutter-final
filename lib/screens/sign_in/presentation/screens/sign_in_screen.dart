import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {

  SignInScreen({Key? key}) : super(key: key);

  var email;
  var password;

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
            onChanged: (newEmail) {
              email = newEmail;
            },
          ),
          const SizedBox(height: 32),
          TextField(
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
            onChanged: (newPassword) {
              password = newPassword;
            },
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => {},
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
