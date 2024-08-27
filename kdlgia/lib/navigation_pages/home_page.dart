import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kdlgia/api_assets_popup/imagePopup.dart';
import 'package:kdlgia/cart/cartApi.dart';
import 'package:kdlgia/cart/cartData.dart';
import 'package:kdlgia/diamond_search/searchDetail.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';
import 'package:kdlgia/navigation_pages/cart_page.dart';
import 'package:kdlgia/navigation_pages/search_page.dart';
import 'package:kdlgia/order_status/orderPage.dart';
import 'package:kdlgia/registeration/login_page.dart';
import 'package:kdlgia/search/apiDiamondSerach.dart';
import 'package:kdlgia/search/diamondData.dart';
import 'package:kdlgia/search/searchTemp.dart';
import 'package:kdlgia/style/cardDetail.dart';
import 'package:kdlgia/style/constant.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/textStyle.dart';
import 'package:kdlgia/user/apiUserInfo.dart';
import 'package:kdlgia/user/profile.dart';
import 'package:kdlgia/user/userProfile.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the search page

class HomePage extends StatefulWidget {
  final String token;

  const HomePage({super.key, required this.token});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isExpanded = true;
  bool isStockNoSelected = true;
  bool orderSummaryDetailIsSelected = false;
  bool userSummaruIsSelected = false;
  String searchByReferance = "id";
  late final TextEditingController _searchQuerry = TextEditingController();
  late Future<UserProfile> _userProfileFuture;

  late Future<DiamondData> diamondsFuture;
  late Future<DiamondData> diamondsFutureExclusiveDiamond;

  late Future<CartResponse> cartResponse;
  late int stockWehave;
  @override
  void initState() {
    super.initState();
    diamondsFuture = fetchDataSearchDiamond(
      widget.token,
    );
    diamondsFutureExclusiveDiamond = fetchDataSearchDiamond(widget.token,
        searchQuerry: "q_lab=GIA,IGI&q_perpage=200&q_carat1=2");
    cartResponse = showCarts(widget.token);
    _userProfileFuture = ApiService.fetchUserProfile(widget.token);
  }

  @override
  void dispose() {
    _searchQuerry.dispose();
    super.dispose();
  }

  Diamond exclusiveDiamond(List<Diamond> diamond) {
    late Diamond exclusiveDiamond = diamond[0];

    for (var data in diamond) {
      if (int.parse(exclusiveDiamond.back) > int.parse(data.back)) {
        exclusiveDiamond = data;
      }
    }
    print("Exclusinve diamond");
    print(exclusiveDiamond);
    return exclusiveDiamond;
  }

