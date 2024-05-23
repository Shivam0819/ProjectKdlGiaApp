import 'package:flutter/material.dart';
import 'package:kdlgia/api_assets_popup/imagePopup.dart';
import 'package:kdlgia/cart/cartApi.dart';
import 'package:kdlgia/diamond_search/searchDetail.dart';
import 'package:kdlgia/navigation_pages/cart_page.dart';
import 'package:kdlgia/search/apiDiamondSerach.dart';
import 'package:kdlgia/search/diamondData.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';

import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';

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

  @override
  void initState() {
    super.initState();
    _diamonds = widget.diamondData.diamonds;
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
    if (_currentPage < widget.diamondData.pages) {
      setState(() {
        _isLoadingMore = true;
      });

      _currentPage++;
      // Simulate network request delay
      await Future.delayed(Duration(seconds: 2));

      // Fetch more data from the API and add it to the list
      DiamondData newDiamondData = await fetchDataSearchDiamond(widget.token,
          searchQuerry: "${widget.querryUrl} + &page=2");
      setState(() {
        _diamonds.addAll(newDiamondData.diamonds);
        _isLoadingMore = false;
      });
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
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _diamonds.length + (_isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == _diamonds.length) {
            return Center(child: CircularProgressIndicator());
          }

          bool isChecked = isCheckedMap[index] ?? false;
          bool isStared = isStaredMap[index] ?? _diamonds[index].inCart == "Y";
          final diamond = _diamonds[index];

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
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isCheckedMap[index] =
                                          !isChecked; // Update isChecked state in the map
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
                                    if (isStared) {
                                      removeFromCart(diamond.id, widget.token);
                                      print("Called me to remoce!!");
                                    } else {
                                      addToCart(diamond.id, widget.token);
                                      print("Called me to add!!");

                                    }
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
                                          ? const Icon(Icons.star,
                                              color: Color.fromRGBO(
                                                  33, 98, 238, 1)) //#2162E0
                                          : const Icon(Icons.star_border),
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
                                  onTap: () {},
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
