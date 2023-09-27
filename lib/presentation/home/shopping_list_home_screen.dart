import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_data.dart';
import 'package:shopping_list_app/data/models.dart';
import 'package:shopping_list_app/presentation/home/shopping_list_item.dart';
import 'package:shopping_list_app/presentation/new_item/new_item_screen.dart';
import 'package:shopping_list_app/util/values/strings.dart';

class ShoppingListHomePage extends StatefulWidget {
  const ShoppingListHomePage({super.key});

  @override
  State<ShoppingListHomePage> createState() => _ShoppingListHomePageState();
}

class _ShoppingListHomePageState extends State<ShoppingListHomePage> {

  final List<GroceryItem> _items = [];


  void _onItemAddClicked() async {
    final GroceryItem data = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const NewItemScreen();
      },
    ));
    if(data!= null){
      setState(() {
        _items.add(data);
      });
    }
  }
  
  void _onItemDismissed(GroceryItem item){
    setState(() {
      _items.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget content = ListView(
      children: [
        ..._items.map((e) => Dismissible(
            onDismissed: (direction) {
              _onItemDismissed(e);
            },
            key: ValueKey(e.id),
            child: ShoppingListItem(groceryItem: e)))
      ],
    );

    if(_items.isEmpty){
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("No items to show", style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),),

            Text("Add items by clicking + button.", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7)
            ),),

          ],
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(yourGroceriesLabel),
        actions: [
          IconButton(onPressed: _onItemAddClicked, icon: const Icon(Icons.add))
        ],
      ),
      body: content,
    );
  }
}
