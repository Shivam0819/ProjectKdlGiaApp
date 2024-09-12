import 'dart:convert';
import 'package:http/http.dart' as http;


Future<String> fetchDnaData(
    String token, String dia_id) async {
  String url = 'https://www.kdlgia.com/user/info/get_dna/?is_json=1&qid=$dia_id';
  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {'Mob-Token': token},
    );

     // print(response.statusCode);

    if (response.statusCode == 200) {
      
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      // print(jsonData["link"]);
      return jsonData["link"];
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Error fetching data: $e');
  }
}
