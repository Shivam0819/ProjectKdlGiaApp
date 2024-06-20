
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kdlgia/order_status/order_data.dart';

Future<OrderData> orderFatchApi(String token) async {
  String url =
      'https://www.kdlgia.com/consumer/order/?q_id_type=dia_report_no&q_ord_sn=&q_ord_tm1=&q_ord_tm2=&q_place=&q_ord_st=&q_perpage=25';

  try {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );

    if (response.statusCode == 200) {
      // Handle success response
      print(response.body);
        Map<String, dynamic> jsonData = jsonDecode(response.body);

      // Check if the data is empty
      if (jsonData['total'] == 0 || jsonData['list'] == "") {
        // print("************************************************Data is here");
        // print("No data found.");
        return OrderData(
          s: jsonData['s'],
          m: jsonData['m'],
          total: 0,
          perPage: 0,
          page: 0,
          pages: 0,
          order: [],
        );
      }

      List<dynamic> data = jsonData['data']['list'];

      List<Order> orderDiamondList = [];
      for (int i = 0; i < data.length; i++) {
        orderDiamondList.add(Order.fromJson(data[i]));

      }

      OrderData orderData = OrderData(
        s: jsonData['s'],
        m: jsonData['m'],
        total: jsonData['data']['total'],
        perPage: jsonData['data']['perpage'],
        page: jsonData['data']['page'],
        pages: jsonData['data']['pages'],
        order: orderDiamondList,
      );
      print(orderData);

      // print("********************************************************************");
      // print(diamondData.total);

      return orderData;
    } else {
      // Handle error response
      throw Exception('Failed to submit cart');
    }
  } catch (e) {
    throw Exception('Error submitting cart: $e');
  }
}
