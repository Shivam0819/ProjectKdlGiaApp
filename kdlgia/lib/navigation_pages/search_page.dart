import 'package:flutter/material.dart';
import 'package:kdlgia/search_navigation_ui/search_ui.dart';
// Alias for color.dart

class SearchPage extends StatefulWidget {
  // const SearchPage({Key? key}) : super(key: key);
    final String token;
    const SearchPage({super.key, 
      required this.token

    });

  
  

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    

  @override
  Widget build(BuildContext context) {
    return SearchUi(token: widget.token,);
  }
}
