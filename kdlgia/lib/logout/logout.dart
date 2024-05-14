// import 'package:flutter/material.dart';
// import 'package:kdlgia/registeration/login_page.dart';

// class LogoutButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final BuildContext context;

//   LogoutButton({required this.context, this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.logout),
//       onPressed: () {
//         _logout(context); // Call the _logout method directly
//         if (onPressed != null) {
//           onPressed(); // Call the provided callback function if not null
//         }
//       },
//     );
//   }

//   void _logout(BuildContext context) {
//     // Your logout logic here...
//     // For example, clear session and navigate to login screen
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => LoginPage(),
//       ),
//     );
//   }
// }
