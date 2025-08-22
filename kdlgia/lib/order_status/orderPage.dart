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
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        flexibleSpace: Image.asset(
          'assets/Images/bg-pattern.png',
          fit: BoxFit.cover,
        ),
        elevation: 0,
        leading: Card(
          color: secondaryColor, // Set background to mainColor
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Navigate back when the back button is pressed
            },
            color: logoMachingColor, // Customize the color of the back button
          ),
        ),
        title: const Text(
          'Order Status',
          style: TextStyle(color: logoMachingColor),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/bg-pattern.png'),
            fit: BoxFit.fill, // makes the image fill the area
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(paddingCard),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                                token: widget.token,
                                querryUrl: url,
                                headinAppBar: "All Orders",
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(paddingInsidCard),
                  child: Container(
                    padding: const EdgeInsets.all(paddingInsidCard),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            TextStyleHeader(
                              text: "All Orders",
                              colors: logoMachingColor,
                            ),
                            Spacer(), // Use Spacer widget to fill available space
                            Icon(
                              Icons.arrow_forward_ios,
                              color: logoMachingColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                                token: widget.token,
                                querryUrl: urlWaitingForPickUp,
                                headinAppBar: "Waiting For Pickup",
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(paddingInsidCard),
                  child: Container(
                    padding: const EdgeInsets.all(paddingInsidCard),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Column(
                      children: [
                        Row(
                          children: [
                            TextStyleHeader(
                              text: "Waiting For Pickup",
                              colors: logoMachingColor,
                            ),
                            Spacer(), // Use Spacer widget to fill available space
                            Icon(
                              Icons.arrow_forward_ios,
                              color: logoMachingColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                                token: widget.token,
                                querryUrl: urlPickedUp,
                                headinAppBar: "Picked Up",
                              )));
                },
                child:   Padding(
                  padding: const EdgeInsets.all(paddingInsidCard),
                  child:Container(
                                      padding: const EdgeInsets.all(paddingInsidCard),

                    decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Picked Up",
                            colors: logoMachingColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: logoMachingColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                                token: widget.token,
                                querryUrl: urlCompleted,
                                headinAppBar: "Completed Order",
                              )));
                },
                child:   Padding(
                  padding: const EdgeInsets.all(paddingInsidCard),
                  child:Container(
                                      padding: const EdgeInsets.all(paddingInsidCard),

                    decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Completed",
                            colors: logoMachingColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: logoMachingColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                                token: widget.token,
                                querryUrl: urlCancelled,
                                headinAppBar: "Cancelled Order",
                              )));
                },
                child:   Padding(
                  padding: const EdgeInsets.all(paddingInsidCard),
                  child:Container(
                                      padding: const EdgeInsets.all(paddingInsidCard),

                    decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Canceled",
                            colors: logoMachingColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: logoMachingColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderResult(
                                token: widget.token,
                                querryUrl: urlReturn,
                                headinAppBar: "Return Order",
                              )));
                },
                child:   Padding(
                  padding: const EdgeInsets.all(paddingInsidCard),
                  child:Container(
                                      padding: const EdgeInsets.all(paddingInsidCard),

                    decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child:const Column(
                    children: [
                      Row(
                        children: [
                          TextStyleHeader(
                            text: "Return",
                            colors: logoMachingColor,
                          ),
                          Spacer(), // Use Spacer widget to fill available space
                          Icon(
                            Icons.arrow_forward_ios,
                            color: logoMachingColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/bg-pattern.png'),
            fit: BoxFit.fill, // makes the image fill the area
          ),
        ),
        child: Padding(
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
                              )),
                      (route) => false,
                    );
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_rounded,
                        color: logoMachingColor,
                      ),
                      SizedBox(
                        height: 2,
                      ), // Add some space between the icon and text
                      Text(
                        'Home',
                        style: TextStyle(color: logoMachingColor),
                      ),
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
                      Icon(
                        Icons.search_rounded,
                        color: logoMachingColor,
                      ),
                      SizedBox(
                        height: 2,
                      ), // Add some space between the icon and text
                      Text(
                        'Search',
                        style: TextStyle(color: logoMachingColor),
                      ),
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
                      Icon(
                        Icons.shopping_cart_rounded,
                        color: logoMachingColor,
                      ),
                      SizedBox(
                        height: 2,
                      ), // Add some space between the icon and text
                      Text(
                        'Cart',
                        style: TextStyle(color: logoMachingColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
