import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kdlgia/search/diamondData.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';

Future<DiamondData> fetchDataSearchDiamond(
    String token, {String searchQuerry = ""}) async {
  String url = 'https://www.kdlgia.com/diamond/?q_is_schv=1&pdflink=1&cols=dia_kts&$searchQuerry&out_type=json';
  print(url);
  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );

     // print(response.statusCode);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      // Check if the data is empty
      if (jsonData['total'] == 0 || jsonData['csv'] == "") {
        // print("************************************************Data is here");
        // print("No data found.");
        return DiamondData(
          s: jsonData['s'],
          m: jsonData['m'],
          cartNum: 0,
          total: 0,
          perPage: 0,
          page: 0,
          pages: 0,
          diamonds: [],
        );
      }

      List<dynamic> data = jsonData['data']['csv'];

      List<Diamond> diamondList = [];
      for (int i = 1; i < data.length; i++) {
        diamondList.add(Diamond.fromJson(data[i]));
      }  
      // print(diamondList[0].dia_kts);

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

      // print("********************************************************************");
      // print(diamondData.total);

      return diamondData;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
