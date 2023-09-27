import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/models.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({super.key, required this.groceryItem});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      leading: Container(
        color: groceryItem.category.color,
        width: 20,
        height: 20,
      ),
      title: Text(
        groceryItem.name,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      trailing: Text(groceryItem.quantity.toString(),
          style: Theme.of(context)
              .textTheme!
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
    );
  }
}
