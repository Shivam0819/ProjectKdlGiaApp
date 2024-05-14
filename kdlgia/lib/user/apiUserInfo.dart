import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kdlgia/user/userProfile.dart';

class ApiService {
  static const String apiUrl = 'https://www.kdlgia.com/user/info';

  static Future<UserProfile> fetchUserProfile(String token) async {
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Mob-Token': token}, // Pass token directly
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      final userProfile = UserProfile.fromJson(data['data']);
      print("************************${userProfile.salesPhone}");
      return userProfile;
    } else {
      throw Exception('Failed to load user profile');
    }
  }
}
