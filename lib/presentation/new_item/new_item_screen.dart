import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_data.dart';
import 'package:shopping_list_app/data/models.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  late TextStyle _textTheme;
  final _formKey = GlobalKey<FormState>();

  String _enteredName = '';
  int _enteredQuantity = 1;
  Category _selectedCategory = categories[Categories.vegetables]!;

  void _addItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(
          GroceryItem(id: DateTime.now().toString(),
              name: _enteredName,
              quantity: _enteredQuantity,
              category: _selectedCategory)
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _textTheme = Theme
        .of(context)
        .textTheme
        .bodyLarge!
        .copyWith(color: Theme
        .of(context)
        .colorScheme
        .onBackground);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLines: 1,
                maxLength: 50,
                style: _textTheme,
                decoration: const InputDecoration(
                  label: Text(
                    'Name',
                  ),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value
                          .trim()
                          .length == 1 ||
                      value
                          .trim()
                          .length > 50) {
                    return "Name must be between 1 to 50 characters";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredName = newValue!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLines: 1,
                      initialValue: "1",
                      style: _textTheme,
                      decoration:
                      const InputDecoration(label: Text('Quantity')),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Valid positive number quantity required";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _enteredQuantity = int.tryParse(newValue!)!;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        ...categories.entries.map((e) =>
                            DropdownMenuItem(
                                value: e.value,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      color: e.value.color,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      e.value.name,
                                      style: _textTheme,
                                    )
                                  ],
                                )))
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: Text(
                        'Reset',
                        style: _textTheme,
                      )),
                  ElevatedButton(
                      onPressed: _addItem,
                      child: Text(
                        "Add Item",
                        style: _textTheme,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
