import 'package:flutter/material.dart';
import 'package:kdlgia/api_assets_popup/imagePopup.dart';
import 'package:kdlgia/cart/cartApi.dart';
import 'package:kdlgia/diamond_search/searchDetail.dart';
import 'package:kdlgia/navigation_pages/cart_page.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';
import 'package:kdlgia/order_status/orderPage.dart';
import 'package:kdlgia/search/apiDiamondSerach.dart';
import 'package:kdlgia/search/diamondData.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';

import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultsTemp extends StatefulWidget {
  final DiamondData diamondData;
  final String token;
  final String querryUrl;

  SearchResultsTemp({
    super.key,
    required this.diamondData,
    required this.token,
    required this.querryUrl,
  });

  @override
  _SearchResultsTempState createState() => _SearchResultsTempState();
}

class _SearchResultsTempState extends State<SearchResultsTemp> {
  late Map<int, bool> isCheckedMap =
      {}; // Map to store isChecked state for each Diamond item
  late Map<int, bool> isStaredMap = {};
  bool _isExpanded = false;
  int _currentPage = 1;
  bool _isLoadingMore = false;
  final ScrollController _scrollController = ScrollController();
  List<Diamond> _diamonds = [];

  bool _selectAllChecked = false; // For the select all functionality
  bool _isAscendingPrice = true; // To track price sorting order
  bool _isAscendingDiscount = true;
  late Future<List<Diamond>> diamond_select;

  @override
  void initState() {
    super.initState();
    _diamonds = widget.diamondData.diamonds;
    _scrollController.addListener(_onScroll);
    diamond_select = _fatchForSellect();
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
    if (_currentPage < widget.diamondData.pages) {
      setState(() {
        _isLoadingMore = true;
      });
      // print(" ${widget.diamondData.pages} ${_currentPage }");

      _currentPage++;
      // Simulate network request delay
      await Future.delayed(Duration(seconds: 2));

      // Fetch more data from the API and add it to the list
      DiamondData newDiamondData = await fetchDataSearchDiamond(widget.token,
          searchQuerry: "${widget.querryUrl} + &page=${_currentPage}");
      setState(() {
        _diamonds.addAll(newDiamondData.diamonds);
        _isLoadingMore = false;
      });
    }
  }

  Future<List<Diamond>> _fatchForSellect() async {
    List<Diamond> diamond_temp = []; // Initialize the list
    DiamondData newDiamondData = await fetchDataSearchDiamond(
      widget.token,
      searchQuerry: "${widget.querryUrl}&q_perpage=200",
    );
    print(newDiamondData.page);
    print(newDiamondData.pages);
    print(newDiamondData.perPage);
    diamond_temp.addAll(newDiamondData.diamonds);

    for (int i = 2; i <= newDiamondData.pages; i++) {
      newDiamondData = await fetchDataSearchDiamond(
        widget.token,
        searchQuerry: "${widget.querryUrl}&page=${i}&q_perpage=200",
      );
      // Assuming `newDiamondData` is a list of Diamonds
      // diamond_temp.addAll(newDiamondData.diamonds); // Update this line based on your actual API response structure
      diamond_temp.addAll(newDiamondData.diamonds);
    }
    print(diamond_temp.length);

    return diamond_temp;
  }

// Function to process adding or removing diamonds and return a modified list
  // Synchronous function to process adding or removing diamonds and return a modified list
  List<Diamond> processDiamonds(
      List<Diamond> diamondsSelected, bool selectAllChecked) {
    // Create a copy of the diamondsSelected list to avoid modifying the original
    List<Diamond> diamondsSelectedCopy = List.from(diamondsSelected);

    // Lists to store diamonds to be removed or added
    List<Diamond> ls_remove = [];
    List<Diamond> add_diamond = [];

    // Loop through isCheckedMap and collect diamonds to add or remove
    isCheckedMap.forEach((key, value) {
      if (value == false) {
        ls_remove.add(_diamonds[key]); // Diamonds to remove
      } else if (!selectAllChecked && value == true) {
        add_diamond.add(
            _diamonds[key]); // Diamonds to add if selectAllChecked is false
      }
    });
    print(ls_remove.length);
    print(add_diamond.length);

    // If all diamonds are selected, remove diamonds in ls_remove from the copy
    if (selectAllChecked) {
      print(
          "********************************************I am in the right place, I am selected");

      // Remove each diamond in ls_remove from diamondsSelectedCopy
      ls_remove.forEach((removeDiamond) {
        diamondsSelectedCopy
            .removeWhere((diamond) => diamond.id == removeDiamond.id);
      });

      return diamondsSelectedCopy;
    }
    {
      // If not all selected, add diamonds from add_diamond list
      diamondsSelectedCopy.clear();
      diamondsSelectedCopy.addAll(add_diamond);
    }
    print(
        "********************************************i am in right place i am selected diamond coppy ${diamondsSelectedCopy.length}");

    print(diamondsSelectedCopy.length);

    // Return the modified list of diamonds
    return diamondsSelectedCopy;
  }

