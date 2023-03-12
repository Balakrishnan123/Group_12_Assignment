import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart_app/model/cart_model.dart';
import 'package:shopping_cart_app/model/item_model.dart';
import 'package:shopping_cart_app/database/db_helper.dart';
import 'package:shopping_cart_app/provider/cart_provider.dart';




void main(){
  DBHelper dbHelper  = DBHelper();

  testWidgets('Add item to database', (WidgetTester tester) async {

    dbHelper.initDatabase();
    List<Item> products  = [Item(name: 'Apple', unit: 'Kg', price: 20, image: 'assets/images/apple.png')];
    final cart =  CartProvider();
    int index = 0;
      dbHelper.insert(
        Cart(
          id: index,
          productId: index.toString(),
          productName: products[index].name,
          initialPrice: products[index].price,
          productPrice: products[index].price,
          quantity: ValueNotifier(1),
          unitTag: products[index].unit,
          image: products[index].image,
        ),
      );

    List<Cart> retrievedItem = await dbHelper.getCartList();

    print(retrievedItem);
    expect(retrievedItem[index].name, 'Apple');
    expect(retrievedItem[index].price, 20);
  });
}