import 'package:flutter/material.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';
import 'package:kdlgia/registeration/contact_us.dart';
import 'package:kdlgia/registeration/signUpApi.dart';
import 'package:kdlgia/registeration/signup_page.dart';
import 'package:kdlgia/style/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  double _currentScale = 1.0; // Current scale of the image
  bool _isZoomedIn = false; // Flag to track if the image is zoomed in
  @override
  void initState() {
    super.initState();
    _loadCredentials();
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/Images/company_logo.png',
                height: 40,
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
                  "kdlsales18@gmail.com",
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
                              _saveCredentials(
                                  username, password); // Save credentials
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
                                    'Login failed. Please try again.',
                                  ),
                                ),
                              );
                            }
                          }).catchError((error) {
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
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: mainColor),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.black,
                        insetPadding: EdgeInsets.all(2),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pop(); // Close the full-screen image on tap outside
                          },
                          child: PhotoView(
                            imageProvider: AssetImage(
                                "assets/logo/show.jpeg"), // Replace with your image asset
                            backgroundDecoration: BoxDecoration(
                                color: Colors
                                    .black), // Background color of the viewer
                            minScale: PhotoViewComputedScale
                                .contained, // Minimum zoom scale
                            maxScale: PhotoViewComputedScale.covered *
                                2.0, // Maximum zoom scale
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo/show.jpeg", // Replace with your image asset
                      // width: 200, // Initial size of the image
                      // height: 200,
                    ),
                    const Center(
                      child: Text(
                        "Click Here",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              )
            
            ],
          ),
        ),
      ),
    // bottomNavigationBar: Padding(
    //     padding: const EdgeInsets.all(
    //         paddingCard), // Adjust the bottom padding as needed
    //     child: Container(
    //       height: 80, // Adjust the height as needed
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(20), // Add rounded corners
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey.withOpacity(0.5),
    //             spreadRadius: 2,
    //             blurRadius: 5,
    //             offset: const Offset(0, 3), // changes position of shadow
    //           ),
    //         ],
    //       ),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           TextButton(
    //             onPressed: () {
    //               // Navigator.pushAndRemoveUntil(
    //               //   context,
    //               //   MaterialPageRoute(
    //               //       builder: (context) => HomePage(
    //               //             token: widget.token,
    //               //           )),
    //               //   (route) => false,
    //               // );
    //             },
    //             child: const Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(Icons.info),
    //                 SizedBox(
    //                   height: 2,
    //                 ), // Add some space between the icon and text
    //                 Text('About Us'),
    //               ],
    //             ),
    //           ),
    //           // TextButton(
    //           //   onPressed: () {
    //           //     // Navigator.push(
    //           //     //     context,
    //           //     //     MaterialPageRoute(
    //           //     //         builder: (context) => SearchPage(
    //           //     //               token: widget.token,
    //           //     //             )));
    //           //   },
    //           //   child: const Column(
    //           //     mainAxisAlignment: MainAxisAlignment.center,
    //           //     children: [
    //           //       Icon(Icons.search_rounded),
    //           //       SizedBox(
    //           //         height: 2,
    //           //       ), // Add some space between the icon and text
    //           //       Text('Search'),
    //           //     ],
    //           //   ),
    //           // ),
    //           TextButton(
    //             onPressed: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => ContactUs(
    //                           // token: widget.token,
    //                         )),
    //               );
    //             },
    //             child: const Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(Icons.call),
    //                 SizedBox(
    //                   height: 2,
    //                 ), // Add some space between the icon and text
    //                 Text('Contact Us'),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    );
  }
}
