import 'package:flutter/material.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';
import 'package:kdlgia/registeration/signup_page.dart';
import 'package:kdlgia/style/constant.dart';
import 'package:kdlgia/style/search_card_ui.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({ super.key });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align items to start and end
          children: [
            Padding(
                padding: const EdgeInsets.all(paddingCard),
                child: Card(
                  child: Image.asset(
                    'assets/Images/company_logo.png',
                    height: 30,
                  ),
                )),
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       // Add code to handle logout
            //     },
            //     child: Card(
            //       elevation: 4,
            //       shape: CircleBorder(),
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Icon(
            //           Icons.exit_to_app,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Login Page',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: sizedBoxHeight),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                   SizedBox(height: sizedBoxHeight),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                   SizedBox(height: sizedBoxHeight),
                  ElevatedButton(
                    onPressed: () {
                      // print("Traped");
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      if (username.isNotEmpty && password.isNotEmpty) {
                        // Navigate to the next screen and remove all previous routes from the stack
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                          (Route)=>false
                          
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),
                  SizedBox(height: sizedBoxHeight),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())); // Replace '/signup' with your signup screen route
                    },
                    child: const Text('Create an account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
}

// class LoginPage extends StatelessWidget {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

