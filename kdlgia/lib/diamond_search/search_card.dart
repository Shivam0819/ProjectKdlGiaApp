import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kdlgia/api_assets_popup/imagePopup.dart';
import 'package:kdlgia/diamond_search/searchDetail.dart';
import 'package:kdlgia/style/search_card_ui.dart';
import 'package:kdlgia/style/styleTextSearchResult.dart';


class Diamond {
  final String stockNo;
  final String place;
  final String status;
  final String shape;
  final String carat;
  final String color;
  final String clarity;
  final String cut;
  final String polish;
  final String symmetry;
  final String fluorescence;
  final String measurements;
  final String report;
  final String reportNo;
  final String rap;
  final String back;
  final String price;
  final String colsh;
  final String milky;
  final String wc;
  final String wt;
  final String bt;
  final String bc;
  final String eyeClean;
  final String hna;
  final String ins;
  final String table;
  final String depth;
  final String ca;
  final String pa;
  final String keyToSymbols;
  final String culet;
  final String reportDate;
  final String special;
  final String arrive;
  final String image;
  final String movie;
  final String comments;

  Diamond({
    required this.stockNo,
    required this.place,
    required this.status,
    required this.shape,
    required this.carat,
    required this.color,
    required this.clarity,
    required this.cut,
    required this.polish,
    required this.symmetry,
    required this.fluorescence,
    required this.measurements,
    required this.report,
    required this.reportNo,
    required this.rap,
    required this.back,
    required this.price,
    required this.colsh,
    required this.milky,
    required this.wc,
    required this.wt,
    required this.bt,
    required this.bc,
    required this.eyeClean,
    required this.hna,
    required this.ins,
    required this.table,
    required this.depth,
    required this.ca,
    required this.pa,
    required this.keyToSymbols,
    required this.culet,
    required this.reportDate,
    required this.special,
    required this.arrive,
    required this.image,
    required this.movie,
    required this.comments,
  });
  Diamond copy() {
    return Diamond(
      stockNo: stockNo,
      place: place,
      status: status,
      shape: shape,
      carat: carat,
      color: color,
      clarity: clarity,
      cut: cut,
      polish: polish,
      symmetry: symmetry,
      fluorescence: fluorescence,
      measurements: measurements,
      report: report,
      reportNo: reportNo,
      rap: rap,
      back: back,
      price: price,
      colsh: colsh,
      milky: milky,
      wc: wc,
      wt: wt,
      bt: bt,
      bc: bc,
      eyeClean: eyeClean,
      hna: hna,
      ins: ins,
      table: table,
      depth: depth,
      ca: ca,
      pa: pa,
      keyToSymbols: keyToSymbols,
      culet: culet,
      reportDate: reportDate,
      special: special,
      arrive: arrive,
      image: image,
      movie: movie,
      comments: comments,
    );
  }

  factory Diamond.fromJson(List<dynamic> json) {
    return Diamond(
      stockNo: json[0],
      place: json[1],
      status: json[2],
      shape: json[3],
      carat: json[4],
      color: json[5],
      clarity: json[6],
      cut: json[7],
      polish: json[8],
      symmetry: json[9],
      fluorescence: json[10],
      measurements: json[11],
      report: json[12],
      reportNo: json[13],
      rap: json[14],
      back: json[15],
      price: json[16],
      colsh: json[17],
      milky: json[18],
      wc: json[19],
      wt: json[20],
      bt: json[21],
      bc: json[22],
      eyeClean: json[23],
      hna: json[24],
      ins: json[25],
      table: json[26],
      depth: json[27],
      ca: json[28],
      pa: json[29],
      keyToSymbols: json[30],
      culet: json[31],
      reportDate: json[32],
      special: json[33],
      arrive: json[34],
      image: json[35],
      movie: json[36],
      comments: json[37],
    );
  }

  @override
  String toString() {
    return 'Diamond(stockNo: $stockNo, place: $place, status: $status, shape: $shape, carat: $carat, color: $color, clarity: $clarity, cut: $cut, polish: $polish, symmetry: $symmetry, fluorescence: $fluorescence, measurements: $measurements, report: $report, reportNo: $reportNo, rap: $rap, back: $back, price: $price, colsh: $colsh, milky: $milky, wc: $wc, wt: $wt, bt: $bt, bc: $bc, eyeClean: $eyeClean, hna: $hna, ins: $ins, table: $table, depth: $depth, ca: $ca, pa: $pa, keyToSymbols: $keyToSymbols, culet: $culet, reportDate: $reportDate, special: $special, arrive: $arrive, image: $image, movie: $movie, comments: $comments)';
  }
}


