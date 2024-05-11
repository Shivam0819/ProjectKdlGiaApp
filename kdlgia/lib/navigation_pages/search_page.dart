import 'package:flutter/material.dart';
import 'package:kdlgia/diamond_search/search_card.dart';
import 'package:kdlgia/search_navigation_ui/search_ui.dart';
// Alias for color.dart

class SearchPage extends StatefulWidget {
  // const SearchPage({Key? key}) : super(key: key);
    late Future<List<Diamond>> diamondsFuture;
    var length;
    SearchPage({super.key, 
      required this.diamondsFuture

    });

  
  

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
    

  @override
  Widget build(BuildContext context) {
    return SearchUi();
  }
}
