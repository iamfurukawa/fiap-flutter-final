import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class ShoppingListScreen extends StatefulWidget {
  static const routeName = '/shopping_list_screen';

  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  final items = List<ListItem>.generate(
    1000,
    (i) => MessageItem('Sender $i', 'Message body $i'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          hoverElevation: 50,
          onPressed: () {
            _displayTextInputDialog(context);
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("Shopping List"),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white70,
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              onTap: () {
                print(item.buildSubtitle(context));
              },
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ));
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Novo item'),
            content: TextField(
              onChanged: (value) {},
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Abacate"),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Adicionar'),
              ),
            ],
          );
        });
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;
  bool clicked = false;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(
        sender,
        style: TextStyle(
            decoration: clicked == true
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      );

  @override
  Widget buildSubtitle(BuildContext context) => Text(
        body,
        style: TextStyle(
            decoration: clicked == true
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      );
}
