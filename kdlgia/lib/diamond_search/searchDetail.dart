import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';
import 'package:kdlgia/share_dna/dan.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';
import 'package:kdlgia/style/textStyle.dart';
// ignore: depend_on_referenced_packages

import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class SearchDetail extends StatefulWidget {
  final Diamond diamondDetail;

  const SearchDetail({super.key, required this.diamondDetail});

  @override
  _SearchDetailState createState() => _SearchDetailState();
}

class _SearchDetailState extends State<SearchDetail> {
  String selectedOption = "image";
  bool detailIsSelected = false;
  bool additionalDetailIsSelected = false;
  bool kdlImpexDetailIsSelected = false;
  bool imageSelected = true;
  bool videoSelected = false;
  bool certificateSelected = false;
  bool shareSelected = false;

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

  _launchURLVideo(String videoUrl) async {
    final Uri url = Uri.parse(videoUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch');
    }
  }

  void _shareToWhatsApp(messages) async {
    final message = messages; // Replace with your message
    final whatsappUrl = Uri.parse("whatsapp://send?text=$message");

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(
        whatsappUrl,
        mode: LaunchMode.externalApplication, // Ensures the phone dialer opens
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('WhatsApp is not installed on your device.')),
      );
    }
  }

  void _showShareOptions(
      BuildContext context, String pastDetail, SnackBar snackBar) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Image.asset(
                "assets/logo/whatsapp.png",
                color: Colors.green,
              ),
              title: Text('Share via WhatsApp'),
              onTap: () {
                _shareToWhatsApp(pastDetail);
                Navigator.pop(context);
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.chat),
            //   title: Text('Share via WeChat'),
            //   onTap: () {
            //     _shareToWeChat();
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.copy),
              title: Text('Copy to Clipboard'),
              onTap: () {
                Clipboard.setData(ClipboardData(text: pastDetail));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (selectedOption == "image") {
      if (widget.diamondDetail.imageUrl.isNotEmpty) {
        print("hello ${widget.diamondDetail.imageUrl}");
        content = Image.network(
          "${widget.diamondDetail.imageUrl}",
        );
      } else {
        content = const Icon(
            Icons.image_not_supported); // Display icon if image URL is empty
      }
    } else if (selectedOption == "video") {
      content = const Icon(
          Icons.video_call_outlined); // Replace Icon with your video widget
    } else if (selectedOption == "certificate") {
      content = const Icon(Icons
          .photo_album_outlined); // Replace Icon with your certificate widget
    } else {
      // Handle other options here
      content = Container(); // Placeholder for other options
    }

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

        title: const Text("Diamond Details"),
        centerTitle: true, // Optionally, center the title horizontally
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: content,
            ),
            // Show content if not null
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image icon
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedOption = "image";
                    });
                  },
                  child: SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      elevation: 7,
                      child: Icon(
                        Icons.image,
                        color: selectedOption == "image"
                            ? mainColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                // Video icon
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedOption = "video";
                      _launchURLVideo(widget.diamondDetail.movieUrl);
                    });
                  },
                  child: SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      elevation: 7,
                      child: Icon(
                        Icons.video_call_sharp,
                        color: selectedOption == "video"
                            ? mainColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                // Certificate icon
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedOption = "certificate";
                      if (widget.diamondDetail.diaReport == "GIA" ||
                          widget.diamondDetail.diaReport == "IGI") {
                        _launchURL(widget.diamondDetail.diaReportNo,
                            widget.diamondDetail.diaReport);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Sorry!!! Not Available")));
                      }
                    });
                  },
                  child: SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      elevation: 7,
                      child: Icon(
                        Icons.class_rounded,
                        color: selectedOption == "certificate"
                            ? mainColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                // // Download icon
                // InkWell(
                //   onTap: () {
                //     setState(() {});
                //   },
                //   child: const SizedBox(
                //     width: widthOfSearchResultCard,
                //     height: heighOfSearchResultCard,
                //     child: Card(
                //       color: Colors.white,
                //       elevation: 7,
                //       child: Icon(Icons.download),
                //     ),
                //   ),
                // ),
                // Share icon
                InkWell(
                  onTap: () {
                    String pastDetail = """
Thank you for using KDLGia.com

Diamond Details:

Stone Id: ${widget.diamondDetail.id}
Lab: ${widget.diamondDetail.diaReport}
Shape: ${widget.diamondDetail.diaShape.toString().toUpperCase()}
Carat: ${widget.diamondDetail.diaCarat}
Clarity: ${widget.diamondDetail.diaClarity}
Color: ${widget.diamondDetail.diaColor}
Color Shade: ${widget.diamondDetail.diaColsh}
Cut/Pol/Sym: ${widget.diamondDetail.diaCut}/${widget.diamondDetail.diaPolish}/${widget.diamondDetail.diaSymmetry}
Measurement: ${widget.diamondDetail.diaDiameter}
Table: ${widget.diamondDetail.diaTable}
Depth: ${widget.diamondDetail.diaDepth}

Video: ${widget.diamondDetail.movieUrl}

Image: ${widget.diamondDetail.imageUrl}
""";
                    const snackBar = SnackBar(
                      content: Text("Copy to Clipboard"),
                      duration: Duration(seconds: 5),
                    );
                    // fetchDnaData(widget.)
                    _showShareOptions(context, pastDetail, snackBar);

                    setState(() {
                      selectedOption = "image";
                    });
                  },
                  child: const SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      color: Colors.white,
                      elevation: 7,
                      child: Icon(Icons.share),
                    ),
                  ),
                ),
                // Add to cart icon
                //     InkWell(
                //       onTap: () {
                //         setState(() {});
                //       },
                //       child: const SizedBox(
                //         width: widthOfSearchResultCard,
                //         height: heighOfSearchResultCard,
                //         child: Card(
                //           color: Colors.white,
                //           elevation: 7,
                //           child: Icon(Icons.shopping_cart),
                //         ),
                //       ),
                //     ),
              ],
            ),

            StyledText(
              text:
                  "${widget.diamondDetail.diaShape.toUpperCase()} ${widget.diamondDetail.id}",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            StyledText(
              text: "Rap. %: ${widget.diamondDetail.back}",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            StyledText(
              text: "Amount: ${widget.diamondDetail.dollar1}",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: mainColor,
            ),
            const SizedBox(
              height: 5,
            ),
            const StyledText(
              text: "About",
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
            Table(
              children: [
                TableRow(children: [
                  TableCell(
                      child: StyledTextSearchDetail(
                    text: "CT: ${widget.diamondDetail.diaCarat}",
                  )),
                  TableCell(
                      child: StyledTextSearchDetail(
                    text:
                        "T:${widget.diamondDetail.diaTable} T.D:${widget.diamondDetail.diaDepth}",
                  ))
                ]),
                TableRow(children: [
                  TableCell(
                      child: StyledTextSearchDetail(
                    text:
                        "${widget.diamondDetail.diaClarity} ${widget.diamondDetail.diaColor} ${widget.diamondDetail.diaCut}-${widget.diamondDetail.diaPolish}-${widget.diamondDetail.diaSymmetry} ${widget.diamondDetail.diaFluorescence}",
                  )),
                  TableCell(
                      child: StyledTextSearchDetail(
                    text: "Dia: ${widget.diamondDetail.diaDiameter}",
                  ))
                ]),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Card.filled(
                color: Colors.white,
                elevation: 7,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          detailIsSelected =
                              !detailIsSelected; // Toggle the expansion state
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(paddingInsidCard),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextStyleHeader(
                                    text: "Detail",
                                    colors: detailIsSelected
                                        ? mainColor
                                        : Colors.black),
                                const Spacer(), // Use Spacer widget to fill available space
                                Icon(
                                  detailIsSelected
                                      ? Icons.arrow_upward_rounded
                                      : Icons.arrow_downward_rounded,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            if (detailIsSelected)
              Table(
                children: [
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Item.No:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: "${widget.diamondDetail.id}"))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Cert.No:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text:
                                "${widget.diamondDetail.diaReport} ${widget.diamondDetail.diaReportNo}"))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Shape:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaShape))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Carats:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaCarat))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Clarity:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaClarity))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Color:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaColor)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Cut/Pol/Sym:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text:
                                "${widget.diamondDetail.diaCut} / ${widget.diamondDetail.diaPolish} / ${widget.diamondDetail.diaSymmetry}")),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Fluorescence:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaFluorescence)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Measurement:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaDiameter)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child:
                            StyledTextSearchDetail(text: "Laser Inscription:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaIns)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Price (USD):")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.dollar1)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Discount %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.back))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Rap:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.rap)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Key To Symbol:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.dia_kts))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Comment:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaNote))
                  ]),
                ],
              ),
            const SizedBox(
              height: 5,
            ),
            Card.filled(
                color: Colors.white,
                elevation: 7,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          additionalDetailIsSelected =
                              !additionalDetailIsSelected; // Toggle the expansion state
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(paddingInsidCard),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextStyleHeader(
                                    text: "Additional Detail",
                                    colors: additionalDetailIsSelected
                                        ? mainColor
                                        : Colors.black),
                                const Spacer(), // Use Spacer widget to fill available space
                                Icon(
                                  additionalDetailIsSelected
                                      ? Icons.arrow_upward_rounded
                                      : Icons.arrow_downward_rounded,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            if (additionalDetailIsSelected)
              Table(
                children: [
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Total Depth %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaDepth)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Table %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaTable)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Crown Angle %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaCa)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child:
                            StyledTextSearchDetail(text: "Pavilion Angle %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaPa)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Price (RMB):")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.rmb)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "RMB Tax %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.rmb)),
                  ]),
                  const TableRow(children: [
                    TableCell(
                        child: StyledTextSearchDetail(text: "Fancy Diamond")),
                    TableCell(child: StyledTextSearchDetail(text: "")),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Color:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaColorColor)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child:
                            StyledTextSearchDetail(text: "Color Intensity:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaColorIntensity)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Color Overtone:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaColorOvertone)),
                  ]),
                ],
              ),
            Card.filled(
                color: Colors.white,
                elevation: 7,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          kdlImpexDetailIsSelected =
                              !kdlImpexDetailIsSelected; // Toggle the expansion state
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(paddingInsidCard),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextStyleHeader(
                                    text: "KDLGia Detail",
                                    colors: kdlImpexDetailIsSelected
                                        ? mainColor
                                        : Colors.black),
                                const Spacer(), // Use Spacer widget to fill available space
                                Icon(
                                  kdlImpexDetailIsSelected
                                      ? Icons.arrow_upward_rounded
                                      : Icons.arrow_downward_rounded,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            if (kdlImpexDetailIsSelected)
              Table(
                children: [
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Black In Table:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaBt)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Black In Crown:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaBc)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "White In Table:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaWt)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "White In Crown:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaWc)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Milky:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaMilky)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Shade:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaColsh)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Eye Clean:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaEyeClean)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Heart & Arrow:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaHna)),
                  ]),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
