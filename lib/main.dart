import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/provider/cart_provider.dart';
import 'package:shopping_cart_app/screens/product_list.dart';
import 'package:shopping_cart_app/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
        child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CPA Assignment',
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
     //     home: const ProductList(),
          home: Scaffold(
            appBar: AppBar(title: const Text("Group 12 Assignment")),
            body: const MyStatefulWidget(),
          ),

        );
      }),
    );
  }
}

