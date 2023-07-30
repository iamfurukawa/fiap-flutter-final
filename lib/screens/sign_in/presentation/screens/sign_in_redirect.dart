import 'package:flutter/material.dart';

class SignInRedirect extends StatelessWidget {
  final String? route;
  const SignInRedirect({Key? key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if(route != null) {
        Navigator.pushReplacementNamed(context, route!);
      }
    });

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