  _launchURLVideo(String videoUrl) async {
    final Uri url = Uri.parse(videoUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  _launchURL(String stockId, String lab) async {
    Uri url;
    if (lab == "GIA") {
      url = Uri.parse('https://www.gia.edu/report-check?reportno=$stockId');
    } else {
      url = Uri.parse('https://www.igi.org/verify-your-report/?r=$stockId');
    }

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text("Home"),

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
                //cart page
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartPage(
                                token: widget.token,
                              )),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(paddingCard),
                    child: Card(
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart, size: 60, color: mainColor),
                          TextStyleHeader(
                            text: "Cart",
                            colors: mainColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                // Add more children as needed
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPage(
                                  token: widget.token,
                                )));
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
                          FutureBuilder(
                              future: diamondsFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return TextStyleHeader(
                                    text: snapshot.data!.total.toString(),
                                    colors: mainColor,
                                    fontWeight: FontWeight.normal,
                                  );
                                }
                              })
                        ],
                      )),
                    ),
                  ),
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
                                    colors: mainColor,
                                  ),
                                  const Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    isExpanded
                                        ? Icons.arrow_upward_rounded
                                        : Icons.arrow_downward_rounded,
                                    color: mainColor,
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
                                    fetchDataSearchDiamond(widget.token,
                                            searchQuerry: querry)
                                        .then((diamondData) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SearchResultsTemp(
                                            diamondData: diamondData,
                                            token: widget.token,
                                            querryUrl: querry,
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
                      const TextStyleHeader(
                        text: "KDL Gia Exclusive Diamond",
                        fontSizeIs: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      FutureBuilder(
                        future: diamondsFutureExclusiveDiamond,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            Diamond? data; // Declare as nullable

                            if (snapshot.hasData) {
                              // Initialize temp with the first diamond
                              var temp;
                              var temp1 = [];

                              print(snapshot.data!.diamonds.length);
                              var source = [
                                "PARTH",
                                "LU",
                                "LDD",
                                "KT",
                                "YD",
                                "H"
                              ];
                              for (var diam in snapshot.data!.diamonds) {
                                if (source.contains(diam.diaSource)) {
                                  temp1.add(diam);
                                }
                              }
                              temp = temp1[0];
                              for (var diam in temp1) {
                                // Compare using double.parse for decimal numbers

                                print(diam.diaSource);

                                if (double.parse(temp.diaCarat) <
                                    double.parse(diam.diaCarat)) {
                                  temp = diam;
                                    // double? val = double.tryParse(diam.dollar1.replaceAll(RegExp(r'[^\d.]'), ''));
                                    // print(val);

                                }
                              }

                              data = temp; // Assign the found diamond to data
                            }

                            return InkWell(
                              onTap: () {
                                var stok_no = data!.diaReportNo;
                                String querry =
                                    "q_id=${stok_no}&q_id_type=report_no";
                                print(querry);
                                // showCarts(widget.token);
                                fetchDataSearchDiamond(widget.token,
                                        searchQuerry: querry)
                                    .then((diamondData) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SearchResultsTemp(
                                        diamondData: diamondData,
                                        token: widget.token,
                                        querryUrl: querry,
                                      ),
                                    ),
                                  );
                                });
                              },
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  shrinkWrap:
                                      true, // Ensure the GridView occupies only the space it needs
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.network(
                                        data!.imageUrl,
                                        fit: BoxFit.fill,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          );
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Text('Failed to load image');
                                        },
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: paddingCard,
                                              left: paddingCard),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                data.diaShape,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaCarat)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: paddingCard,
                                              left: paddingCard),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaColor),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaClarity),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaReport)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: paddingCard,
                                              left: paddingCard),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaCut),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaPolish),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaSymmetry),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaFluorescence)
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: paddingCard,
                                              left: paddingCard),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(data.diaReportNo)
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: paddingCard,
                                                    left: paddingCard),
                                                child: Container(
                                                    child: Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (data!.diaReport ==
                                                                "GIA" ||
                                                            data.diaReport ==
                                                                "IGI") {
                                                          _launchURL(
                                                              data.diaReportNo,
                                                              data.diaReport);
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(const SnackBar(
                                                                  content: Text(
                                                                      "Sorry!!! Not Available")));
                                                        }
                                                      },
                                                      child: const SizedBox(
                                                        width:
                                                            widthOfSearchResultCard,
                                                        height:
                                                            heighOfSearchResultCard,
                                                        child: Card.filled(
                                                          color: Colors.white,
                                                          elevation: 7,
                                                          child: Icon(Icons
                                                              .class_rounded),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            // Navigator.of(context).pop();
                                                            return ImagePopup(
                                                                imageUrl: data!
                                                                    .imageUrl);
                                                          },
                                                        );
                                                      },
                                                      child: const SizedBox(
                                                        width:
                                                            widthOfSearchResultCard,
                                                        height:
                                                            heighOfSearchResultCard,
                                                        child: Card.filled(
                                                          color: Colors.white,
                                                          elevation: 7,
                                                          child: Icon(Icons
                                                              .camera_alt_outlined),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        _launchURLVideo(
                                                            data!.movieUrl);
                                                      },
                                                      child: const SizedBox(
                                                        width:
                                                            widthOfSearchResultCard,
                                                        height:
                                                            heighOfSearchResultCard,
                                                        child: Card.filled(
                                                          color: Colors.white,
                                                          elevation: 7,
                                                          child: Icon(Icons
                                                              .video_call_outlined),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                  ],
                                                )))
                                          ],
                                        )
                                      ],
                                    )
                                  ]),
                            );
                          }
                        },
                      )

                      // FutureBuilder(future: diamondsFuture, builder:(context, snapshot) {
                      //           if (snapshot.connectionState ==
                      //               ConnectionState.waiting) {
                      //             return const Center(
                      //               child: CircularProgressIndicator(),
                      //             );
                      //           } else {

                      //             return TextStyleHeader(
                      //               text: snapshot.data!.total.toString(),
                      //               colors: mainColor,
                      //               fontWeight: FontWeight.normal,
                      //             );
                      //           }
                      //         })
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
              children: [
                const InkWell(
                  onTap: null,
                  child: Padding(
                    padding: EdgeInsets.all(paddingCard),
                    child: Card(
                      child: Center(child: TextStyleHeader(text: "Flewless")),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                OrderPage(token: widget.token)));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(paddingCard),
                    child: Card(
                      child: Center(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delivery_dining_rounded,
                              size: 60, color: mainColor),
                          TextStyleHeader(
                            text: "Order Status",
                            colors: mainColor,
                            fontWeight: FontWeight.normal,
                          ),
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
                                        : Icons.arrow_downward_rounded,
                                    color: mainColor,
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
                                        : Icons.arrow_downward_rounded,
                                    color: mainColor,
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
                child: FutureBuilder<UserProfile>(
                  future: _userProfileFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final userProfile = snapshot.data!;
                      var salesPersonName = userProfile.salesPerson ?? '';
                      var salesPersonaPhone =
                          userProfile.salesPersonPhone ?? '';
                      var salesPersonWexine =
                          userProfile.salesPersonSkype ?? '';
                      var salesPersonWhatsapp =
                          userProfile.salesPersonWhatsapp ?? '';
                      var salesPersonSkype = userProfile.salesSkype ?? '';

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: const Text(
                              "Key Account Manager",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                  fontSize: 18),
                            ),
                          ),

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
                                    child: Image.asset(
                                      "assets/Images/user.png",
                                      color: mainColor,
                                    ),
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextStyleHeader(
                                    text: salesPersonName,
                                    fontWeight: FontWeight.normal,
                                    colors: Colors.black,
                                  ),
                                  const TextStyleHeader(
                                      text: "Marketing Executive",
                                      fontWeight: FontWeight.normal,
                                      colors: Colors.black),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Mail******************
                          InsideShadowCard(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Padding(
                                  padding: EdgeInsets.all(paddingCard),
                                  child: Image.asset(
                                      "assets/logo/telephone.png",
                                      color: mainColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(paddingCard),
                                child: Text(
                                  salesPersonaPhone,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              )
                            ],
                          )),
                          const SizedBox(
                            height: 5,
                          ),
                          // WhatSup ******************
                          InsideShadowCard(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Padding(
                                  padding: EdgeInsets.all(paddingCard),
                                  child: Image.asset("assets/logo/whatsapp.png",
                                      color: mainColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(paddingCard),
                                child: Text(
                                  salesPersonWhatsapp,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              )
                            ],
                          )),
                          const SizedBox(height: 5),
                          // Whatsup
                          InsideShadowCard(
                              child: Row(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Padding(
                                  padding: EdgeInsets.all(paddingCard),
                                  child: Image.asset("assets/logo/wechat.png",
                                      color: mainColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(paddingCard),
                                child: Text(
                                  salesPersonWexine,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              )
                            ],
                          )),
                          const SizedBox(
                            height: 5,
                          ),
                          InsideShadowCard(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Padding(
                                    padding: EdgeInsets.all(paddingCard),
                                    child: Image.asset("assets/logo/skype.png",
                                        color: mainColor),
                                  ),
                                ),
                                Expanded(
                                  // Expanded widget added here
                                  child: Padding(
                                    padding: EdgeInsets.all(paddingCard),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        salesPersonSkype, // Use null-aware operator to handle null value
                                        style: TextStyle(fontSize: 15.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                  },
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
                            )),
                    (route) => false,
                  );
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
                            )),
                  );
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
