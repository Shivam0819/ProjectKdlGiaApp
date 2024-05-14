import 'package:flutter/material.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';
import 'package:kdlgia/registeration/signup_page.dart';
import 'package:kdlgia/style/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kdlgia/style/search_card_ui.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<Map<String, String>> login(String username, String password) async {
    String url = 'https://www.kdlgia.com/login';
    Map<String, String> headers = {
      'Accept': 'application/json, text/javascript, */*; q=0.01',
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    };
    Map<String, String> body = {
      'miniapp': 'mob',
      'user_name': username,
      'user_pwd': password,
    };

    try {
      http.Response response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      // Now you can access individual fields of the decoded response
      String message = jsonResponse['m']; // "Login successful"
      int status = jsonResponse['s']; // 1
      String url_r = jsonResponse['url']; // "/user/"
      String mobToken = jsonResponse['data']['Mob-Token'];

      print('Message: $message');
      print('Status: $status');
      print('URL: $url_r');
      print('Mob Token: $mobToken');

      Map<String, String> results = {
        "Message": message,
        'Status': status.toString(),
        'Url': url_r,
        'MobToken': mobToken
      };

      return results;
    } catch (e) {
      // An error occurred during the HTTP request, handle it here
      print('Error: $e');
      // You can return an error response or re-throw the exception here
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login Page',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: sizedBoxHeight * 2),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: sizedBoxHeight),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: sizedBoxHeight * 2),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        String username = _usernameController.text.trim();
                        String password = _passwordController.text.trim();

                        if (username.isNotEmpty && password.isNotEmpty) {
                          login(username, password).then((response) {
                            if (response["Status"] == "1") {
                          

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                        token:
                                            response["MobToken"].toString())),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Login failed. Please try again.')),
                              );
                            }
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'An error occurred. Please try again later.')),
                            );
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Please enter username and password.')),
                          );
                        }
                      },
                      child: Card(
                        elevation: elevationOfCard,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Adjust the width as needed
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        return null;
                      },
                      child: Card(
                        elevation: elevationOfCard,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: sizedBoxHeight),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                  },
                  child: const Text('Forgot password?'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
