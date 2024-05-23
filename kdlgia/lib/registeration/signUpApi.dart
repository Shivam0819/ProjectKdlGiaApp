import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<void> registerUser(String token,  String userRealName, String userName, String userPwd, String userPwd2, String userPhone,String company, String userCode) async {
  final String url = 'https://www.kdlgia.com/register?is_json=1';
  final Map<String, String> headers = {
    'Cookie': token,
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  final Map<String, String> body = {
    'user_name': userName,
    'user_real_name': userRealName,
    'user_pwd': userPwd,
    'user_pwd2': userPwd2,
    'user_phone': userPhone,
    'user_company':company,
    'user_code': userCode
  };

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    print('Response data: $responseData');
    // Handle the response data as needed
  } else {
    print('Request failed with status: ${response.statusCode}');
    // Handle the error as needed
  }
}

Future<Map<String, dynamic>> fetchCaptcha() async {
  final String url = 'https://www.kdlgia.com/code/code/register?is_json=1';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    final String base64Image = responseData['Image'];
    final String cookie = responseData['Cookie'];

    // Decode the base64 image
    Uint8List imageBytes = base64Decode(base64Image.split(',')[1]);

    return {'imageBytes': imageBytes, 'cookie': cookie};
  } else {
    throw Exception('Failed to load captcha');
  }
}