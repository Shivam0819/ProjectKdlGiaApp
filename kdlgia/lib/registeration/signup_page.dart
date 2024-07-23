import 'package:flutter/material.dart';
import 'package:kdlgia/registeration/login_page.dart';
import 'package:kdlgia/registeration/signUpApi.dart';
import 'package:kdlgia/registeration/thank.dart';

import 'package:kdlgia/style/constant.dart';
import 'package:kdlgia/style/search_card_ui.dart'; // Ensure this imports your style constants

class SignUpPage extends StatefulWidget {
  final Map<String, dynamic> imageToken;

  SignUpPage({Key? key, required this.imageToken}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _realNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController =
      TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _captchaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            color: mainColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildTextField(_realNameController, 'Real Name', Icons.person),
              _buildTextField(_usernameController, 'Username', Icons.person,
                  hint:
                      "Between 3-15 characters, letters, numbers, underscores"),
              _buildPasswordField(_passwordController, 'Password', Icons.lock,
                  hint: "Between 6-16 characters, letters, numbers, symbols"),
              _buildPasswordField(
                  _retypePasswordController, 'Retype Password', Icons.lock,
                  hint: "Same as above password"),
              _buildTextField(_mobileController, 'Mobile', Icons.phone),
              _buildTextField(_companyController, 'Company', Icons.business),
              if (widget.imageToken['imageBytes'] != null)
                Image.memory(widget.imageToken['imageBytes']),
              _buildTextField(_captchaController, 'CAPTCHA', Icons.security),
              SizedBox(height: sizedBoxHeight),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Implement sign-up functionality here
                    String realName = _realNameController.text;
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    String retypePassword = _retypePasswordController.text;
                    String mobile = _mobileController.text;
                    String company = _companyController.text;
                    String captcha = _captchaController.text;
                    // Here you can perform validation and sign up the user

                    if (password == retypePassword) {
                      print('Real Name: $realName');
                      print('Username: $username');
                      print('Password: $password');
                      print('Retype Password: $retypePassword');
                      print('Mobile: $mobile');
                      print('Company: $company');
                      print('CAPTCHA: $captcha');
                      var response = registerUser(
                          widget.imageToken['cookie'],
                          realName,
                          username,
                          password,
                          retypePassword,
                          mobile,
                          company,
                          captcha);
                      response.then((value) => {
                            if (value.status == '1' || value.status == 1)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value.message))),
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ThankYouPage()),
                                    (route) => false)
                              }
                            else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value.message))),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()))
                              }
                          });
                    } else {
                      // SnackBar(content: ,)
                    }
                  }
                },
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {String hint = ""}) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon),
            hintText: hint,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
        SizedBox(height: sizedBoxHeight),
      ],
    );
  }

  Widget _buildPasswordField(
      TextEditingController controller, String label, IconData icon,
      {String hint = ""}) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon),
            hintText: hint,
          ),
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            } else {
              if (value.length < 6) {
                return 'Between 6-16 characters is permitted';
              }
            }
            return null;
          },
        ),
        SizedBox(height: sizedBoxHeight),
      ],
    );
  }
}
