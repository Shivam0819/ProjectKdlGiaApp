
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
  await Future.delayed( const Duration(seconds: 2));
  
  String url = 'https://www.kdlgia.com/consumer/cart';

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );
    // print("******************************************");
    //   print(response.statusCode);
    //   print("******************************************");

    if (response.statusCode == 200) {
      // Handle success response

      final parsed = jsonDecode(response.body.toString());
      print("******************************************");
      print(parsed);
      print("******************************************");
      CartResponse cartResponse = CartResponse.fromJson(parsed);
      print("******************************************");
      print(cartResponse);
      print("******************************************");

      
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
    // print(response.body);

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






Future<String> submitOrder(String token, String subids, String cart_receiver, String cart_phone,  {String cart_note = ""}) async {
  final url = Uri.parse('https://www.kdlgia.com/consumer/submit_order');
  final headers = {
    'Mob-Token': token,
    'Content-Type': 'application/x-www-form-urlencoded',
  };
  final body = {
    'subids': subids,
    'depids': '',
    'cart_receiver': cart_receiver,
    'cart_phone': cart_note,
    'cart_note': 'a',
  };

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    print(response.body);
    final parsed = jsonDecode(response.body.toString());

    print(parsed);
    return 'Order submitted successfully';
  } else {
    return 'Failed to submit order: ${response.statusCode}';
  }
}

Future<String> Order(String token) async {
  String url =
      'https://www.kdlgia.com/consumer/order/?q_id_type=dia_report_no&q_ord_sn=&q_ord_tm1=&q_ord_tm2=&q_place=&q_ord_st=&q_perpage=25';

  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );

    if (response.statusCode == 200) {
      // Handle success response
      return 'Orders  successfully';
    } else {
      // Handle error response
      throw Exception('Failed to submit orders');
    }
  } catch (e) {
    throw Exception('Error submitting order: $e');
  }
}
