import 'package:flutter/material.dart';
import 'package:kdlgia/api_assets_popup/imagePopup.dart';
import 'package:kdlgia/cart/cartApi.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';

class SearchResultsTemp extends StatefulWidget {
    List<Diamond> diamondData;
    String token;

  SearchResultsTemp({super.key, 
    required this.diamondData,
    required this.token
  });
  @override
  _SearchResultsTempState createState() => _SearchResultsTempState();
}

class _SearchResultsTempState extends State<SearchResultsTemp> {

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
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchDetail(diamondDetail: diamond,)));
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
                                         if (diamond.canToCart){
                                            print("Adding cart");
                                            addToCart(diamond.id, widget.token);
                                          }else{
                                            print("Remove cart");

                                            removeFromCart(diamond.id, widget.token);
                                          }
                                          setState(() {
                                            
                                          });
                                      },
                                      child: SizedBox(
                                        width: widthOfSearchResultCard,
                                        height: heighOfSearchResultCard,
                                        child: Card.filled(
                                          color: Colors.white,
                                          elevation: 7,
                                          child: diamond.canToCart
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
                                                      diamond.imageUrl);
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
                                              "Stock No.: ${diamond.id}")),
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
                                              "${diamond.diaReport}: ${diamond.diaReportNo}")),
                                  TableCell(
                                      child: StyledText(
                                    text: "Amount: ${diamond.dollar1}",
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
                                      child: StyledText(
                                          text: "Cut: ${diamond.diaCut}")),
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