  _launchURLVideo(String videoUrl) async {
    final Uri url = Uri.parse(videoUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  // Future<List<Diamond>> fetchDiamondsFromApi(String url, int page, String token) async {
  //   // Your API call logic here
  //   // For the sake of this example, we'll simulate fetching data
  //   await Future.delayed(Duration(seconds: 2));
  //   return List.generate(10, (index) => Diamond(
  //     id: 'D${page}00${index}',
  //     canToCart: true,
  //     imageUrl: 'https://example.com/diamond${page}00${index}.png',
  //     diaReport: 'GIA',
  //     diaReportNo: '123456',
  //     dollar1: '\$1000',
  //     diaShape: 'Round',
  //     diaCarat: '1.0',
  //     diaColor: 'D',
  //     diaClarity: 'IF',
  //     diaCut: 'Excellent',
  //     diaPolish: 'Excellent',
  //     diaSymmetry: 'Excellent',
  //     diaFluorescence: 'None',
  //     diaPlace: 'USA',
  //     diaTable: '58%',
  //     diaDepth: '62%',
  //     rap: 'RAP',
  //     diaDiameter: '6.5',
  //     back: '5%'
  //   ));
  // }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  String get_querry() {
    String querry = "";

    isCheckedMap.forEach((key, value) {
      print(key);
      if (value) {
        print(_diamonds[key]);
        querry = querry + _diamonds[key].id + ",";
      }
      print(querry);
    });
    return querry;
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
        title: Text("${_diamonds.length}/${widget.diamondData.total} Result"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            // padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Select All Button
                TextButton.icon(
                  onPressed: () async {
                    setState(() {
                      _toggleSelectAll();
                    });
                  },
                  icon: Icon(_selectAllChecked
                      ? Icons.check_box
                      : Icons.check_box_outline_blank),
                  label: const Text("All"),
                ),

                // Sort by Price Button
                TextButton.icon(
                  onPressed: _sortByPrice,
                  icon: const Icon(Icons.sort),
                  label: Text(_isAscendingPrice ? "Amt ↑" : "Amt ↓"),
                ),

                // Sort by Discount Button
                TextButton.icon(
                  onPressed: _sortByDiscount,
                  icon: const Icon(Icons.sort),
                  label: Text(_isAscendingDiscount ? "Dis% ↑" : "Dis% ↓"),
                ),
                TextButton.icon(
                  onPressed: _sortByDiscount,
                  icon: const Icon(Icons.download),
                  label: Text(""),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _diamonds.length + (_isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _diamonds.length) {
                  return Center(child: CircularProgressIndicator());
                }

                bool isChecked = isCheckedMap[index] ?? false;
                bool isStared =
                    isStaredMap[index] ?? _diamonds[index].inCart == "Y";
                final diamond = _diamonds[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchDetail(
                                  diamondDetail: diamond,
                                  token: widget.token,
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
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isCheckedMap[index] =
                                                !isChecked; // Update isChecked state in the map
                                            // print(isCheckedMap);
                                          });
                                        },
                                        child: SizedBox(
                                          width: widthOfSearchResultCard,
                                          height: heighOfSearchResultCard,
                                          child: Card.filled(
                                            color: Colors.white,
                                            elevation: 7,
                                            child: isChecked
                                                ? Image.asset(
                                                    "assets/app_icons/check.png")
                                                : Container(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                          SnackBar statusCard;
                                          if (isStared) {
                                            removeFromCart(
                                                diamond.id, widget.token);
                                            statusCard = const SnackBar(
                                              content: Text(
                                                  "Diamond remove from cart"),
                                            );
                                          } else {
                                            addToCart(diamond.id, widget.token);
                                            statusCard = const SnackBar(
                                                content: Text(
                                                    "Diamond added to cart"));
                                          }
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(statusCard);
                                          setState(() {
                                            isStaredMap[index] = !isStared;
                                          });
                                        },
                                        child: SizedBox(
                                          width: widthOfSearchResultCard,
                                          height: heighOfSearchResultCard,
                                          child: Card.filled(
                                            color: Colors.white,
                                            elevation: 7,
                                            child: isStared
                                                ? const Icon(
                                                    Icons.shopping_cart,
                                                    color: mainColor) //#2162E0
                                                : const Icon(Icons
                                                    .shopping_cart_outlined),
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
                                        onTap: () {
                                          if (diamond.diaReport == "GIA" ||
                                              diamond.diaReport == "IGI") {
                                            _launchURL(diamond.diaReportNo,
                                                diamond.diaReport);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Sorry Not Available")));
                                          }
                                        },
                                        child: const SizedBox(
                                          width: widthOfSearchResultCard,
                                          height: heighOfSearchResultCard,
                                          child: Card.filled(
                                            color: Colors.white,
                                            elevation: 7,
                                            child: Icon(Icons.class_rounded),
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
                                        },
                                        child: const SizedBox(
                                          width: widthOfSearchResultCard,
                                          height: heighOfSearchResultCard,
                                          child: Card.filled(
                                            color: Colors.white,
                                            elevation: 7,
                                            child:
                                                Icon(Icons.camera_alt_outlined),
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
                                            child:
                                                Icon(Icons.video_call_outlined),
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
                                      child: StyledText(
                                          text: "Stock No.: ${diamond.id}")),
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
                                      child: StyledText(
                                          text: "Shp: ${diamond.diaShape}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Carat: ${diamond.diaCarat}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Color: ${diamond.diaColor}")),
                                  TableCell(
                                      child: StyledText(
                                          text:
                                              "Clarity: ${diamond.diaClarity}")),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text: "Cut: ${diamond.diaCut}")),
                                  TableCell(
                                      child: StyledText(
                                          text:
                                              "Polish: ${diamond.diaPolish}")),
                                  TableCell(
                                      child: StyledText(
                                          text:
                                              "Symm: ${diamond.diaSymmetry}")),
                                  TableCell(
                                      child: StyledText(
                                          text:
                                              "Fluoro: ${diamond.diaFluorescence}")),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text: "Loc: ${diamond.diaPlace}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Tbl : ${diamond.diaTable}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Td: ${diamond.diaDepth}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Rap: ${diamond.rap}")),
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
                                          text:
                                              "Measurement: ${diamond.diaDiameter}")),
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
            ),
          )
        ],
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
                    Icon(
                      Icons.home,
                    ),
                    SizedBox(height: 2),
                    Text('Home'),
                  ],
                ),
              ),
              TextButton(
                // Add functionality here
                onPressed: () async {
                  print(
                      "********************************************i am in right place");

                  // Fetch the selected diamonds asynchronously
                  List<Diamond> diamondsSelected = await diamond_select;

                  // Declare a variable to hold the updated list
                  List<Diamond> updatedDiamonds = [];

                  // If all diamonds are selected, process accordingly
                  if (_selectAllChecked) {
                    if (diamondsSelected.length == widget.diamondData.total) {
                      print(
                          "********************************************i am in right place");
                      updatedDiamonds = processDiamonds(
                          diamondsSelected, true); // Processing with removal
                    }
                  } else {
                    print(
                        "********************************************i am in right place");
                    updatedDiamonds = processDiamonds(
                        diamondsSelected, false); // Processing with addition
                  }

                  print(updatedDiamonds.length);
                  String diamondIdsString = updatedDiamonds
                      .map((diamond) => diamond.id.toString())
                      .join(',');

                  // Create a list of Futures for adding diamonds to the cart
                  List<Future> addToCartFutures = [];
                  for (var item in updatedDiamonds) {
                    addToCartFutures.add(addToCart(item.id, widget.token));
                  }

                  // Wait for all diamonds to be added to the cart
                  await Future.wait(addToCartFutures);

                  // Now you can show the order dialog after all items have been added
                  _showOrderDialog(context, widget.token, diamondIdsString);
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
                onPressed: () async{
                  print(
                      "********************************************i am in right place");

                  // Fetch the selected diamonds asynchronously
                  List<Diamond> diamondsSelected = await diamond_select;

                  // Declare a variable to hold the updated list
                  List<Diamond> updatedDiamonds = [];

                  // If all diamonds are selected, process accordingly
                  if (_selectAllChecked) {
                    if (diamondsSelected.length == widget.diamondData.total) {
                      print(
                          "********************************************i am in right place");
                      updatedDiamonds = processDiamonds(
                          diamondsSelected, true); // Processing with removal
                    }
                  } else {
                    print(
                        "********************************************i am in right place");
                    updatedDiamonds = processDiamonds(
                        diamondsSelected, false); // Processing with addition
                  }

                  print(updatedDiamonds.length);
                  String diamondIdsString = updatedDiamonds
                      .map((diamond) => diamond.id.toString())
                      .join(',');

                  // Create a list of Futures for adding diamonds to the cart
                  List<Future> addToCartFutures = [];
                  for (var item in updatedDiamonds) {
                    addToCartFutures.add(addToCart(item.id, widget.token));
                  }

                  // Wait for all diamonds to be added to the cart
                  await Future.wait(addToCartFutures);

                  // Now you can show the order dialog after all items have been added
               
                  Navigator.pushReplacement(
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

  void _toggleSelectAll() async {
    setState(() {
      _selectAllChecked = !_selectAllChecked;
      isCheckedMap = {
        for (int i = 0; i < _diamonds.length; i++) i: _selectAllChecked,
      };
    });
  }

  // Sort by Price functionality
  void _sortByPrice() {
    setState(() {
      if (_isAscendingPrice) {
        _diamonds.sort((a, b) => double.parse(a.dollar1.substring(1))
            .compareTo(double.parse(b.dollar1.substring(1))));
      } else {
        _diamonds.sort((a, b) => double.parse(b.dollar1.substring(1))
            .compareTo(double.parse(a.dollar1.substring(1))));
      }
      _isAscendingPrice = !_isAscendingPrice;
    });
  }

  // Sort by Discount functionality
  void _sortByDiscount() {
    setState(() {
      if (_isAscendingDiscount) {
        _diamonds.sort((a, b) => double.parse(a.back.replaceAll('%', ''))
            .compareTo(double.parse(b.back.replaceAll('%', ''))));
      } else {
        _diamonds.sort((a, b) => double.parse(b.back.replaceAll('%', ''))
            .compareTo(double.parse(a.back.replaceAll('%', ''))));
      }
      _isAscendingDiscount = !_isAscendingDiscount;
    });
  }
}

void _showOrderDialog(BuildContext context, String token, String subide) {
  final TextEditingController receiverController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController note = TextEditingController();

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
              decoration: const InputDecoration(
                labelText: 'Cart Receiver Name',
              ),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Cart Phone',
              ),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: note,
              decoration: const InputDecoration(
                labelText: 'Note',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Handle submission here
              String receiverName = receiverController.text;
              String phone = phoneController.text;
              String user_note = note.text;
              // Validate inputs and submit order
              if (receiverName.isNotEmpty && phone.isNotEmpty) {
                submitOrder(token, subide, receiverName, phone,
                    cart_note: user_note);
                var snackBar =
                    SnackBar(content: Text("Order Placed Successfully"));

                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OrderPage(token: token)),
                );
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
