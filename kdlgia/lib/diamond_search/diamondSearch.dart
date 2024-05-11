import 'package:flutter/material.dart';
import 'package:kdlgia/api_assets_popup/imagePopup.dart';
import 'package:kdlgia/diamond_search/searchDetail.dart';
import 'package:kdlgia/diamond_search/search_card.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';

class SearchResults extends StatefulWidget {
    List<Diamond> diamondData;

  SearchResults({super.key, 
    required this.diamondData
  });
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {

  late Map<int, bool> isCheckedMap =
      {}; // Map to store isChecked state for each Diamond item
  late Map<int, bool> isStaredMap = {};

  

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
        title: Text("${widget.diamondData.length} Result"),
        centerTitle: true,
      ),
      body:  ListView.builder(
              itemCount: widget.diamondData.length,
              itemBuilder: (context, index) {
                bool isChecked = isCheckedMap[index] ?? false;
                bool isStared = isStaredMap[index] ?? false;
                final diamond = widget.diamondData[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchDetail(diamondDetail: diamond,)));
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
                              // **********ClickBox and Star ************//
                              Padding(
                                padding: const EdgeInsets.only(right: paddingCard, left: paddingCard),
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
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isStaredMap[index] =
                                              !isStared; // Update isStared state in the map
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
                                )),
                              ),
                              // ********** cert camera video ************//
                              Padding(
                                padding: const EdgeInsets.only(right:paddingCard, left: paddingCard),
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
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              // Navigator.of(context).pop();
                                              return ImagePopup(
                                                  imageUrl:
                                                      "https://kdna-image.starjew.com/${diamond.image}.jpg?imageView2/2/w/800/h/800/q/100/");
                                            },
                                          );
                                          print(diamond.image);
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
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {},
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
                                      const SizedBox(
                                        width: 10,
                                      ),
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
                                          text:
                                              "Stock No.: ${diamond.stockNo}")),
                                  TableCell(
                                      child: StyledText(
                                    text: "Disc%: ${diamond.back}",
                                    color: Colors.redAccent,
                                  )),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text:
                                              "${diamond.report}: ${diamond.reportNo}")),
                                  TableCell(
                                      child: StyledText(
                                    text: "Amount: ${diamond.price}",
                                    color: Colors.red,
                                  )),
                                ]),
                              ],
                            ),
                          ),
                          const Divider(color: Colors.grey),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: paddingCard,
                                right: paddingCard,
                                ),
                            child: Table(
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              children: [
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text: "Shp: ${diamond.shape}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Carat: ${diamond.carat}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Color: ${diamond.color}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Clarity: ${diamond.clarity}")),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text: "Cut: ${diamond.cut}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Polish: ${diamond.polish}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Symm: ${diamond.symmetry}")),
                                  TableCell(
                                      child: StyledText(
                                          text:
                                              "Fluoro: ${diamond.fluorescence}")),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text: "Loc: ${diamond.place}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Tbl : ${diamond.table}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Td: ${diamond.depth}")),
                                  TableCell(
                                    child: StyledText(
                                      text: "Rap: ${diamond.rap}",
                                    ),
                                  ),
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
                                              "Measurement: ${diamond.measurements}")),
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
                  children: [
                    Icon(Icons.shopify),
                    SizedBox(height: 2),
                    Text('Order'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add functionality here
                },
                child: const Column(
                  children: [
                    Icon(Icons.save_rounded),
                    SizedBox(height: 2),
                    Text('Save Search'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Column(
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