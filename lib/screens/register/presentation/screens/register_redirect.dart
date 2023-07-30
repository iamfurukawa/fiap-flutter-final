import 'package:flutter/material.dart';
import 'package:shopping_list/shared/colors_system.dart';

class RegisterRedirect extends StatelessWidget {
  final String? route;

  const RegisterRedirect({Key? key, this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if(route != null) {
        Navigator.pushReplacementNamed(context, route!);
      }
    });

    return Scaffold(
      backgroundColor: ColorsSystem.background,
      appBar: AppBar(
        backgroundColor: ColorsSystem.background,
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
