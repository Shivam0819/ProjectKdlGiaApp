import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdlgia/navigation_pages/cart_page.dart';
import 'package:kdlgia/order_status/order_api.dart';
import 'package:kdlgia/order_status/order_data.dart';
import 'package:kdlgia/style/search_card_ui.dart';

class OrderResult extends StatefulWidget {
  final String token;
  final String querryUrl;

  OrderResult({
    super.key,
    required this.token,
    required this.querryUrl,
  });
  @override
  _OrderResultState createState() => _OrderResultState();
}

class _OrderResultState extends State<OrderResult> {
  late Map<int, bool> isCheckedMap =
      {}; // Map to store isChecked state for each Diamond item
  late Map<int, bool> isStaredMap = {};
  bool _isExpanded = false;
  int _currentPage = 1;
  bool _isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();
  late final Future<List<Order>> _order;
  late OrderData orderData;

  @override
  void initState() {
    super.initState();
    _order = orderFatchApi(widget.token).then((value){
       orderData =  value;
       print(orderData);
       print(orderData.order);
       return orderData.order;
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoadingMore) {
      _fetchMoreData();
    }
  }

  Future<void> _fetchMoreData() async {
    if (_currentPage < orderData.pages) {
      setState(() {
        _isLoadingMore = true;
      });

      _currentPage++;
      // Simulate network request delay
      await Future.delayed(Duration(seconds: 2));

      // Fetch more data from the API and add it to the list
      OrderData newDiamondData = await orderFatchApi(widget.token);
      setState(() {
        // _order(newDiamondData.order);
        _isLoadingMore = false;
      });
    }
  }



  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Card(
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the back button is pressed
            },
            color: Colors.black, // Customize the color of the back button
          ),
        ),
        title: Text("Result"),
        centerTitle: true,
      ),
      body: FutureBuilder(future: _order, builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return Text("data");
        }
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(paddingCard),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  // Add functionality here
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopify),
                    SizedBox(height: 2),
                    Text('Order'),
                  ],
                ),
              ),
              TextButton(
                onPressed: null,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save_rounded),
                    SizedBox(height: 2),
                    Text('Save Search'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartPage(
                                token: widget.token,
                              )));
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(height: 2),
                    Text('Cart'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
