
import 'package:http/http.dart' as http;
import 'package:kdlgia/cart/cartData.dart';
import 'dart:convert';

Future<void> addToCart(String itemId, String token) async {
  String url = 'https://www.kdlgia.com/consumer/cart/add/$itemId';

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );
    print(response.body);

    if (response.statusCode == 200) {
      // Handle success response
      print("Success");

      // return 'Item added to cart successfully';
    } else {
      // Handle error response
      throw Exception('Failed to add item to cart');
    }
  } catch (e) {
    throw Exception('Error adding item to cart: $e');
  }
}

Future<CartResponse> showCarts(String token) async {
  String url = 'https://www.kdlgia.com/consumer/cart';

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );
    print("*********************************Show Carts detail");
    print(response.body);

    if (response.statusCode == 200) {
      // Handle success response

      final parsed = jsonDecode(response.body.toString());
      CartResponse cartResponse = CartResponse.fromJson(parsed);
      print('Cart total items: ${cartResponse.cart.total}');
      print('Cart amount: ${cartResponse.cart.amount}');
      print('Cart items: ${cartResponse.cart.item}');
      return cartResponse;
    } else {
      // Handle error response
      throw Exception('Failed to add item to cart');
    }
  } catch (e) {
    throw Exception('Error adding item to cart: $e');
  }
}

Future<String> removeFromCart(String itemId, String token) async {
  String url = 'https://www.kdlgia.com/consumer/cart/del/$itemId';

  try {
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );
    print(response.body);

    if (response.statusCode == 200) {
      print("******************************Item Remove to cart successfully");

      // Handle success response
      return 'Item removed from cart successfully';
    } else {
      // Handle error response
      throw Exception('Failed to remove item from cart');
    }
  } catch (e) {
    throw Exception('Error removing item from cart: $e');
  }
}

Future<String> submitCart(String token) async {
  String url =
      'https://www.kdlgia.com/consumer/order/?q_id_type=dia_report_no&q_ord_sn=&q_ord_tm1=&q_ord_tm2=&q_place=&q_ord_st=&q_perpage=25';

  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );

    if (response.statusCode == 200) {
      // Handle success response
      return 'Cart submitted successfully';
    } else {
      // Handle error response
      throw Exception('Failed to submit cart');
    }
  } catch (e) {
    throw Exception('Error submitting cart: $e');
  }
}