class DiamondListPage extends StatefulWidget {
  const DiamondListPage({super.key});

  @override
  _DiamondListPageState createState() => _DiamondListPageState();
}

class _DiamondListPageState extends State<DiamondListPage> {
  late Future<List<Diamond>> _diamondsFuture;
  late int dataLength = 0;
  late Map<int, bool> isCheckedMap =
      {}; // Map to store isChecked state for each Diamond item
  late Map<int, bool> isStaredMap = {};

  @override
  void initState() {
    super.initState();
    _diamondsFuture = fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<List<Diamond>>(
          future: _diamondsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              dataLength = snapshot.data!.length;
              return Text("$dataLength Result");
            } else {
              return const Text('No data available');
            }
          },
        ),
      ),
      body: FutureBuilder<List<Diamond>>(
        future: _diamondsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            dataLength = snapshot.data!.length;

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                bool isChecked = isCheckedMap[index] ?? false;
                bool isStared = isStaredMap[index] ?? false;
                final diamond = snapshot.data![index];
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
                                padding: const EdgeInsets.all(paddingCard),
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
                                padding: const EdgeInsets.all(paddingCard),
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
                                top: paddingCard),
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
                    )),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.all(paddingCard), // Adjust the bottom padding as needed
        child: Container(
          height: 80, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Add rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => DiamondListPage()),
                  // );
                  // Add your onPressed callback here
                },
                child: const Column(
                  children: [
                    Icon(Icons.search_rounded),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text('Search Result'),
                  ],
                ),
              ),
              const TextButton(
                onPressed: null,
                child: Column(
                  children: [
                    Icon(Icons.save_rounded),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text('Save Search'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your onPressed callback here
                  setState(() {});
                },
                child: const Column(
                  children: [
                    Icon(Icons.border_clear_rounded),
                    SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text('Reset'),
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

Future<List<Diamond>> fetchItems(

) async {
  try {
    var response = await http.get(
      Uri.parse(
          'https://www.kdlgia.com/api/user/stock/12869/7943e512c591000287ceb1402bc101a1/'),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      List<Diamond> items = [];

      for (var row in jsonData['rows']) {
        // Map each row to a Diamond object
        items.add(Diamond.fromJson(row));
      }
      print(items);

      return items;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('Error: $error');
    throw Exception('Failed to load data');
  }
}




Future<List<Diamond>> advanceFatch({
  String? roundShp,
  String? princeShp,
  String? emraldShp,
  String? ovalShp,
  String? radiantShp,
  String? pearShp,
  String? marquiseShp,
  String? heartShp,
  String? cushionShp,
  String? othersShp,
  String? triangleShp,
  String? carat,
  String? caratFrom,
  String? caratTo,
  String? colD,
  String? colE,
  String? colF,
  String? colG,
  String? colH,
  String? colI,
  String? colJ,
  String? colK,
  String? colL,
  String? colM,
  String? colN,
  String? colO_P,
  String? colQ_R,
  String? colS_T,
  String? colU_V,
  String? colW_Z,
  String? claFl,
  String? claIf,
  String? claVvs1,
  String? claVvs2,
  String? claVs1,
  String? claVs2,
  String? claSi1,
  String? claSi2,
  String? claSi3,
  String? claI1,
  String? claI2,
  String? cutEx,
  String? cutVg,
  String? cutGd,
  String? cutFr,
  String? cutPr,
  String? cutNone,
  String? polEx,
  String? polVg,
  String? polGd,
  String? polFr,
  String? polPr,
  String? symEx,
  String? symVg,
  String? symGd,
  String? symFr,
  String? symPr,
  String? flN,
  String? flF,
  String? flM,
  String? flS,
  String? flVs,
  String? certGia,
  String? certIgi,
  String? certHrd,
  String? certNgtc,
  String? bjmYes,
  String? bjmNo,
  String? locIndia,
  String? locChina,
  String? locHk,
  String? locSz,
  String? locH_K,
  String? shortCut3EXN,
  String? shortCut3VGN,
  String? locTransit,

  // Define the corresponding isSelected properties as bool

  required bool roundShpIsSelected,
  required bool princeShpIsSelected,
  required bool emraldShpIsSelected,
  required bool ovalShpIsSelected,
  required bool radiantShpIsSelected,
  required bool pearShpIsSelected,
  required bool marquiseShpIsSelected,
  required bool heartShpIsSelected,
  required bool cushionShpIsSelected,
  required bool othersShpIsSelected,
  required bool triangleShpIsSelected,
  required bool caratIsSelected,
  required bool caratFromIsSelected,
  required bool caratToIsSelected,
  required bool colDIsSelected,
  required bool colEIsSelected,
  required bool colFIsSelected,
  required bool colGIsSelected,
  required bool colHIsSelected,
  required bool colIIsSelected,
  required bool colJIsSelected,
  required bool colKIsSelected,
  required bool colLIsSelected,
  required bool colMIsSelected,
  required bool colNIsSelected,
  required bool colO_PIsSelected,
  required bool colQ_RIsSelected,
  required bool colS_TIsSelected,
  required bool colU_VIsSelected,
  required bool colW_ZIsSelected,
  required bool claFlIsSelected,
  required bool claIfIsSelected,
  required bool claVvs1IsSelected,
  required bool claVvs2IsSelected,
  required bool claVs1IsSelected,
  required bool claVs2IsSelected,
  required bool claSi1IsSelected,
  required bool claSi2IsSelected,
  required bool claSi3IsSelected,
  required bool claI1IsSelected,
  required bool claI2IsSelected,
  required bool cutExIsSelected,
  required bool cutVgIsSelected,
  required bool cutGdIsSelected,
  required bool cutFrIsSelected,
  required bool cutPrIsSelected,
  required bool cutNoneIsSelected,
  required bool polExIsSelected,
  required bool polVgIsSelected,
  required bool polGdIsSelected,
  required bool polFrIsSelected,
  required bool polPrIsSelected,
  required bool symExIsSelected,
  required bool symVgIsSelected,
  required bool symGdIsSelected,
  required bool symFrIsSelected,
  required bool symPrIsSelected,
  required bool flNIsSelected,
  required bool flFIsSelected,
  required bool flMIsSelected,
  required bool flSIsSelected,
  required bool flVsIsSelected,
  required bool certGiaIsSelected,
  required bool certIgiIsSelected,
  required bool certHrdIsSelected,
  required bool certNgtcIsSelected,
  required bool bjmYesIsSelected,
  required bool bjmNoIsSelected,
  required bool locIndiaIsSelected,
  required bool locChinaIsSelected,
  required bool locHkIsSelected,
  required bool locSzIsSelected,
  required bool locH_KIsSelected,
  required bool locTransitIsSelected,
  required bool shortCut3EXNIsSelected,
  required bool shortCut3VGNIsSelected,
}) async {
  try {
    var response = await http.get(
      Uri.parse('https://www.kdlgia.com/api/user/stock/12869/7943e512c591000287ceb1402bc101a1/'),
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      List<Diamond> items = [];
      double? caratFromValue = double.tryParse(caratFrom ?? '');
      double? caratToValue = double.tryParse(caratTo ?? '');

      for (var row in jsonData['rows']) {
        Diamond data = Diamond.fromJson(row);
        Diamond? temp;

        if (roundShp?.toLowerCase() == null &&
            princeShp?.toLowerCase() == null &&
            emraldShp?.toLowerCase() == null &&
            radiantShp?.toLowerCase() == null &&
            ovalShp?.toLowerCase() == null &&
            pearShp?.toLowerCase() == null &&
            marquiseShp?.toLowerCase() == null &&
            heartShp?.toLowerCase() == null &&
            triangleShp?.toLowerCase() == null &&
            cushionShp?.toLowerCase() == null &&
            othersShp?.toLowerCase() == null) {
          temp = data;
        } else if (data.shape == roundShp?.toLowerCase() ||
            data.shape == princeShp?.toLowerCase() ||
            data.shape == emraldShp?.toLowerCase() ||
            data.shape == radiantShp?.toLowerCase() ||
            data.shape == ovalShp?.toLowerCase() ||
            data.shape == pearShp?.toLowerCase() ||
            data.shape == marquiseShp?.toLowerCase() ||
            data.shape == heartShp?.toLowerCase() ||
            data.shape == triangleShp?.toLowerCase() ||
            data.shape == cushionShp?.toLowerCase() ||
            data.shape == othersShp?.toLowerCase()) {
          temp = data;
        } else {
          continue;
        }

        if (colD == null &&
            colE == null &&
            colF == null &&
            colG == null &&
            colH == null &&
            colI == null &&
            colJ == null &&
            colK == null &&
            colL == null &&
            colM == null &&
            colN == null) {
          temp = data;
        } else if (data.color == colD ||
            data.color == colE ||
            data.color == colF ||
            data.color == colG ||
            data.color == colH ||
            data.color == colI ||
            data.color == colJ ||
            data.color == colK ||
            data.color == colL ||
            data.color == colM ||
            data.color == colN) {
          temp = data;
        } else {
          continue;
        }
        if (claFl == null &&
            claIf == null &&
            claVvs1 == null &&
            claVvs2 == null &&
            claVs1 == null &&
            claVs2 == null &&
            claSi1 == null &&
            claSi2 == null &&
            claSi3 == null &&
            claI1 == null &&
            claI2 == null) {
        } else if (data.clarity == claFl ||
            data.clarity == claIf ||
            data.clarity == claVvs1 ||
            data.clarity == claVvs2 ||
            data.clarity == claVs1 ||
            data.clarity == claVs2 ||
            data.clarity == claSi1 ||
            data.clarity == claSi2 ||
            data.clarity == claSi3 ||
            data.clarity == claI1 ||
            data.clarity == claI2) {
        } else {
          continue;
        }

        if (cutEx == null &&
            cutVg == null &&
            cutGd == null &&
            cutFr == null &&
            cutNone == null) {
          temp = data;
        } else if (data.cut == cutEx ||
            data.cut == cutVg ||
            data.cut == cutGd ||
            data.cut == cutFr ||
            data.cut == cutNone) {
          temp = data;
        } else {
          continue;
        }
        if (polEx == null &&
            polVg == null &&
            polGd == null &&
            polFr == null) {
          temp = data;
        } else if (data.cut == polEx ||
            data.cut == polVg ||
            data.cut == polGd ||
            data.cut == polFr) {
          temp = data;
        } else {
          continue;
        }
        if (symEx == null &&
            symVg == null &&
            symGd == null &&
            symFr == null) {
          temp = data;
        } else if (data.cut == symEx ||
            data.cut == symVg ||
            data.cut == symGd ||
            data.cut == symFr) {
          temp = data;
        } else {
          continue;
        }

        if (flN == null &&
            flF == null &&
            flM == null &&
            flS == null &&
            flVs == null) {
          temp = data;
        } else if (data.fluorescence == flN ||
            data.fluorescence == flF ||
            data.fluorescence == flM ||
            data.fluorescence == flS ||
            data.fluorescence == flVs) {
          temp = data;
        } else {
          continue;
        }
        if (certGia == null &&
            certIgi == null &&
            certNgtc == null &&
            certHrd == null) {
          temp = data;
        } else if (data.report == certGia ||
            data.report == certIgi ||
            data.report == certNgtc ||
            data.report == certHrd) {
          temp = data;
        } else {
          continue;
        }

        if (locChina == null &&
            locIndia == null &&
            locSz == null &&
            locHk == null &&
            locH_K == null &&
            locTransit == null) {
          temp = data;
        } else if (data.place == locChina ||
            data.place == locIndia ||
            data.place == locHk ||
            locSz == null ||
            data.place == locH_K ||
            data.place == locTransit) {
          temp = data;
        } else {
          continue;
        }
        if (caratFromValue != null && caratToValue != null) {
          if (double.parse(data.carat) >= caratFromValue &&
              double.parse(data.carat) <= caratToValue) {
            // print(data);
            // print("Hello");
            temp = data;
          } else {
            continue;
          }
        } else if (caratFromValue != null) {
          if (double.parse(data.carat) >= caratFromValue) {
            temp = data;
          } else {
            continue;
          }
        } else if (caratToValue != null) {
          if (double.parse(data.carat) <= caratToValue) {
            temp = data;
          } else {
            continue;
          }
        } else {
          temp = data;
        }

        items.add(temp);

       //help to find length
           

    }
  
      

      return items;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('Error: $error');
    throw Exception('Failed to load data');
  }
}
