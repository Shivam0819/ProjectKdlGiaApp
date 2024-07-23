import 'package:flutter/material.dart';
import 'package:kdlgia/registeration/login_page.dart';
import 'package:kdlgia/style/search_card_ui.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thank You'),
      ),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: mainColor,
              size: 50,
            ),
            const SizedBox(height: 20),
            const Text(
              'Thank you for registeration!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your account is temporarily unavailable.\nPlease wait patiently to be allowed.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous page or any other action
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
              },
              child:const Text('Log Out'),
            ),
          ],
        ),
        )
      );
    
  }
}
