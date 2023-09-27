import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list_app/presentation/home/shopping_list_home_screen.dart';

void main() {
  runApp(const ShoppingListApp());
}

final appTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    textTheme: GoogleFonts.aBeeZeeTextTheme(),
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark, seedColor: Colors.deepPurpleAccent));

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: appTheme,
      title: "Shopping List App",
      home: const ShoppingListHomePage(),
    );
  }
}
