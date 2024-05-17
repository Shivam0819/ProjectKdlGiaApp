import 'package:flutter/material.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';
import 'package:kdlgia/style/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:kdlgia/style/search_card_ui.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

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
      String urlR = jsonResponse['url']; // "/user/"
      String mobToken = jsonResponse['data']['Mob-Token'];

      // print('Message: $message');
      // print('Status: $status');
      // print('URL: $url_r');
      // print('Mob Token: $mobToken');

      Map<String, String> results = {
        "Message": message,
        'Status': status.toString(),
        'Url': urlR,
        'MobToken': mobToken
      };

      return results;
    } catch (e) {
      // An error occurred during the HTTP request, handle it here
      print('Error: $e');
      // You can return an error response or re-throw the exception here
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Image.asset(
                  'assets/Images/company_logo.png',
                  height: 30,
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "KDL Gia",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "kdlgia17@gmail.com",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Log In',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 25,
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
                                const SnackBar(
                                    content: Text(
                                        'Login failed. Please try again.')),
                              );
                            }
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'An error occurred. Please try again later.')),
                            );
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'Please enter username and password.')),
                          );
                        }
                      },
                      child: const Card.filled(
                        color: mainColor,
                        elevation: elevationOfCard,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10), // Adjust the width as needed
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        return;
                      },
                      child: const Card.filled(
                        color: Colors.white,
                        elevation: elevationOfCard,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: mainColor
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
                  child: const Text('Forgot password?', style: TextStyle(color: mainColor),),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
            paddingCard), // Adjust the bottom padding as needed
        child: Container(
          height: 80, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Add rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  // setState(() {});
                  // Add your onPressed callback here
                },
                child: const Column(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text('About Us'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // setState(() {});
                  // Add your onPressed callback here
                },
                child: const Column(
                  children: [
                    Icon(Icons.emoji_events_outlined),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text('Achievements'),
                  ],
                ),
              ),
              
              TextButton(
                onPressed: () {
                  // Add your onPressed callback here
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SearchPage(diamondsFuture: diamondsFuture,)),
                  // );
                },
                child: const Column(
                  children: [
                    Icon(Icons.call),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text('Contact Us'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
