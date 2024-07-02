import 'package:flutter/material.dart';
import 'package:kdlgia/navigation_pages/cart_page.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';
import 'package:kdlgia/navigation_pages/search_page.dart';
import 'package:kdlgia/order_status/orderResult.dart';
import 'package:kdlgia/order_status/order_data.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/textStyle.dart';

class OrderPage extends StatefulWidget {
  String token;
  OrderPage({Key? key, required this.token}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int status = 0;
  String url = "";
  String urlWaitingForPickUp = "q_ord_st=2";
  String urlPickedUp = "q_ord_st=3";
  String urlCompleted = "q_ord_st=4";
  String urlCancelled = "q_ord_st=20";
  String urlReturn = "q_ord_st=21";

  // late OrderData orderData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Status'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(paddingCard),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                              token: widget.token, querryUrl: url, headinAppBar: "All Orders",)));
                },
                child: const Padding(
                  padding: EdgeInsets.all(paddingInsidCard),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "All Orders",
                            colors: mainColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                              token: widget.token, querryUrl: urlWaitingForPickUp, headinAppBar: "Waiting For Pickup",)));
                },
                child: const Padding(
                  padding: EdgeInsets.all(paddingInsidCard),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Waiting For Pickup",
                            colors: mainColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                              token: widget.token, querryUrl: urlPickedUp, headinAppBar: "Picked Up",)));
                },                child: const Padding(
                  padding: EdgeInsets.all(paddingInsidCard),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Picked Up",
                            colors: mainColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                              token: widget.token, querryUrl: urlCompleted, headinAppBar: "Completed Order",)));
                },
                child: const Padding(
                  padding: EdgeInsets.all(paddingInsidCard),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Completed",
                            colors: mainColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                              token: widget.token, querryUrl: urlCancelled, headinAppBar: "Cancelled Order",)));
                },
                child: const Padding(
                  padding: EdgeInsets.all(paddingInsidCard),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Canceled",
                            colors: mainColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                              token: widget.token, querryUrl: urlReturn, headinAppBar: "Return Order",)));
                },
                child: const Padding(
                  padding: EdgeInsets.all(paddingInsidCard),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Return",
                            colors: mainColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: mainColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
            paddingCard), // Adjust the bottom padding as needed
        child: Container(
          height: 80, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Add rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                token: widget.token,
                              )),(route) => false,);
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_rounded),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text('Home'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                token: widget.token,
                              )));
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_rounded),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text('Search'),
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
                    Icon(Icons.shopping_cart_rounded),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
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
