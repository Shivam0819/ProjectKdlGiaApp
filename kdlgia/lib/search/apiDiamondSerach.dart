import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kdlgia/search/diamondData.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';

Future<DiamondData> fetchDataSearchDiamond(
     String token, {String searchQuerry = ""}) async {
  String url = 'https://www.kdlgia.com/diamond/?$searchQuerry&out_type=json';
  print("object:$url token: $token");

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );
    print(response.body);

    if (response.statusCode == 200) {
      // print("object:${response.body}");
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      List<dynamic> data = jsonData['data']['csv'];
          print("${data.length}");
          print(data);

      List<Diamond> diamondList = [];
      for (int i = 1; i < data.length; i++) {
        diamondList.add(Diamond.fromJson(data[i]));
      }
      // print("object******************${diamondList}");

      DiamondData diamondData = DiamondData(
        s: jsonData['s'],
        m: jsonData['m'],
        cartNum: jsonData['data']['cart_num'],
        total: jsonData['data']['total'],
        perPage: jsonData['data']['perpage'],
        page: jsonData['data']['page'],
        pages: jsonData['data']['pages'],
        diamonds: diamondList,
      );

      return diamondData;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
