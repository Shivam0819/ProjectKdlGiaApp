import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kdlgia/api_assets_popup/imagePopup.dart';
import 'package:kdlgia/diamond_search/searchDetail.dart';
import 'package:kdlgia/navigation_pages/cart_page.dart';
import 'package:kdlgia/order_status/order_api.dart';
import 'package:kdlgia/order_status/order_data.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderResult extends StatefulWidget {
  final String token;
  final String querryUrl;
  final String headinAppBar;

  OrderResult({
    super.key,
    required this.token,
    required this.querryUrl,
    required this.headinAppBar
  });
  @override
  _OrderResultState createState() => _OrderResultState();
}

class _OrderResultState extends State<OrderResult> {


  late final Future<List<Order>> _order;
  late Future<OrderData> orderData;

  @override
  void initState() {
    super.initState();
    orderData = orderFatchApi(widget.token, searchQuerry:widget.querryUrl);
  }


 _launchURL(String stockId) async {
    final Uri url =
        Uri.parse('https://www.gia.edu/report-check?reportno=$stockId');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

String getOrderStatus(String status) {
  switch (status) {
    case "2":
      return 'Waiting For Pic';
    case "3":
      return 'Picked Up';
    case "4":
      return 'Completed';
    case "20":
      return 'Cancel';
    case "21":
      return 'Return';
    default:
      return 'Unknown Status';
  }
}
   _launchURLVideo(String videoUrl) async {
   final Uri url = Uri.parse(videoUrl);
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
        title: Text(widget.headinAppBar),
        centerTitle: true,
      ),
      body: FutureBuilder(future: orderData, builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }else if(snapshot.data!.order.isEmpty){
          return const Center(child: Text("No Data Available"),);
        }else{
          return ListView.builder(
              itemCount: snapshot.data!.order.length,
              itemBuilder: (context, index) {
                
                final orderData = snapshot.data!.order[index];
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
                                    StyledText(text:"Status: "),
                                        
                                    StyledText(text:getOrderStatus(orderData.ord_status))
                                       
                                    
                                   
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
                                        onTap: () {
                                          _launchURL(orderData.diaReportNo);
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
                                                      orderData.imageUrl);
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
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _launchURLVideo(orderData.movieUrl);
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
                                              "Order Id: ${orderData.ord_id}")),
                                  TableCell(
                                      child: StyledText(
                                    text: "Disc%: ${orderData.back}",
                                    color: Colors.redAccent,
                                  )),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text:
                                              "${orderData.diaReport}: ${orderData.diaReportNo}")),
                                  TableCell(
                                      child: StyledText(
                                    text: "Amount: ${orderData.dollar1}",
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
                                          text: "Shp: ${orderData.diaShape}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Carat: ${orderData.diaCarat}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Color: ${orderData.diaColor}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Clarity: ${orderData.diaClarity}")),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text: "Cut: ${orderData.diaCut}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Polish: ${orderData.diaPolish}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Symm: ${orderData.diaSymmetry}")),
                                  TableCell(
                                      child: StyledText(
                                          text:
                                              "Fluoro: ${orderData.diaFluorescence}")),
                                ]),
                                TableRow(children: [
                                  TableCell(
                                      child: StyledText(
                                          text: "Loc: ${orderData.diaPlace}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Tbl : ${orderData.diaTable}")),
                                  TableCell(
                                      child: StyledText(
                                          text: "Td: ${orderData.diaDepth}")),
                                  TableCell(
                                    child: StyledText(
                                      text: "Rap: ${orderData.rap}",
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
                                              "Measurement: ${orderData.diaDiameter}")),
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
      }),
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
              const TextButton(
                onPressed: null,
                child: Column(
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

