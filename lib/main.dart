import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shopping_list/screens/register/presentation/bloc/register_cubit.dart';
import 'package:shopping_list/screens/register/presentation/container/register_container.dart';
import 'package:shopping_list/screens/register/register_service_locator.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/container/shopping_list_container.dart';
import 'package:shopping_list/screens/shopping_list/presentation/screens/shopping_list_screen.dart';
import 'package:shopping_list/screens/shopping_list/shopping_list_service_locator.dart';
import 'package:shopping_list/screens/sign_in/presentation/bloc/sign_in_cubit.dart';
import 'package:shopping_list/screens/sign_in/presentation/container/sign_in_container.dart';
import 'package:shopping_list/screens/sign_in/sign_in_service_locator.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp();

  RegisterServiceLocator.setup();
  ShoppingListServiceLocator.setup();
  SignInServiceLocator.setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      initialRoute: ShoppingListScreen.routeName,
      routes: {
        RegisterContainer.routeName: (_) => RegisterCubitProvider(child: RegisterContainer()),
        ShoppingListContainer.routeName: (_) => ShoppingListCubitProvider(child: ShoppingListContainer()),
        SignInContainer.routeName: (_) => SignInCubitProvider(child: SignInContainer()),
      },
    );
  }
}