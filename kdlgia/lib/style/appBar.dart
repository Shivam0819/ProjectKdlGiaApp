import 'package:flutter/material.dart';

AppBar customAppBar(){
  return AppBar(
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
                    color: Color.fromRGBO(4, 138, 180, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "kdlsales18@gmail.com",
                  style: TextStyle(
                    color: Color.fromRGBO(9, 43, 53, 1),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        
      );
}