import 'package:flutter/material.dart';
import 'package:kdlgia/registeration/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KDLGia',
      home: LoginPage(),
      theme: ThemeData(
      primarySwatch: Colors.blue,
  ),
      
    );
  }
}




