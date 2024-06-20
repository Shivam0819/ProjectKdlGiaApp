import 'package:flutter/material.dart';
import 'package:kdlgia/order_status/orderResult.dart';
import 'package:kdlgia/order_status/order_data.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/textStyle.dart';



class OrderPage extends StatefulWidget {
  String token;
  OrderPage({Key? key,required this.token}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int status = 0;
  String url = "";
  // late OrderData orderData;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Status'),
        ),
        body:  Padding(
          padding: EdgeInsets.all(paddingCard),
          child: Column(
            children: [
              InkWell(
                        onTap: () {
                          print("object");
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextStyleHeader(
                                    text: "All Orders",
                                    colors: mainColor,
                                  ),
                                  Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderResult(token: widget.token, querryUrl: url)));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextStyleHeader(
                                    text: "Waiting for pickup",
                                    colors: mainColor,
                                  ),
                                  Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: null,
                        child: Padding(
                          padding: EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextStyleHeader(
                                    text: "Picked up",
                                    colors: mainColor,
                                  ),
                                  Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: null,
                        child: Padding(
                          padding: EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextStyleHeader(
                                    text: "Completed",
                                    colors: mainColor,
                                  ),
                                  Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: null,
                        child: Padding(
                          padding: EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextStyleHeader(
                                    text: "Canceled",
                                    colors: mainColor,
                                  ),
                                  Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: null,
                        child: Padding(
                          padding: EdgeInsets.all(paddingInsidCard),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextStyleHeader(
                                    text: "Return",
                                    colors: mainColor,
                                  ),
                                  Spacer(), // Use Spacer widget to fill available space
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: mainColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
            ],
          ),
        ));
  }
}

