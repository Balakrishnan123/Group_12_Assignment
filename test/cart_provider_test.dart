import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_cart_app/provider/cart_provider.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  group('Counter', ()
  {
    final counter = CartProvider();
    test('value should start at 0', () {
      print("Value is "+ counter.counter.toString());
      expect(counter.counter, 0);
    });
    test('value should be incremented', () {

      counter.addCounter();
      print("New value is "+ counter.counter.toString());
      expect(counter.counter, 1);

      counter.addCounter();
      print("New value is "+ counter.counter.toString());
      expect(counter.counter, 2);
    });
    test('value should be decremented', () {

      print("Current value is "+ counter.counter.toString());

      counter.removeCounter();
      print("New value is "+ counter.counter.toString());
      expect(counter.counter, 1);

    });
  });
  group('TotalPrice', ()
      {
        final price = CartProvider();
      test('Initial Price should start at 0', () {

        print("Price is "+ price.totalPrice.toString());
        expect(price.totalPrice, 0);
      });
      test('Total Price is incremented', () {

        print("Initial Price is "+ price.totalPrice.toString());
        price.addTotalPrice(20.0);
        print("total Price is "+ price.totalPrice.toString());
        expect(price.totalPrice, 20.0);
      });
        test('Total Price is decremented', () {

          print("Initial Price is "+ price.totalPrice.toString());
          price.removeTotalPrice(5.0);
          print("total Price is "+ price.totalPrice.toString());
          expect(price.totalPrice, 15.0);
        });
});
}
