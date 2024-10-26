import 'package:flutter/material.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';

import 'package:kdlgia/registeration/about_us.dart';
import 'package:kdlgia/registeration/contact_us.dart';
import 'package:kdlgia/registeration/signUpApi.dart';
import 'package:kdlgia/registeration/signup_page.dart';
import 'package:kdlgia/style/constant.dart';
import 'package:http/http.dart' as http;
import 'package:kdlgia/style/search_card_ui.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

// To update the app
import 'package:in_app_update/in_app_update.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _checkForUpdate() async {
    try {
      final appUpdateInfo = await InAppUpdate.checkForUpdate();
      if (appUpdateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        await InAppUpdate.startFlexibleUpdate().then((_) async {
          await InAppUpdate.completeFlexibleUpdate();
        });
      }
    } catch (e) {
      print("Error checking for update: $e"); 
    }
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  bool _isLoading = false; // Track loading state
  bool _isPasswordVisible = false; // To toggle password visibility


  @override
  void initState() {
    super.initState();
    
    _loadCredentials();
    _checkForUpdate();
  }

  Future<void> _loadCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final password = prefs.getString('password');

    if (username != null && password != null) {
      setState(() {
        _usernameController.text = username;
        _passwordController.text = password;
      });
    }
  }

  Future<void> _saveCredentials(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

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

      String message = jsonResponse['m']; // "Login successful"
      int status = jsonResponse['s']; // 1
      String urlR = jsonResponse['url']; // "/user/"
      String mobToken = jsonResponse['data']['Mob-Token'];

      Map<String, String> results = {
        "Message": message,
        'Status': status.toString(),
        'Url': urlR,
        'MobToken': mobToken
      };

      return results;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Welcome',
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
                  obscureText: !_isPasswordVisible, // Hide password by default
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: sizedBoxHeight * 2),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: _isLoading
                            ? null
                            : () {
                                String username = _usernameController.text.trim();
                                String password = _passwordController.text.trim();

                                if (username.isNotEmpty && password.isNotEmpty) {
                                  setState(() {
                                    _isLoading = true; // Start loading
                                  });

                                  login(username, password).then((response) {
                                    setState(() {
                                      _isLoading = false; // Stop loading
                                    });
                                     print(response);
                                    if (response["Status"] == "1") {
                                      _saveCredentials(username, password); // Save credentials
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(
                                            token: response["MobToken"].toString(),
                                          ),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Login failed. Please check User ID or Password.',
                                          ),
                                        ),
                                      );
                                    }
                                  }).catchError((error) {
                                    setState(() {
                                      _isLoading = false; // Stop loading
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'An error occurred. Please try again later.',
                                        ),
                                      ),
                                    );
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please enter username and password.',
                                      ),
                                    ),
                                  );
                                }
                              },
                        child: Card.filled(
                          color: mainColor,
                          elevation: elevationOfCard,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.0,
                                      ),
                                    )
                                  : const Text(
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
                    const SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          fetchCaptcha().then((value) => {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SignUpPage(imageToken: value),
                                  ),
                                )
                              });
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
                                  color: mainColor,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactUs()));
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(color: mainColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(paddingCard), 
        child: Container(
          height: 80, 
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), 
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutUsPage()),
                  );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info),
                    SizedBox(height: 2),
                    Text('About Us'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactUs()),
                  );
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.call),
                    SizedBox(height: 2),
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
