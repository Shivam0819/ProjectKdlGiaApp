import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kdlgia/user/userProfile.dart';

class ApiService {
  static const String apiUrl = 'https://www.kdlgia.com/user/info';
  // static const String apiUrlCustomerSupport = 'https://www.kdlgia.com/user/';


  static Future<UserProfile> fetchUserProfile(String token) async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Mob-Token': token}, // Pass token directly
    );

    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> data = jsonDecode(response.body);
      // print(response.contentLength);
      final userProfile = UserProfile.fromJson(data['data']);
      // print("************************${userProfile.salesPhone}");
      return userProfile;
    } else {
      throw Exception('Failed to load user profile');
    }
  }

  // static Future<void> fetchUserCustomerHelp(String token) async {
  //   final response = await http.get(
  //     Uri.parse(apiUrlCustomerSupport),
  //     headers: {'Mob-Token': token}, // Pass token directly
  //   );
  //   print("Customer Support");
  //   print(response.statusCode);

  //   if (response.statusCode == 200) {
  //     print(response.contentLength);
  //     print(response.body);

  //     // final Map<String, dynamic> data = jsonDecode(response.body);
  //     // print(data);
  //     // final userProfile = UserProfile.fromJson(data['data']);
  //     // print("************************${userProfile.salesPhone}");
  //     // return userProfile;
  //   } else {
  //     throw Exception('Failed to load user profile');
  //   }
  // }
}
