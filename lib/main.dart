import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_etic/controllers/cart_controller.dart';
import 'package:task_etic/ui/cart_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProductCart>(create: (_) => ProductCart()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task_etic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(color: Colors.black)),
        textTheme: const TextTheme(headline1: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        primarySwatch: Colors.pink,
      ),
      home: const CartScreen(),
    );
  }
}
