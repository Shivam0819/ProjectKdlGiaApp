import 'package:flutter/material.dart';

import 'package:kdlgia/api_assets_popup/imagePopup.dart';
import 'package:kdlgia/cart/cartApi.dart';
import 'package:kdlgia/cart/cartData.dart';
import 'package:kdlgia/diamond_search/searchDetail.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';
import 'package:kdlgia/search/apiDiamondSerach.dart';
import 'package:kdlgia/search/diamondData.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';
import 'package:kdlgia/user/apiUserInfo.dart';
import 'package:kdlgia/user/userProfile.dart';
import 'package:url_launcher/url_launcher.dart';

class CartPage extends StatefulWidget {
  final String token;

  CartPage({Key? key, required this.token}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<CartResponse> _futureCartResponse;
  late Future<DiamondData> _diamondSearchDate;
  late Future<UserProfile> _userProfileFuture;
  late Map<int, bool> isCheckedMap =
      {}; // Map to store isChecked state for each Diamond item
  late Map<int, bool> isStaredMap = {};
  final ScrollController _scrollController = ScrollController();
  late List<dynamic> checkItem = [];

  @override
  void initState() {
    super.initState();

    // Fetch cart data and store the future
    _futureCartResponse = showCarts(widget.token);

    // Chain the future to handle the response and fetch diamond search data

    _diamondSearchDate = _futureCartResponse.then((value) {
      // Construct the query string by joining item IDs with commas
      // if(value.cart == 0){
      //   return
      // }
      String query =
          "q_perpage=200&q_id=01,${value.cart?.item.join(',')}&q_id_type=id";

      // Print the constructed query for debugging purposes
      print(query);

      // Fetch the diamond search data using the constructed query
      // Ensure this method returns Future<DiamondData>
      return fetchDataSearchDiamond(widget.token, searchQuerry: query);
    });

    // Fetch the user profile and store the future
    _userProfileFuture = ApiService.fetchUserProfile(widget.token);
  }

  _launchURLVideo(String videoUrl) async {
    final Uri url = Uri.parse(videoUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }
  // Future<CartResponse> showCarts(String token) async {
  //   String url = 'https://www.kdlgia.com/consumer/cart';

  //   try {
  //     http.Response response = await http.get(
  //       Uri.parse(url),
  //       headers: {'Mob-Token': token},
  //     );
  //     print("*********************************Show Carts detail");
  //     print(response.body);

  //     if (response.statusCode == 200) {
  //       final parsed = jsonDecode(response.body.toString());
  //       return CartResponse.fromJson(parsed);
  //     } else {
  //       throw Exception('Failed to fetch cart details');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching cart details: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: _futureCartResponse,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return Text(
                  "${snapshot.data!.cart?.total} Cost of ${snapshot.data!.cart?.amount}");
            } else {
              return Center(child: Text('No cart data available.'));
            }
          },
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _diamondSearchDate,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return _buildCartContent(snapshot.data!);
          } else {
            return Center(child: Text('No cart data available.'));
          }
        },
      ),
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
                    Icon(Icons.home),
                    SizedBox(height: 2),
                    Text('Home'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  _showOrderDialog(context, widget.token, checkItem.join(','),
                      _futureCartResponse);
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

              // TextButton(
              //   onPressed: () {
              //     setState(() {});
              //   },
              //   child: const Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(Icons.delete),
              //       SizedBox(height: 2),
              //       Text('Remove'),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCartContent(DiamondData diamondData) {
    return ListView.builder(
      itemCount: diamondData.diamonds.length,
      itemBuilder: (context, index) {
        bool isChecked = isCheckedMap[index] ?? false;
        bool isStared =
            isStaredMap[index] ?? diamondData.diamonds[index].inCart == "Y";
        final diamond = diamondData.diamonds[index];

        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchDetail(
                          diamondDetail: diamond,
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.all(paddingCard),
            child: Card.filled(
              color: Colors.white,
              elevation: 7,
              borderOnForeground: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: paddingCard, left: paddingCard),
                        child: Container(
                          child: Row(
                            children: [
                              // InkWell(
                              //   onTap: () {
                              //     isCheckedMap[index] = !isChecked;

                              //     if (!isChecked) {
                              //       checkItem.add(diamond.id);
                              //     } else {
                              //       checkItem.remove(diamond.id);
                              //     }
                              //     print(checkItem.join(','));
                              //     setState(() {
                              //       // Update isChecked state in the map
                              //     });
                              //   },
                              //   child: SizedBox(
                              //     width: widthOfSearchResultCard,
                              //     height: heighOfSearchResultCard,
                              //     child: Card.filled(
                              //       color: Colors.white,
                              //       elevation: 7,
                              //       child: isChecked
                              //           ? Image.asset(
                              //               "assets/app_icons/check.png")
                              //           : Container(),
                              //     ),
                              //   ),
                              // ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                    removeFromCart(diamond.id, widget.token);
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Diamond remove from cart")));
                                   
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartPage(
                                                token: widget.token,
                                              )),(route)=>false);
                                },
                                child: SizedBox(
                                  width: widthOfSearchResultCard,
                                  height: heighOfSearchResultCard,
                                  child: Card.filled(
                                    color: Colors.white,
                                    elevation: 7,
                                    child: isStared
                                        ? const Icon(Icons.shopping_cart,
                                            color: mainColor) //#2162E0
                                        : const Icon(Icons.shopping_cart_outlined),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: paddingCard, left: paddingCard),
                        child: Container(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const SizedBox(
                                  width: widthOfSearchResultCard,
                                  height: heighOfSearchResultCard,
                                  child: Card.filled(
                                    color: Colors.white,
                                    elevation: 7,
                                    child: Icon(Icons.web_outlined),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ImagePopup(
                                          imageUrl: diamond.imageUrl);
                                    },
                                  );
                                  print(diamond.imageUrl);
                                },
                                child: const SizedBox(
                                  width: widthOfSearchResultCard,
                                  height: heighOfSearchResultCard,
                                  child: Card.filled(
                                    color: Colors.white,
                                    elevation: 7,
                                    child: Icon(Icons.camera_alt_outlined),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  _launchURLVideo(diamond.movieUrl);
                                },
                                child: const SizedBox(
                                  width: widthOfSearchResultCard,
                                  height: heighOfSearchResultCard,
                                  child: Card.filled(
                                    color: Colors.white,
                                    elevation: 7,
                                    child: Icon(Icons.video_call_outlined),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.all(paddingCard),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.intrinsicHeight,
                      children: [
                        TableRow(children: [
                          TableCell(
                              child:
                                  StyledText(text: "Stock No.: ${diamond.id}")),
                          TableCell(
                              child: StyledText(
                                  text: "Disc%: ${diamond.back}",
                                  color: Colors.redAccent)),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: StyledText(
                                  text:
                                      "${diamond.diaReport}: ${diamond.diaReportNo}")),
                          TableCell(
                              child: StyledText(
                                  text: "Amount: ${diamond.dollar1}",
                                  color: Colors.red)),
                        ]),
                      ],
                    ),
                  ),
                  const Divider(color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: paddingCard, right: paddingCard),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          TableCell(
                              child:
                                  StyledText(text: "Shp: ${diamond.diaShape}")),
                          TableCell(
                              child: StyledText(
                                  text: "Carat: ${diamond.diaCarat}")),
                          TableCell(
                              child: StyledText(
                                  text: "Color: ${diamond.diaColor}")),
                          TableCell(
                              child: StyledText(
                                  text: "Clarity: ${diamond.diaClarity}")),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child:
                                  StyledText(text: "Cut: ${diamond.diaCut}")),
                          TableCell(
                              child: StyledText(
                                  text: "Polish: ${diamond.diaPolish}")),
                          TableCell(
                              child: StyledText(
                                  text: "Symm: ${diamond.diaSymmetry}")),
                          TableCell(
                              child: StyledText(
                                  text: "Fluoro: ${diamond.diaFluorescence}")),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child:
                                  StyledText(text: "Loc: ${diamond.diaPlace}")),
                          TableCell(
                              child: StyledText(
                                  text: "Tbl : ${diamond.diaTable}")),
                          TableCell(
                              child:
                                  StyledText(text: "Td: ${diamond.diaDepth}")),
                          TableCell(
                              child: StyledText(text: "Rap: ${diamond.rap}")),
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: paddingCard,
                        right: paddingCard,
                        bottom: paddingCard),
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: StyledText(
                                  text: "Measurement: ${diamond.diaDiameter}")),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void _showOrderDialog(BuildContext context, String token, String subide,
    Future<CartResponse> cartResponse) {
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Submit Order'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: receiverController,
              decoration: InputDecoration(
                labelText: 'Cart Receiver Name',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Cart Phone',
              ),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle submission here
              String receiverName = receiverController.text;
              String phone = phoneController.text;

              // Validate inputs and submit order
              if (receiverName.isNotEmpty && phone.isNotEmpty) {
                submitOrder(token, subide, receiverName, phone);
                var snackBar =
                    SnackBar(content: Text("Order Placed Successfully"));

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(token: token)),
                    (route) => false);
              } else {
                // Show error if inputs are invalid
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill in all fields')),
                );
              }
            },
            child: Text('Submit'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
        ],
      );
    },
  );
}
