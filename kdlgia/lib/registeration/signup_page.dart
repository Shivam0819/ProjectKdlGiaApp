import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _realNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _retypePasswordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _captchaController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _realNameController,
              decoration: const InputDecoration(
                labelText: 'Real Name',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _retypePasswordController,
              decoration: const InputDecoration(
                labelText: 'Retype Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _mobileController,
              decoration: const InputDecoration(
                labelText: 'Mobile',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _companyController,
              decoration: const InputDecoration(
                labelText: 'Company',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _captchaController,
              decoration: const InputDecoration(
                labelText: 'CAPTCHA',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement sign-up functionality here
                String realName = _realNameController.text;
                String username = _usernameController.text;
                String password = _passwordController.text;
                String retypePassword = _retypePasswordController.text;
                String mobile = _mobileController.text;
                String company = _companyController.text;
                String captcha = _captchaController.text;
                // Here you can perform validation and sign up the user
                print('Real Name: $realName');
                print('Username: $username');
                print('Password: $password');
                print('Retype Password: $retypePassword');
                print('Mobile: $mobile');
                print('Company: $company');
                print('CAPTCHA: $captcha');
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: SignUpPage(),
//   ));
// }
