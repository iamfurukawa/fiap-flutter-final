import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit.dart';
import 'package:shopping_list/screens/shopping_list/presentation/bloc/shopping_list_cubit_state.dart';
import 'package:shopping_list/screens/sign_in/presentation/container/sign_in_container.dart';
import 'package:shopping_list/shared/colors_system.dart';

class ShoppingListScreen extends StatelessWidget {

  const ShoppingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListCubitState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            hoverElevation: 50,
            onPressed: () {
              context.read<ShoppingListCubit>().goToAdd();
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text("Shopping List"),
            backgroundColor: ColorsSystem.background,
            leading: IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, SignInContainer.routeName);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: ColorsSystem.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              itemCount: state.shoppingList.items.length,
              itemBuilder: (context, index) {
                final item = state.shoppingList.items[index];

                return ListTile(
                  onLongPress: () {
                    context.read<ShoppingListCubit>().goToEdit(item.uuid);
                  },
                  onTap: () {
                    context.read<ShoppingListCubit>().toogleMark(item.uuid);
                  },
                  title: Text(
                    item.name,
                    style: TextStyle(
                      decoration: item.check == true ? TextDecoration.lineThrough : TextDecoration.none,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
