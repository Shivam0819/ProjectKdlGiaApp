import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kdlgia/cart/cartApi.dart';
import 'package:kdlgia/cart/cartData.dart';

class CartPage extends StatefulWidget {
  final String token;

  CartPage({Key? key, required this.token}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Future<CartResponse> _futureCartResponse;

  @override
  void initState() {
    super.initState();
    _futureCartResponse = showCarts(widget.token);
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
        title: Text('Cart Details'),
        centerTitle: true,
      ),
      body: FutureBuilder<CartResponse>(
        future: _futureCartResponse,
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
    );
  }

  Widget _buildCartContent(CartResponse cartResponse) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text('Total Items: ${cartResponse.cart.total}', style: TextStyle(fontSize: 20)),
          Text('Total Amount: ${cartResponse.cart.amount}', style: TextStyle(fontSize: 20)),
          Expanded(
            child: ListView.builder(
              itemCount: cartResponse.cart.item.length,
              itemBuilder: (context, index) {
                final item = cartResponse.cart.item[index];
                return Card(
                  child: ListTile(
                    title: Text(item),
                    subtitle: Text('Quantity: ${cartResponse.cart.amount} \nPrice: \$${cartResponse.cart.amount}'),
                    trailing: Text('Total: \$${cartResponse.cart.amount}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:kdlgia/api_assets_popup/imagePopup.dart';
// import 'package:kdlgia/cart/cartApi.dart';
// import 'package:kdlgia/diamond_search/searchDetail.dart';
// import 'package:kdlgia/search/apiDiamondSerach.dart';
// import 'package:kdlgia/search/diamondData.dart';
// import 'package:kdlgia/search/diamondDataDetail.dart';

// import 'package:kdlgia/style/search_card_ui.dart';
// import 'package:kdlgia/style/styleTextSearchResult.dart';

// class SearchResultsTemp extends StatefulWidget {
//   final String token;
//   final String queryUrl;

//   SearchResultsTemp({
//     Key? key,
//     required this.token,
//     required this.queryUrl,
//   }) : super(key: key);

//   @override
//   _SearchResultsTempState createState() => _SearchResultsTempState();
// }

// class _SearchResultsTempState extends State<SearchResultsTemp> {
//   late Future<DiamondData> _diamondDataFuture;
//   late Map<int, bool> isCheckedMap = {}; // Map to store isChecked state for each Diamond item
//   late Map<int, bool> isStaredMap = {};
//   bool _isExpanded = false;
//   int _currentPage = 1;
//   bool _isLoadingMore = false;
//   final ScrollController _scrollController = ScrollController();
//   List<Diamond> _diamonds = [];

//   @override
//   void initState() {
//     super.initState();
//     _diamondDataFuture = _fetchInitialData();
//     _scrollController.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoadingMore) {
//       _fetchMoreData();
//     }
//   }

//   Future<DiamondData> _fetchInitialData() async {
//     return await fetchDataSearchDiamond(widget.token, searchQuerry: widget.queryUrl);
//   }

//   Future<void> _fetchMoreData() async {
//     if (_currentPage < (await _diamondDataFuture).pages) {
//       setState(() {
//         _isLoadingMore = true;
//       });

//       _currentPage++;
//       DiamondData newDiamondData = await fetchDataSearchDiamond(widget.token, searchQuerry: "${widget.queryUrl}&page=$_currentPage");
//       setState(() {
//         _diamonds.addAll(newDiamondData.diamonds);
//         _isLoadingMore = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Card(
//           child: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context); // Navigate back when the back button is pressed
//             },
//             color: Colors.black, // Customize the color of the back button
//           ),
//         ),
//         title: FutureBuilder<DiamondData>(
//           future: _diamondDataFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Text("Loading...");
//             } else if (snapshot.hasError) {
//               return Text("Error");
//             } else {
//               _diamonds = snapshot.data!.diamonds;
//               return Text("${_diamonds.length}/${snapshot.data!.total} Result");
//             }
//           },
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<DiamondData>(
//         future: _diamondDataFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else {
//             return ListView.builder(
//               controller: _scrollController,
//               itemCount: _diamonds.length + (_isLoadingMore ? 1 : 0),
//               itemBuilder: (context, index) {
//                 if (index == _diamonds.length) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 bool isChecked = isCheckedMap[index] ?? false;
//                 bool isStared = isStaredMap[index] ?? false;
//                 final diamond = _diamonds[index];

//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDetail(diamondDetail: diamond)));
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(paddingCard),
//                     child: Card.filled(
//                       color: Colors.white,
//                       elevation: 7,
//                       borderOnForeground: false,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(right: paddingCard, left: paddingCard),
//                                 child: Container(
//                                   child: Row(
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           setState(() {
//                                             isCheckedMap[index] = !isChecked; // Update isChecked state in the map
//                                           });
//                                         },
//                                         child: SizedBox(
//                                           width: widthOfSearchResultCard,
//                                           height: heighOfSearchResultCard,
//                                           child: Card.filled(
//                                             color: Colors.white,
//                                             elevation: 7,
//                                             child: isChecked ? Image.asset("assets/app_icons/check.png") : Container(),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10),
//                                       InkWell(
//                                         onTap: () {
//                                           if (diamond.canToCart) {
//                                             // addToCart(diamond.id, widget.token);
//                                             print("Add to");
//                                           }
//                                           setState(() {
//                                             isStaredMap[index] = !isStared;
//                                           });
//                                         },
//                                         child: SizedBox(
//                                           width: widthOfSearchResultCard,
//                                           height: heighOfSearchResultCard,
//                                           child: Card.filled(
//                                             color: Colors.white,
//                                             elevation: 7,
//                                             child: isStared
//                                                 ? const Icon(Icons.star, color: Color.fromRGBO(33, 98, 238, 1)) //#2162E0
//                                                 : const Icon(Icons.star_border),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: paddingCard, left: paddingCard),
//                                 child: Container(
//                                   child: Row(
//                                     children: [
//                                       InkWell(
//                                         onTap: () {},
//                                         child: const SizedBox(
//                                           width: widthOfSearchResultCard,
//                                           height: heighOfSearchResultCard,
//                                           child: Card.filled(
//                                             color: Colors.white,
//                                             elevation: 7,
//                                             child: Icon(Icons.web_outlined),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10),
//                                       InkWell(
//                                         onTap: () {
//                                           showDialog(
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return ImagePopup(imageUrl: diamond.imageUrl);
//                                             },
//                                           );
//                                           print(diamond.imageUrl);
//                                         },
//                                         child: const SizedBox(
//                                           width: widthOfSearchResultCard,
//                                           height: heighOfSearchResultCard,
//                                           child: Card.filled(
//                                             color: Colors.white,
//                                             elevation: 7,
//                                             child: Icon(Icons.camera_alt_outlined),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10),
//                                       InkWell(
//                                         onTap: () {},
//                                         child: const SizedBox(
//                                           width: widthOfSearchResultCard,
//                                           height: heighOfSearchResultCard,
//                                           child: Card.filled(
//                                             color: Colors.white,
//                                             elevation: 7,
//                                             child: Icon(Icons.video_call_outlined),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Divider(color: Colors.grey),
//                           Padding(
//                             padding: const EdgeInsets.all(paddingCard),
//                             child: Table(
//                               defaultVerticalAlignment: TableCellVerticalAlignment.intrinsicHeight,
//                               children: [
//                                 TableRow(children: [
//                                   TableCell(child: StyledText(text: "Stock No.: ${diamond.id}")),
//                                   TableCell(child: StyledText(text: "Disc%: ${diamond.back}", color: Colors.redAccent)),
//                                 ]),
//                                 TableRow(children: [
//                                   TableCell(child: StyledText(text: "${diamond.diaReport}: ${diamond.diaReportNo}")),
//                                   TableCell(child: StyledText(text: "Amount: ${diamond.dollar1}", color: Colors.red)),
//                                 ]),
//                               ],
//                             ),
//                           ),
//                           const Divider(color: Colors.grey),
//                           Padding(
//                             padding: const EdgeInsets.only(left: paddingCard, right: paddingCard),
//                             child: Table(
//                               defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//                               children: [
//                                 TableRow(children: [
//                                   TableCell(child: StyledText(text: "Shp: ${diamond.diaShape}")),
//                                   TableCell(child: StyledText(text: "Carat: ${diamond.diaCarat}")),
//                                   TableCell(child: StyledText(text: "Color: ${diamond.diaColor}")),
//                                   TableCell(child: StyledText(text: "Clarity: ${diamond.diaClarity}")),
//                                 ]),
//                                 TableRow(children: [
//                                   TableCell(child: StyledText(text: "Cut: ${diamond.diaCut}")),
//                                   TableCell(child: StyledText(text: "Polish: ${diamond.diaPolish}")),
//                                   TableCell(child: StyledText(text: "Symm: ${diamond.diaSymmetry}")),
//                                   TableCell(child: StyledText(text: "Fluoro: ${diamond.diaFluorescence}")),
//                                 ]),
//                                 TableRow(children: [
//                                   TableCell(child: StyledText(text: "Loc: ${diamond.diaPlace}")),
//                                   TableCell(child: StyledText(text: "Tbl : ${diamond.diaTable}")),
//                                   TableCell(child: StyledText(text: "Td: ${diamond.diaDepth}")),
//                                   TableCell(child: StyledText(text: "Rap: ${diamond.rap}")),
//                                 ]),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: paddingCard, right: paddingCard, bottom: paddingCard),
//                             child: Table(
//                               defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//                               children: [
//                                 TableRow(children: [
//                                   TableCell(child: StyledText(text: "Measurement: ${diamond.diaDiameter}")),
//                                 ]),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.all(paddingCard),
//         child: Container(
//           height: 80,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   // Add functionality here
//                 },
//                 child: const Column(
//                   children: [
//                     Icon(Icons.shopify),
//                     SizedBox(height: 2),
//                     Text('Order'),
//                   ],
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // Add functionality here
//                 },
//                 child: const Column(
//                   children: [
//                     Icon(Icons.save_rounded),
//                     SizedBox(height: 2),
//                     Text('Save Search'),
//                   ],
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() {});
//                 },
//                 child: const Column(
//                   children: [
//                     Icon(Icons.shopping_cart),
//                     SizedBox(height: 2),
//                     Text('Cart'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
