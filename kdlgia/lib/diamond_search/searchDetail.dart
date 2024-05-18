import 'package:flutter/material.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';
import 'package:kdlgia/style/textStyle.dart';

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
                  child: const SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      color: Colors.white,
                      elevation: 7,
                      child: Icon(Icons.image),
                    ),
                  ),
                ),
                // Video icon
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedOption = "video";
                    });
                  },
                  child: const SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      color: Colors.white,
                      elevation: 7,
                      child: Icon(Icons.video_call_sharp),
                    ),
                  ),
                ),
                // Certificate icon
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedOption = "certificate";
                    });
                  },
                  child: const SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      color: Colors.white,
                      elevation: 7,
                      child: Icon(Icons.picture_as_pdf),
                    ),
                  ),
                ),
                // Download icon
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: const SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      color: Colors.white,
                      elevation: 7,
                      child: Icon(Icons.download),
                    ),
                  ),
                ),
                // Share icon
                InkWell(
                  onTap: () {
                    setState(() {});
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
                InkWell(
                  onTap: () {
                    setState(() {});
                  },
                  child: const SizedBox(
                    width: widthOfSearchResultCard,
                    height: heighOfSearchResultCard,
                    child: Card(
                      color: Colors.white,
                      elevation: 7,
                      child: Icon(Icons.shopping_cart),
                    ),
                  ),
                ),
              ],
            ),

            StyledText(
              text:
                  "${widget.diamondDetail.diaShape.toUpperCase()} ${widget.diamondDetail.id}",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            StyledText(
              text: "Rap. %: ${widget.diamondDetail.back}",
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
            StyledText(
                text: "Price: ${widget.diamondDetail.dollar1}",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              color: Colors.redAccent,
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
                      child: StyledText(
                    text:
                        "${widget.diamondDetail.diaClarity} ${widget.diamondDetail.diaColor} ${widget.diamondDetail.diaCut}-${widget.diamondDetail.diaPolish}-${widget.diamondDetail.diaSymmetry} ${widget.diamondDetail.diaFluorescence}",
                  )),
                  TableCell(
                      child: StyledText(
                    text:
                        "${widget.diamondDetail.diaColor} ${widget.diamondDetail.diaDepth}",
                  ))
                ]),
                TableRow(children: [
                  TableCell(
                      child: StyledText(
                    text:
                        "CT: ${widget.diamondDetail.diaCarat} T: ${widget.diamondDetail.diaTable}}",
                  )),
                  TableCell(
                      child: StyledText(
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
                    const TableCell(child: StyledTextSearchDetail(text: "Ref.No:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaReportNo))
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Shape:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaShape))
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Carats:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaCarat))
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Clarity:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaClarity))
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Color:")),
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
                    const TableCell(child: StyledTextSearchDetail(text: "Color:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaColor)),
                  ]),
                  const TableRow(children: [
                    TableCell(child: StyledTextSearchDetail(text: "L:W::")),
                    TableCell(child: StyledTextSearchDetail(text: "0.00")),
                  ]),
                  const TableRow(children: [
                    TableCell(child: StyledTextSearchDetail(text: "SGS:")),
                    TableCell(child: StyledTextSearchDetail(text: "")),
                  ]),
                  const TableRow(children: [
                    TableCell(
                        child:
                            StyledTextSearchDetail(text: "Laser Inscription")),
                    TableCell(child: StyledTextSearchDetail(text: "")),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Price:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.dollar1)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Rap Back %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.back)),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Rap Rate:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.rap)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Key To Symbol:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaSerial)),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Commenr:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaCa)),
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
                            text: widget.diamondDetail.diaDepth))
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Table %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaTable))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Crown Height %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaCa))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Pav. Height %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaPa))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Pa Height:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaHna)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Cut/Pol/Sym:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaWt)),
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
                    const TableCell(child: StyledTextSearchDetail(text: "Color:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaColor)),
                  ]),
                  const TableRow(children: [
                    TableCell(child: StyledTextSearchDetail(text: "L:W::")),
                    TableCell(child: StyledTextSearchDetail(text: "0.00")),
                  ]),
                  const TableRow(children: [
                    TableCell(child: StyledTextSearchDetail(text: "SGS:")),
                    TableCell(child: StyledTextSearchDetail(text: "")),
                  ]),
                  const TableRow(children: [
                    TableCell(
                        child:
                            StyledTextSearchDetail(text: "Laser Inscription")),
                    TableCell(child: StyledTextSearchDetail(text: "")),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Price:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.dollar1)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Rap Back %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.back)),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Rap Rate:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.rap)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Key To Symbol:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaTable)),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Commenr:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaClarity)),
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
                        child: StyledTextSearchDetail(text: "Total Depth %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaDepth))
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Table %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaTable))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Crown Height %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaCa))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Pav. Height %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaPa))
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Pa Height:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaHna)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Cut/Pol/Sym:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaWt)),
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
                    const TableCell(child: StyledTextSearchDetail(text: "Color:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaColor)),
                  ]),
                  const TableRow(children: [
                    TableCell(child: StyledTextSearchDetail(text: "L:W::")),
                    TableCell(child: StyledTextSearchDetail(text: "0.00")),
                  ]),
                  const TableRow(children: [
                    TableCell(child: StyledTextSearchDetail(text: "SGS:")),
                    TableCell(child: StyledTextSearchDetail(text: "")),
                  ]),
                  const TableRow(children: [
                    TableCell(
                        child:
                            StyledTextSearchDetail(text: "Laser Inscription")),
                    TableCell(child: StyledTextSearchDetail(text: "")),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Price:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.dollar1)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Rap Back %:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.back)),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Rap Rate:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.rap)),
                  ]),
                  TableRow(children: [
                    const TableCell(
                        child: StyledTextSearchDetail(text: "Key To Symbol:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaTable)),
                  ]),
                  TableRow(children: [
                    const TableCell(child: StyledTextSearchDetail(text: "Commenr:")),
                    TableCell(
                        child: StyledTextSearchDetail(
                            text: widget.diamondDetail.diaClarity)),
                  ]),
                ],
              ),
            
          ],
        ),
      ),
    );
  }
}
