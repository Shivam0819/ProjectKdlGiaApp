import 'package:flutter/material.dart';
import 'package:kdlgia/cart/cartApi.dart';
import 'package:kdlgia/cart/cartData.dart';
import 'package:kdlgia/navigation_pages/cart_page.dart';
import 'package:kdlgia/navigation_pages/search_page.dart';
import 'package:kdlgia/registeration/login_page.dart';
import 'package:kdlgia/search/apiDiamondSerach.dart';
import 'package:kdlgia/search/diamondData.dart';
import 'package:kdlgia/search/searchTemp.dart';
import 'package:kdlgia/style/cardDetail.dart';
import 'package:kdlgia/style/constant.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/textStyle.dart';
import 'package:kdlgia/user/profile.dart'; // Import the search page

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({super.key, required this.token});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = false;
  bool isStockNoSelected = true;
  bool orderSummaryDetailIsSelected = false;
  bool userSummaruIsSelected = false;
  String searchByReferance = "id";
  late final TextEditingController _searchQuerry = TextEditingController();

  late Future<DiamondData> diamondsFuture;
  late Future<CartResponse> cartResponse;
  late int stockWehave;
  @override
  void initState() {
    super.initState();
    diamondsFuture = fetchDataSearchDiamond(widget.token, );
    cartResponse = showCarts(widget.token);
  }

  @override
  void dispose() {
    _searchQuerry.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Image.asset(
                  'assets/Images/company_logo.png',
                  height: 30,
                ),
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "KDL Gia",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "kdlgia17@gmail.com",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Settings', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            onSelected: (String choice) {
              // Handle the selected choice
              switch (choice) {
                case 'Profile':
                  // Navigate to profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProfilePage(
                        token: widget.token,
                      ),
                    ),
                  );
                  break;
                case 'Settings':
                  // Navigate to settings page
                  break;
                case 'Logout':
                  // Perform logout action
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage(),
                    ),
                  );
                  break;
              }
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap:
                  true, // Ensure the GridView occupies only the space it needs
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling if needed
              children: [
                // const Padding(
                //   padding: EdgeInsets.all(paddingCard),
                //   child: Card(
                //     child:
                //         Center(child: TextStyleHeader(text: "Arriving Soon")),
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.all(paddingCard),
                //   child: Card(
                //     child: Center(child: TextStyleHeader(text: "Pair")),
                //   ),
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SearchPage(token: widget.token,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(paddingCard),
                    child: Card(
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/app_icons/search.png",
                            height: 60,
                            color: mainColor,
                          ),
                          const TextStyleHeader(
                            text: "Stock Search",
                            colors: mainColor,
                            fontWeight: FontWeight.normal,
                          ),
                          
                          FutureBuilder(future: diamondsFuture, builder: (context, snapshot){
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return const Center(
                                child: CircularProgressIndicator(),
                              );

                            }else{
                              return TextStyleHeader(
                            text: snapshot.data!.total.toString(),
                            colors: mainColor,
                            fontWeight: FontWeight.normal,
                          );

                            }
                          }
                          
                          )
                          
                        ],
                      )),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CartPage(token: widget.token,)));
                  },
               child:  const Padding(
                  padding: EdgeInsets.all(paddingCard),
                  child: Card(
                    child: Center(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_checkout_outlined,
                            size: 60, color: mainColor),
                        TextStyleHeader(
                          text: "Cart",
                          colors: mainColor,
                          fontWeight: FontWeight.normal,
                        ),
                        // FutureBuilder(future: cartResponse, builder: (context, snapshot){
                        //     if(snapshot.connectionState == ConnectionState.waiting){
                        //       return const Center(
                        //         child: CircularProgressIndicator(),
                        //       );

                        //     }else{
                        //       return TextStyleHeader(
                        //     text: snapshot.data!.cart.item.length.toString(),
                        //     colors: mainColor,
                        //     fontWeight: FontWeight.normal,
                        //   );

                        //     }
                        //   }
                          
                        //   )
                      ],
                    )),
                  ),
                ),
                )
                // Add more children as needed
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(paddingCard),
                  child: Card(
                      child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded =
                                !isExpanded; // Toggle the expansion state
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const TextStyleHeader(
                                    text: "Referance Search",
                                    colors:mainColor,
                                        
                                  ),
                                  const Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    isExpanded
                                        ? Icons.arrow_upward_rounded
                                        : Icons.arrow_downward_rounded,color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isExpanded)
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Search By",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 10),
                                  TextButton(
                                    onPressed: () {
                                      isStockNoSelected = true;
                                      searchByReferance = "id";
                                      setState(() {});
                                    },
                                    child: Text(
                                      "Stock Id",
                                      style: TextStyle(
                                          color: isStockNoSelected
                                              ? mainColor
                                              : Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      isStockNoSelected = false;
                                      searchByReferance = "report_no";

                                      setState(() {});
                                    },
                                    child: Text(
                                      "Cert No",
                                      style: TextStyle(
                                          color: isStockNoSelected
                                              ? Colors.black
                                              : mainColor),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 350, // Set the width of the container
                                child: TextField(
                                  controller: _searchQuerry,
                                  decoration: const InputDecoration(
                                    labelText: 'Search Here',
                                    hintText: 'Space or newline separated list',

                                    border:
                                        OutlineInputBorder(), // You can choose any border type
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height:
                                      sizedBoxHeight), // Add some space between the TextField and the search button

                              SizedBox(
                                width: 350,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add your search functionality here
                                    String querry =
                                        "q_id=${_searchQuerry.text.toString()}&q_id_type=${searchByReferance.toString()}";
                                        showCarts(widget.token);
                                    fetchDataSearchDiamond(widget.token, searchQuerry: querry)
                                        .then((diamondData) {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SearchResultsTemp(
                                            diamondData: diamondData, token: widget.token, querryUrl: querry,
                                          ),
                                        ),
                                      );
                                    }).catchError((error) {
                                      // Handle error
                                      print('Error: $error');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'An error occurred. Please try again later.'),
                                        ),
                                      );
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        mainColor, // Background color of the button
                                  ),
                                  child: const Text(
                                    'Search',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),

                              // Add more ListTile widgets for additional details
                            ],
                          ),
                        )
                    ],
                  )),
                ),
              ],
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(paddingCard),
                child: Card(
                  child: Column(
                    children: [
                      const TextStyleHeader(text: "KDL Gia Exclusive Diamond"),
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap:
                            true, // Ensure the GridView occupies only the space it needs
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Image.asset("assets/Images/company_logo.png"),
                          Container(
                            child: const Text("All the api Data"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap:
                  true, // Ensure the GridView occupies only the space it needs
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling if needed
              children: const [
                Padding(
                  padding: EdgeInsets.all(paddingCard),
                  child: Card(
                    child: Center(child: TextStyleHeader(text: "Flewless")),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(paddingCard),
                  child: Card(
                    child: Center(
                        child: TextStyleHeader(
                      text: "Wish List",
                    )),
                  ),
                ),

                // Add more children as needed
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(paddingCard),
                  child: Card(
                      child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            orderSummaryDetailIsSelected =
                                !orderSummaryDetailIsSelected; // Toggle the expansion state
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const TextStyleHeader(
                                    text: "Order Summery Detail",
                                    colors: mainColor,
                                  ),
                                  const Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    orderSummaryDetailIsSelected
                                        ? Icons.arrow_upward_rounded
                                        : Icons.arrow_downward_rounded,color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (orderSummaryDetailIsSelected)
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "Order Summery will be here",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),

                              // Add more ListTile widgets for additional details
                            ],
                          ),
                        )
                    ],
                  )),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(paddingCard),
                  child: Card(
                      child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            userSummaruIsSelected =
                                !userSummaruIsSelected; // Toggle the expansion state
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const TextStyleHeader(
                                    text: "User Summery",
                                    colors: mainColor,
                                  ),
                                  const Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    userSummaruIsSelected
                                        ? Icons.arrow_upward_rounded
                                        : Icons.arrow_downward_rounded,color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (userSummaruIsSelected)
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User Summery will here",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),

                              // Add more ListTile widgets for additional details
                            ],
                          ),
                        )
                    ],
                  )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(paddingCard),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextStyleHeader(text: "Key Account Manager"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .start, // Align items to start and end
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(paddingCard),
                            child: SizedBox(
                                height: 60,
                                width: 60,
                                child: Card(
                                  child: Image.asset("assets/Images/user.png"),
                                ))),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextStyleHeader(
                              text: "Atish Shah",
                              fontWeight: FontWeight.normal,
                              colors: Colors.black,
                            ),
                            TextStyleHeader(
                                text: "Marketing Executive",
                                fontWeight: FontWeight.normal,
                                colors: Colors.black),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Mail******************
                    const InsideShadowCard(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.all(paddingCard),
                            child: Card(
                              child: Icon(Icons.mail),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(paddingCard),
                          child: Text(
                            "shah.darshil2299@gmail.com",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    // WhatSup ******************
                    const InsideShadowCard(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.all(paddingCard),
                            child: Card(
                              child: Icon(Icons.call),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(paddingCard),
                          child: Text(
                            "+91 9664280220",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    // Whatsup
                    const InsideShadowCard(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.all(paddingCard),
                            child: Card(
                              child: Icon(Icons.whatshot),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(paddingCard),
                          child: Text(
                            "shah.darshil2299@gmail.com",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        )
                      ],
                    )),
                    const SizedBox(
                      height: 10,
                    ),
                    const InsideShadowCard(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: Padding(
                            padding: EdgeInsets.all(paddingCard),
                            child: Card(
                              child: Icon(Icons.near_me),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(paddingCard),
                          child: Text(
                            "Darshil Shah",
                            style: TextStyle(fontSize: 15.0),
                          ),
                        )
                      ],
                    ))
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage(token: widget.token,)));
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
                        builder: (context) =>
                            SearchPage(token: widget.token,)));
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
                            builder: (context) =>
                                CartPage(token: widget.token,)));
                  
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
