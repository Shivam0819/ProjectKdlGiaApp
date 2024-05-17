import 'package:flutter/material.dart';
import 'package:kdlgia/diamond_search/diamondSearch.dart';
import 'package:kdlgia/diamond_search/search_card.dart';
import 'package:kdlgia/style/search_card_ui.dart';
// import 'package:KDLGia/api_assets_popup/videoPopUp.dart';
// import 'package:kdlgia/diamond_search/search_card.dart';
// import 'package:kdlgia/search_navigation_ui/search_ui.dart';
// import 'package:kdlgia/style/search_card_ui.dart';

class SearchUi extends StatefulWidget {
  // SearchUi({required this.diamondsFuture});
  // Define all the properties with appropriate types
  // Add '?' to indicate they can be null
  String? roundShp;
  String? princeShp;
  String? emraldShp;
  String? ovalShp;
  String? radiantShp;
  String? pearShp;
  String? marquiseShp;
  String? heartShp;
  String? cushionShp;
  String? othersShp;
  String? triangleShp;
  String? carat;
  String? caratFrom;
  String? caratTo;
  String? colD;
  String? colE;
  String? colF;
  String? colG;
  String? colH;
  String? colI;
  String? colJ;
  String? colK;
  String? colL;
  String? colM;
  String? colN;
  String? colO_P;
  String? colQ_R;
  String? colS_T;
  String? colU_V;
  String? colW_Z;
  String? claFl;
  String? claIf;
  String? claVvs1;
  String? claVvs2;
  String? claVs1;
  String? claVs2;
  String? claSi1;
  String? claSi2;
  String? claSi3;
  String? claI1;
  String? claI2;
  String? cutEx;
  String? cutVg;
  String? cutGd;
  String? cutFr;
  String? cutPr;
  String? cutNone;
  String? polEx;
  String? polVg;
  String? polGd;
  String? polFr;
  String? polPr;
  String? symEx;
  String? symVg;
  String? symGd;
  String? symFr;
  String? symPr;
  String? flN;
  String? flF;
  String? flM;
  String? flS;
  String? flVs;
  String? certGia;
  String? certIgi;
  String? certHrd;
  String? certNgtc;
  String? bjmYes;
  String? bjmNo;
  String? locIndia;
  String? locChina;
  String? locHk;
  String? locSz;
  String? locH_K;
  String? shortCut3EXN;
  String? shortCut3VGN;
  String? locTransit;

  // Define the corresponding isSelected properties as bool

  bool roundShpIsSelected = false;
  bool princeShpIsSelected = false;
  bool emraldShpIsSelected = false;
  bool ovalShpIsSelected = false;
  bool radiantShpIsSelected = false;
  bool pearShpIsSelected = false;
  bool marquiseShpIsSelected = false;
  bool heartShpIsSelected = false;
  bool cushionShpIsSelected = false;
  bool othersShpIsSelected = false;
  bool triangleShpIsSelected = false;
  bool caratIsSelected = false;
  bool caratFromIsSelected = false;
  bool caratToIsSelected = false;
  bool colDIsSelected = false;
  bool colEIsSelected = false;
  bool colFIsSelected = false;
  bool colGIsSelected = false;
  bool colHIsSelected = false;
  bool colIIsSelected = false;
  bool colJIsSelected = false;
  bool colKIsSelected = false;
  bool colLIsSelected = false;
  bool colMIsSelected = false;
  bool colNIsSelected = false;
  bool colO_PIsSelected = false;
  bool colQ_RIsSelected = false;
  bool colS_TIsSelected = false;
  bool colU_VIsSelected = false;
  bool colW_ZIsSelected = false;
  bool claFlIsSelected = false;
  bool claIfIsSelected = false;
  bool claVvs1IsSelected = false;
  bool claVvs2IsSelected = false;
  bool claVs1IsSelected = false;
  bool claVs2IsSelected = false;
  bool claSi1IsSelected = false;
  bool claSi2IsSelected = false;
  bool claSi3IsSelected = false;
  bool claI1IsSelected = false;
  bool claI2IsSelected = false;
  bool cutExIsSelected = false;
  bool cutVgIsSelected = false;
  bool cutGdIsSelected = false;
  bool cutFrIsSelected = false;
  bool cutPrIsSelected = false;
  bool cutNoneIsSelected = false;
  bool polExIsSelected = false;
  bool polVgIsSelected = false;
  bool polGdIsSelected = false;
  bool polFrIsSelected = false;
  bool polPrIsSelected = false;
  bool symExIsSelected = false;
  bool symVgIsSelected = false;
  bool symGdIsSelected = false;
  bool symFrIsSelected = false;
  bool symPrIsSelected = false;
  bool flNIsSelected = false;
  bool flFIsSelected = false;
  bool flMIsSelected = false;
  bool flSIsSelected = false;
  bool flVsIsSelected = false;
  bool certGiaIsSelected = false;
  bool certIgiIsSelected = false;
  bool certHrdIsSelected = false;
  bool certNgtcIsSelected = false;
  bool bjmYesIsSelected = false;
  bool bjmNoIsSelected = false;
  bool locIndiaIsSelected = false;
  bool locChinaIsSelected = false;
  bool locHkIsSelected = false;
  bool locSzIsSelected = false;
  bool locH_KIsSelected = false;
  bool locTransitIsSelected = false;
  bool shortCut3EXNIsSelected = false;
  bool shortCut3VGNIsSelected = false;

  List<Diamond> snapshotData = [];

  SearchUi({super.key});

  @override
  _SearchUiState createState() => _SearchUiState();
}

class _SearchUiState extends State<SearchUi> {
  int datalength = 0;
  List<Diamond> resultFilterDiamond = [];
  Future<void> filterFunction() async {
    print(resultFilterDiamond.length);
    List<Diamond> originalDiamonds = await diamondsFuture;
    List<Diamond> filteredDiamonds = List.from(originalDiamonds);
    double? caratFromValue = double.tryParse(widget.caratFrom ?? '');
    double? caratToValue = double.tryParse(widget.caratTo ?? '');
    print(
        "Result ${identityHashCode(resultFilterDiamond)} Original: ${identityHashCode(originalDiamonds)}  FIlter: ${identityHashCode(filteredDiamonds)} Diamond Future: ${identityHashCode(diamondsFuture)}");
    // resultFilterDiamond = [...filteredDiamonds];
    if (!widget.roundShpIsSelected &
        !widget.princeShpIsSelected &
        !widget.emraldShpIsSelected &
        !widget.ovalShpIsSelected &
        !widget.radiantShpIsSelected &
        !widget.pearShpIsSelected &
        !widget.marquiseShpIsSelected &
        !widget.heartShpIsSelected &
        !widget.cushionShpIsSelected &
        !widget.othersShpIsSelected &
        !widget.triangleShpIsSelected &
        !widget.caratIsSelected &
        !widget.caratFromIsSelected &
        !widget.caratToIsSelected &
        (widget.caratFrom == null) &
        (widget.caratTo == null) &
        !widget.colDIsSelected &
        !widget.colEIsSelected &
        !widget.colFIsSelected &
        !widget.colGIsSelected &
        !widget.colHIsSelected &
        !widget.colIIsSelected &
        !widget.colJIsSelected &
        !widget.colKIsSelected &
        !widget.colLIsSelected &
        !widget.colMIsSelected &
        !widget.colNIsSelected &
        !widget.colO_PIsSelected &
        !widget.colQ_RIsSelected &
        !widget.colS_TIsSelected &
        !widget.colU_VIsSelected &
        !widget.colW_ZIsSelected &
        !widget.claFlIsSelected &
        !widget.claIfIsSelected &
        !widget.claVvs1IsSelected &
        !widget.claVvs2IsSelected &
        !widget.claVs1IsSelected &
        !widget.claVs2IsSelected &
        !widget.claSi1IsSelected &
        !widget.claSi2IsSelected &
        !widget.claSi3IsSelected &
        !widget.claI1IsSelected &
        !widget.claI2IsSelected &
        !widget.cutExIsSelected &
        !widget.cutVgIsSelected &
        !widget.cutGdIsSelected &
        !widget.cutFrIsSelected &
        !widget.cutPrIsSelected &
        !widget.cutNoneIsSelected &
        !widget.polExIsSelected &
        !widget.polVgIsSelected &
        !widget.polGdIsSelected &
        !widget.polFrIsSelected &
        !widget.polPrIsSelected &
        !widget.symExIsSelected &
        !widget.symVgIsSelected &
        !widget.symGdIsSelected &
        !widget.symFrIsSelected &
        !widget.symPrIsSelected &
        !widget.flNIsSelected &
        !widget.flFIsSelected &
        !widget.flMIsSelected &
        !widget.flSIsSelected &
        !widget.flVsIsSelected &
        !widget.certGiaIsSelected &
        !widget.certIgiIsSelected &
        !widget.certHrdIsSelected &
        !widget.certNgtcIsSelected &
        !widget.bjmYesIsSelected &
        !widget.bjmNoIsSelected &
        !widget.locIndiaIsSelected &
        !widget.locChinaIsSelected &
        !widget.locHkIsSelected &
        !widget.locSzIsSelected &
        !widget.locH_KIsSelected &
        !widget.locTransitIsSelected &
        !widget.shortCut3EXNIsSelected &
        !widget.shortCut3VGNIsSelected) {
      resultFilterDiamond = [...filteredDiamonds];
      print(
          "${resultFilterDiamond.length}   ${originalDiamonds.length}    ${filteredDiamonds.length}");
      print(
          "Tttttttttttttttttttttttttttttttttttttttttt: Result ${identityHashCode(resultFilterDiamond)} Original: ${identityHashCode(originalDiamonds)}  FIlter: ${identityHashCode(filteredDiamonds)} Diamond Future: ${identityHashCode(diamondsFuture)}");

      print(
          "*********************object ${resultFilterDiamond.length} ${widget.snapshotData.length}"); //help to find length
    } else {
      resultFilterDiamond.clear();
      print("object:***********************${resultFilterDiamond.length}");
      // print("I am here************************");
      // print(widget.roundShp);
      for (var data in widget.snapshotData) {
        // print("I am here******************");
        // ISSUE i understand the problem is every only shape has value and other clary cut and other operator are null and its and operator so need some thing is every element of col and other is D then by default it should filter all in perticular clarity
        Diamond? temp;

        if (widget.roundShp?.toLowerCase() == null &&
            widget.princeShp?.toLowerCase() == null &&
            widget.emraldShp?.toLowerCase() == null &&
            widget.radiantShp?.toLowerCase() == null &&
            widget.ovalShp?.toLowerCase() == null &&
            widget.pearShp?.toLowerCase() == null &&
            widget.marquiseShp?.toLowerCase() == null &&
            widget.heartShp?.toLowerCase() == null &&
            widget.triangleShp?.toLowerCase() == null &&
            widget.cushionShp?.toLowerCase() == null &&
            widget.othersShp?.toLowerCase() == null) {
          temp = data;
        } else if (data.shape == widget.roundShp?.toLowerCase() ||
            data.shape == widget.princeShp?.toLowerCase() ||
            data.shape == widget.emraldShp?.toLowerCase() ||
            data.shape == widget.radiantShp?.toLowerCase() ||
            data.shape == widget.ovalShp?.toLowerCase() ||
            data.shape == widget.pearShp?.toLowerCase() ||
            data.shape == widget.marquiseShp?.toLowerCase() ||
            data.shape == widget.heartShp?.toLowerCase() ||
            data.shape == widget.triangleShp?.toLowerCase() ||
            data.shape == widget.cushionShp?.toLowerCase() ||
            data.shape == widget.othersShp?.toLowerCase()) {
          temp = data;
        } else {
          continue;
        }

        if (widget.colD == null &&
            widget.colE == null &&
            widget.colF == null &&
            widget.colG == null &&
            widget.colH == null &&
            widget.colI == null &&
            widget.colJ == null &&
            widget.colK == null &&
            widget.colL == null &&
            widget.colM == null &&
            widget.colN == null) {
          temp = data;
        } else if (data.color == widget.colD ||
            data.color == widget.colE ||
            data.color == widget.colF ||
            data.color == widget.colG ||
            data.color == widget.colH ||
            data.color == widget.colI ||
            data.color == widget.colJ ||
            data.color == widget.colK ||
            data.color == widget.colL ||
            data.color == widget.colM ||
            data.color == widget.colN) {
          temp = data;
        } else {
          continue;
        }
        if (widget.claFl == null &&
            widget.claIf == null &&
            widget.claVvs1 == null &&
            widget.claVvs2 == null &&
            widget.claVs1 == null &&
            widget.claVs2 == null &&
            widget.claSi1 == null &&
            widget.claSi2 == null &&
            widget.claSi3 == null &&
            widget.claI1 == null &&
            widget.claI2 == null) {
              temp =data;
        } else if (data.clarity == widget.claFl ||
            data.clarity == widget.claIf ||
            data.clarity == widget.claVvs1 ||
            data.clarity == widget.claVvs2 ||
            data.clarity == widget.claVs1 ||
            data.clarity == widget.claVs2 ||
            data.clarity == widget.claSi1 ||
            data.clarity == widget.claSi2 ||
            data.clarity == widget.claSi3 ||
            data.clarity == widget.claI1 ||
            data.clarity == widget.claI2) {
        } else {
          continue;
        }

        if (widget.cutEx == null &&
            widget.cutVg == null &&
            widget.cutGd == null &&
            widget.cutFr == null &&
            widget.cutNone == null) {
          temp = data;
        } else if (data.cut == widget.cutEx ||
            data.cut == widget.cutVg ||
            data.cut == widget.cutGd ||
            data.cut == widget.cutFr ||
            data.cut == widget.cutNone) {
          temp = data;
        } else {
          continue;
        }
        if (widget.polEx == null &&
            widget.polVg == null &&
            widget.polGd == null &&
            widget.polFr == null) {
          temp = data;
        } else if (data.polish == widget.polEx ||
            data.polish == widget.polVg ||
            data.polish == widget.polGd ||
            data.polish == widget.polFr) {
          temp = data;
        } else {
          continue;
        }
        if (widget.symEx == null &&
            widget.symVg == null &&
            widget.symGd == null &&
            widget.symFr == null) {
          temp = data;
        } else if (data.symmetry == widget.symEx ||
            data.symmetry == widget.symVg ||
            data.symmetry == widget.symGd ||
            data.symmetry == widget.symFr) {
          temp = data;
        } else {
          continue;
        }

        if (widget.flN == null &&
            widget.flF == null &&
            widget.flM == null &&
            widget.flS == null &&
            widget.flVs == null) {
          temp = data;
        } else if (data.fluorescence == widget.flN ||
            data.fluorescence == widget.flF ||
            data.fluorescence == widget.flM ||
            data.fluorescence == widget.flS ||
            data.fluorescence == widget.flVs) {
          temp = data;
        } else {
          continue;
        }
        if (widget.certGia == null &&
            widget.certIgi == null &&
            widget.certNgtc == null &&
            widget.certHrd == null) {
          temp = data;
        } else if (data.report == widget.certGia ||
            data.report == widget.certIgi ||
            data.report == widget.certNgtc ||
            data.report == widget.certHrd) {
          temp = data;
        } else {
          continue;
        }

        if (widget.locChina == null &&
            widget.locIndia == null &&
            widget.locSz == null &&
            widget.locHk == null &&
            widget.locH_K == null &&
            widget.locTransit == null) {
          temp = data;
        } else if (data.place == widget.locChina ||
            data.place == widget.locIndia ||
            data.place == widget.locHk ||
            data.place == widget.locSz ||
            data.place == widget.locH_K ||
            data.place == widget.locTransit) {
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

        resultFilterDiamond.add(temp.copy());
      }

      //  print(
      //     "ffffffffffffffffffffffffffffffffffff*********************object ${resultFilterDiamond.length} ${filteredDiamonds.length}"); //help to find length
    }
    //help to find length
  }

  late Future<List<Diamond>> diamondsFuture;
  late Future<List<Diamond>> advanceDiamondsFuture;

  late TextEditingController _controllerCaratFrom;
  late TextEditingController _controllerCaratTo;

  @override
  void initState() {
    super.initState();
    _controllerCaratFrom = TextEditingController();
    _controllerCaratTo = TextEditingController();
    diamondsFuture = fetchItems();
  }

  @override
  void dispose() {
    _controllerCaratFrom.dispose();
    _controllerCaratTo.dispose();
    super.dispose();
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

        title: FutureBuilder<List<Diamond>>(
          future: diamondsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // datalength = snapshot.data!.length;
              // resultFilterDiamond = snapshot.data!;
              widget.snapshotData = [...snapshot.data!];
              return Text("${widget.snapshotData.length} Total Stock");
            } else {
              return const Text('0');
            }
          },
        ),
        centerTitle: true, // Optionally, center the title horizontally
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  // **********Shape*********//
                  SizedBox(
                    height: 140, // Provide a fixed height or other constraints
                    child: Container(
                      height: 130,
                      padding: const EdgeInsets.all(paddingFullSearchWidget),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Shape",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                // *********Round*******
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.roundShpIsSelected =
                                              !widget.roundShpIsSelected;
                                          widget.roundShp =
                                              widget.roundShpIsSelected
                                                  ? "Round"
                                                  : null;
                                          // Toggle isSelected flag
                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.roundShpIsSelected
                                                ? mainColor
                                                : null,
                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/round.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Round",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: widget.roundShpIsSelected
                                                  ? mainColor
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),

                                // *********Princess*****
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.princeShpIsSelected =
                                              !widget.princeShpIsSelected;
                                          widget.princeShp =
                                              widget.princeShpIsSelected
                                                  ? "Princess"
                                                  : null;
                                          // Toggle isSelected flag
                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.princeShpIsSelected
                                                ? mainColor
                                                : null,
                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/princes.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Princess",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: widget.princeShpIsSelected
                                                  ? mainColor
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                //************* Emerald */
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.emraldShpIsSelected =
                                              !widget.emraldShpIsSelected;
                                          widget.emraldShp = widget
                                                  .emraldShpIsSelected
                                              ? "Emerald"
                                              : null; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.emraldShpIsSelected
                                                ? mainColor
                                                : null,
                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/emerald.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Emerald",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: widget.emraldShpIsSelected
                                                  ? mainColor
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                //***********Oval **********//
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.ovalShpIsSelected =
                                              !widget.ovalShpIsSelected;
                                          widget.ovalShp = widget
                                                  .ovalShpIsSelected
                                              ? "Oval"
                                              : null; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.ovalShpIsSelected
                                                ? mainColor
                                                : null,
                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/oval.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Oval",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: widget.ovalShpIsSelected
                                                  ? mainColor
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                //**********Pear *******//
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.pearShpIsSelected =
                                              !widget.pearShpIsSelected;
                                          widget.pearShp = widget
                                                  .pearShpIsSelected
                                              ? "Pear"
                                              : null; 
                                          // Toggle isSelected flag

                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.pearShpIsSelected
                                                ? mainColor
                                                : null,
                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/pear.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Pear",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: widget.pearShpIsSelected
                                                  ? mainColor
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                //***********Marquise **********//
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.marquiseShpIsSelected =
                                              !widget.marquiseShpIsSelected;
                                          widget.marquiseShp = widget
                                                  .marquiseShpIsSelected
                                              ? "Marquise"
                                              : null; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.marquiseShpIsSelected
                                                ? mainColor
                                                : null,
                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/morquise.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Marquise",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  widget.marquiseShpIsSelected
                                                      ? mainColor
                                                      : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                //*********** Heart *************//
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.heartShpIsSelected =
                                              !widget.heartShpIsSelected;
                                          widget.heartShp = widget
                                                  .heartShpIsSelected
                                              ? "Heart"
                                              : null; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.heartShpIsSelected
                                                ? mainColor
                                                : null,

                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/heart.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Heart",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: widget.heartShpIsSelected
                                                  ? mainColor
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                //****************Triangle ************//
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.triangleShpIsSelected =
                                              !widget.triangleShpIsSelected;
                                          widget.triangleShp = widget
                                                  .triangleShpIsSelected
                                              ? "Triangle"
                                              : null; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.triangleShpIsSelected
                                                ? mainColor
                                                : null,
                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/triangle.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Triangle",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  widget.triangleShpIsSelected
                                                      ? mainColor
                                                      : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                //*************Cushion ********//
                                SizedBox(
                                    width: 81,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.cushionShpIsSelected =
                                              !widget.cushionShpIsSelected;
                                          widget.cushionShp = widget
                                                  .cushionShpIsSelected
                                              ? "Cushion"
                                              : null; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: elevationOfCard,

                                            color: widget.cushionShpIsSelected
                                                ? mainColor
                                                : null,
                                            margin: const EdgeInsets.all(
                                                paddingCard),
                                            // Set color based on isSelected flag

                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  paddingCard),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/Images/cushion.png',
                                                    width:
                                                        35, // Adjust width as needed
                                                    height:
                                                        35, // Adjust height as needed
                                                  ),
                                                  // Changed to height for vertical spacing
                                                ],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Cushion",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: widget.cushionShpIsSelected
                                                  ? mainColor
                                                  : null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                //**************** Other*********//
                                SizedBox(
                                  width: 81,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        widget.othersShpIsSelected =
                                            !widget.othersShpIsSelected;
                                        widget.othersShp = widget
                                                .othersShpIsSelected
                                            ? "Other"
                                            : null; // Toggle isSelected flag
                                        filterFunction();
                                      });
                                    },
                                    child: Column(
                                      children: [
                                        Card(
                                          elevation: elevationOfCard,

                                          color: widget.othersShpIsSelected
                                              ? mainColor
                                              : null,
                                          margin:
                                              const EdgeInsets.all(paddingCard),
                                          // Set color based on isSelected flag

                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                paddingCard),
                                            child: Column(
                                              children: [
                                                Image.asset(
                                                  'assets/Images/other.png',
                                                  width:
                                                      35, // Adjust width as needed
                                                  height:
                                                      35, // Adjust height as needed
                                                ),
                                                // Changed to height for vertical spacing
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Other",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: widget.othersShpIsSelected
                                                ? mainColor
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // **********Carat*********//
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Carat",
                            style: TextStyle(
                              fontSize: fontSizeHeading,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Card(
                                  elevation: elevationOfCard,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: TextField(
                                      controller: _controllerCaratFrom,
                                      cursorWidth: 2.0,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'From',
                                        hintText: '0.0',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          widget.caratFrom =
                                              _controllerCaratFrom.text
                                                  .toString();
                                          print("Called cart");
                                          filterFunction(); // Trigger filter function after updating the value
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Card(
                                  elevation: elevationOfCard,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: TextField(
                                      controller: _controllerCaratTo,
                                      cursorWidth: 2.0,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'To',
                                        hintText: '0.0',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          widget.caratTo = _controllerCaratTo
                                              .text
                                              .toString();
                                          filterFunction();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // **********Color*********//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Colors",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                // ******* D **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colDIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colDIsSelected = !widget
                                              .colDIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colD = (widget.colDIsSelected)
                                            ? "D"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "D",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* E **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colEIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colEIsSelected = !widget
                                              .colEIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colE = (widget.colEIsSelected)
                                            ? "E"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "E",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* F **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colFIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colFIsSelected = !widget
                                              .colFIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colF = (widget.colFIsSelected)
                                            ? "F"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "F",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* G **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colGIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colGIsSelected = !widget
                                              .colGIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colG = (widget.colGIsSelected)
                                            ? "G"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "G",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* H **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colHIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colHIsSelected = !widget
                                              .colHIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colH = (widget.colHIsSelected)
                                            ? "H"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "H",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* I **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colIIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colIIsSelected = !widget
                                              .colIIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colI = (widget.colIIsSelected)
                                            ? "I"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "I",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* J **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colJIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colJIsSelected = !widget
                                              .colJIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colJ = (widget.colJIsSelected)
                                            ? "J"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "J",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* K **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colKIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colKIsSelected = !widget
                                              .colKIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colK = (widget.colKIsSelected)
                                            ? "K"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "K",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* L **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colLIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colLIsSelected = !widget
                                              .colLIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colL = (widget.colLIsSelected)
                                            ? "L"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "L",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* M **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colMIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colMIsSelected = !widget
                                              .colMIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colM = (widget.colMIsSelected)
                                            ? "M"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "M",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ******* N **********
                                SizedBox(
                                  width: colorCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.colNIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.colNIsSelected = !widget
                                              .colNIsSelected; // Toggle isSelected flag
                                        });
                                        widget.colN = (widget.colNIsSelected)
                                            ? "N"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "N",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // *********** Clarity******//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Clarity",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                // ********** FL **************
                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claFlIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claFlIsSelected = !widget
                                              .claFlIsSelected; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                        widget.claFl = (widget.claFlIsSelected)
                                            ? "FL"
                                            : null;
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "FL",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // ********** IF **************
                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claIfIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claIfIsSelected = !widget
                                              .claIfIsSelected; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                        widget.claIf = (widget.claIfIsSelected)
                                            ? "IF"
                                            : null;
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "IF",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // ********** VVS1 **************
                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claVvs1IsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claVvs1IsSelected = !widget
                                              .claVvs1IsSelected; // Toggle isSelected flag
                                        });
                                        widget.claVvs1 =
                                            (widget.claVvs1IsSelected)
                                                ? "VVS1"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "VVS1",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // ********** VVS2 **************
                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claVvs2IsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claVvs2IsSelected = !widget
                                              .claVvs2IsSelected; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                        widget.claVvs2 =
                                            (widget.claVvs2IsSelected)
                                                ? "VVS2"
                                                : null;
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "VVS2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ********** VS1 **************
                                // ********** VS1 **************

                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claVs1IsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claVs1IsSelected = !widget
                                              .claVs1IsSelected; // Toggle isSelected flag
                                          filterFunction();
                                        });
                                        widget.claVs1 =
                                            (widget.claVs1IsSelected)
                                                ? "VS1"
                                                : null;
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "VS1",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ********** Vs2 **************
                                // ********** VS2 **************

                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claVs2IsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claVs2IsSelected = !widget
                                              .claVs2IsSelected; // Toggle isSelected flag
                                        });
                                        widget.claVs2 =
                                            (widget.claVs2IsSelected)
                                                ? "VS2"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "VS2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ********** SI1 **************
                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claSi1IsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claSi1IsSelected = !widget
                                              .claSi1IsSelected; // Toggle isSelected flag
                                        });
                                        widget.claSi1 =
                                            (widget.claSi1IsSelected)
                                                ? "SI1"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "SI1",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ********** S12 **************
                                // ********** SI2 **************

                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claSi2IsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claSi2IsSelected = !widget
                                              .claSi2IsSelected; // Toggle isSelected flag
                                        });
                                        widget.claSi2 =
                                            (widget.claSi2IsSelected)
                                                ? "S12"
                                                : null;
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "S12",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ), // ********** I1 **************
                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claI1IsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claI1IsSelected = !widget
                                              .claI1IsSelected; // Toggle isSelected flag
                                        });
                                        widget.claI1 = (widget.claI1IsSelected)
                                            ? "I1"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "I1",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // ********** I2 **************
                                SizedBox(
                                  width: clarityCardWidth,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.claI2IsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.claI2IsSelected = !widget
                                              .claI2IsSelected; // Toggle isSelected flag
                                        });
                                        widget.claI2 = (widget.claI2IsSelected)
                                            ? "I2"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "I2",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ************ cutCulPol **********//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cut/Pol/Sym/Fluor/Cert",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.shortCut3EXNIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        widget.shortCut3EXNIsSelected =
                                            !widget.shortCut3EXNIsSelected;
                                        widget.shortCut3EXN =
                                            widget.shortCut3EXNIsSelected
                                                ? "polSumsh"
                                                : null;
                                        if (widget.shortCut3EXNIsSelected) {
                                          widget.cutExIsSelected = true;
                                          widget.polExIsSelected = true;
                                          widget.symExIsSelected = true;
                                          widget.flNIsSelected = true;
                                          widget.certGiaIsSelected = true;
                                          widget.cutEx = "EX";
                                          widget.polEx = "EX";
                                          widget.symEx = "EX";
                                          widget.flN = "N";
                                          widget.certGia = "GIA";
                                        } else {
                                          widget.cutExIsSelected = false;
                                          widget.polExIsSelected = false;
                                          widget.symExIsSelected = false;
                                          widget.flNIsSelected = false;
                                          widget.certGiaIsSelected = false;
                                          widget.cutEx = null;
                                          widget.polEx = null;
                                          widget.symEx = null;
                                          widget.flN = null;
                                          widget.certGia = null;
                                        }
                                        filterFunction();

                                        setState(() {
                                          // Toggle isSelected flag
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "3EX-N",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // 3VG+N
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.shortCut3VGNIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        widget.shortCut3VGNIsSelected =
                                            !widget.shortCut3VGNIsSelected;
                                        widget.shortCut3VGN =
                                            widget.shortCut3VGNIsSelected
                                                ? "polSumsh"
                                                : null;
                                        if (widget.shortCut3VGNIsSelected) {
                                          widget.cutExIsSelected = true;
                                          widget.polExIsSelected = true;
                                          widget.symExIsSelected = true;
                                          widget.cutVgIsSelected = true;
                                          widget.polVgIsSelected = true;
                                          widget.symVgIsSelected = true;
                                          widget.flNIsSelected = true;
                                          widget.certGiaIsSelected = true;
                                          widget.cutEx = "EX";
                                          widget.polEx = "EX";
                                          widget.symEx = "EX";
                                          widget.cutVg = "VG";
                                          widget.polVg = "VG";
                                          widget.symVg = "VG";
                                          widget.flN = "N";
                                          widget.certGia = "GIA";
                                        } else {
                                          widget.cutExIsSelected = false;
                                          widget.polExIsSelected = false;
                                          widget.symExIsSelected = false;
                                          widget.cutVgIsSelected = false;
                                          widget.polVgIsSelected = false;
                                          widget.symVgIsSelected = false;
                                          widget.flNIsSelected = false;
                                          widget.certGiaIsSelected = false;
                                          widget.cutEx = null;
                                          widget.polEx = null;
                                          widget.symEx = null;
                                          widget.cutVg = null;
                                          widget.polVg = null;
                                          widget.symVg = null;
                                          widget.flN = null;
                                          widget.certGia = null;
                                        }
                                        filterFunction();

                                        setState(() {
                                          // Toggle isSelected flag
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "3VG-N",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //************Cut **************//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cut",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                //*********EX *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.cutExIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.cutExIsSelected = !widget
                                              .cutExIsSelected; // Toggle isSelected flag
                                        });
                                        widget.cutEx = widget.cutExIsSelected
                                            ? "EX"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "EX",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* VG *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.cutVgIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.cutVgIsSelected = !widget
                                              .cutVgIsSelected; // Toggle isSelected flag
                                        });
                                        widget.cutVg = widget.cutVgIsSelected
                                            ? "VG"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "VG",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //*********GD *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.cutGdIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.cutGdIsSelected = !widget
                                              .cutGdIsSelected; // Toggle isSelected flag
                                        });
                                        widget.cutGd = widget.cutGdIsSelected
                                            ? "GD"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "GD",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* FR *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.cutFrIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.cutFrIsSelected = !widget
                                              .cutFrIsSelected; // Toggle isSelected flag
                                        });
                                        widget.cutFr = widget.cutFrIsSelected
                                            ? "FR"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "FR",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* NONE *********//
                                // Container(
                                //   width: commonCardWidth2Latter,
                                //   child: Card(
                                //     elevation: 7,
                                //     margin: EdgeInsets.all(paddingCard),
                                //     color: widget.cutNoneIsSelected
                                //         ? mainColor
                                //         : null, // Set color based on isSelected flag
                                //     child: InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           widget.cutNoneIsSelected = !widget
                                //               .cutNoneIsSelected; // Toggle isSelected flag
                                //         });
                                //         widget.cutNone =
                                //             widget.cutNoneIsSelected
                                //                 ? "NN"
                                //                 : null;
                                //       },
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(
                                //             paddingFullSearchWidget),
                                //         child: Center(
                                //           child:
                                //               // Changed to height for vertical spacing
                                //               Text(
                                //             "NN",
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //************Polish **************//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Polish",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                //*********EX *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.polExIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.polExIsSelected = !widget
                                              .polExIsSelected; // Toggle isSelected flag
                                        });
                                        widget.polEx = widget.polExIsSelected
                                            ? "EX"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "EX",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* VG *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.polVgIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.polVgIsSelected = !widget
                                              .polVgIsSelected; // Toggle isSelected flag
                                        });
                                        widget.polVg = widget.polVgIsSelected
                                            ? "VG"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "VG",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //*********GD *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.polGdIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.polGdIsSelected = !widget
                                              .polGdIsSelected; // Toggle isSelected flag
                                        });
                                        widget.polGd = widget.polGdIsSelected
                                            ? "GD"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "GD",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* FR *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.polFrIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.polFrIsSelected = !widget
                                              .polFrIsSelected; // Toggle isSelected flag
                                        });
                                        widget.polFr = widget.polFrIsSelected
                                            ? "FR"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "FR",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // //********* NONE *********//
                                // Container(
                                //   width: commonCardWidth2Latter,
                                //   child: Card(
                                //     elevation: 7,
                                //     margin: EdgeInsets.all(paddingCard),
                                //     color: widget.cutNoneIsSelected
                                //         ? mainColor
                                //         : null, // Set color based on isSelected flag
                                //     child: InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           widget.cutNoneIsSelected = !widget
                                //               .cutNoneIsSelected; // Toggle isSelected flag
                                //         });
                                //         widget.cutNone = widget.cutNoneIsSelected
                                //             ? "NN"
                                //             : null;
                                //       },
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(
                                //             paddingFullSearchWidget),
                                //         child: Center(
                                //           child:
                                //               // Changed to height for vertical spacing
                                //               Text(
                                //             "NN",
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //************Symm **************//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Symm",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                //*********EX *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.symExIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.symExIsSelected = !widget
                                              .symExIsSelected; // Toggle isSelected flag
                                        });
                                        widget.symEx = widget.symExIsSelected
                                            ? "EX"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "EX",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* VG *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.symVgIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.symVgIsSelected = !widget
                                              .symVgIsSelected; // Toggle isSelected flag
                                        });
                                        widget.symVg = widget.symVgIsSelected
                                            ? "VG"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "VG",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //*********GD *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.symGdIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.symGdIsSelected = !widget
                                              .symGdIsSelected; // Toggle isSelected flag
                                        });
                                        widget.symGd = widget.symGdIsSelected
                                            ? "GD"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "GD",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* FR *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.symFrIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.symFrIsSelected = !widget
                                              .symFrIsSelected; // Toggle isSelected flag
                                        });
                                        widget.symFr = widget.symFrIsSelected
                                            ? "FR"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "FR",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // //********* NONE *********//
                                // Container(
                                //   width: commonCardWidth2Latter,
                                //   child: Card(
                                //     elevation: 7,
                                //     margin: EdgeInsets.all(paddingCard),
                                //     color: widget.cutNoneIsSelected
                                //         ? mainColor
                                //         : null, // Set color based on isSelected flag
                                //     child: InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           widget.cutNoneIsSelected = !widget
                                //               .cutNoneIsSelected; // Toggle isSelected flag
                                //         });
                                //         widget.cutNone = widget.cutNoneIsSelected
                                //             ? "NN"
                                //             : null;
                                //       },
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(
                                //             paddingFullSearchWidget),
                                //         child: Center(
                                //           child:
                                //               // Changed to height for vertical spacing
                                //               Text(
                                //             "NN",
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //************ Fluor **************//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Fluoro",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                //*********N *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.flNIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.flNIsSelected = !widget
                                              .flNIsSelected; // Toggle isSelected flag
                                        });
                                        widget.flN =
                                            widget.flNIsSelected ? "N" : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "N",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* F *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.flFIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.flFIsSelected = !widget
                                              .flFIsSelected; // Toggle isSelected flag
                                        });
                                        widget.flF =
                                            widget.flFIsSelected ? "F" : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "F",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //*********M *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.flMIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.flMIsSelected = !widget
                                              .flMIsSelected; // Toggle isSelected flag
                                        });
                                        widget.flM =
                                            widget.flMIsSelected ? "M" : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "M",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* S *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.flSIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.flSIsSelected = !widget
                                              .flSIsSelected; // Toggle isSelected flag
                                        });
                                        widget.flS =
                                            widget.flSIsSelected ? "S" : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "S",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* VS *********//
                                SizedBox(
                                  width: commonCardWidth2Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.flVsIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.flVsIsSelected = !widget
                                              .flVsIsSelected; // Toggle isSelected flag
                                        });
                                        widget.flVs =
                                            widget.flVsIsSelected ? "VS" : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "VS",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //************Certificate **************//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cert",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                //********* GIA *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.certGiaIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.certGiaIsSelected = !widget
                                              .certGiaIsSelected; // Toggle isSelected flag
                                        });
                                        widget.certGia =
                                            widget.certGiaIsSelected
                                                ? "GIA"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "GIA",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* NGTC *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.certNgtcIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.certNgtcIsSelected = !widget
                                              .certNgtcIsSelected; // Toggle isSelected flag
                                        });
                                        widget.certNgtc =
                                            widget.certNgtcIsSelected
                                                ? "NGTC"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "NGTC",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* IGI *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.certIgiIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.certIgiIsSelected = !widget
                                              .certIgiIsSelected; // Toggle isSelected flag
                                        });
                                        widget.certIgi =
                                            widget.certIgiIsSelected
                                                ? "IGI"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "IGI",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* HRD *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.certHrdIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.certHrdIsSelected = !widget
                                              .certHrdIsSelected; // Toggle isSelected flag
                                        });
                                        widget.certHrd =
                                            widget.certHrdIsSelected
                                                ? "HRD"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "HRD",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // //********* NONE *********//
                                // Container(
                                //   width: commonCardWidth2Latter,
                                //   child: Card(
                                //     elevation: 7,
                                //     margin: EdgeInsets.all(paddingCard),
                                //     color: widget.cutNoneIsSelected
                                //         ? mainColor
                                //         : null, // Set color based on isSelected flag
                                //     child: InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           widget.cutNoneIsSelected = !widget
                                //               .cutNoneIsSelected; // Toggle isSelected flag
                                //         });
                                //         widget.cutNone = widget.cutNoneIsSelected
                                //             ? "NN"
                                //             : null;
                                //       },
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(
                                //             paddingFullSearchWidget),
                                //         child: Center(
                                //           child:
                                //               // Changed to height for vertical spacing
                                //               Text(
                                //             "NN",
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //************BGM **************//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "BGM",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                //********* YES *********//
                                SizedBox(
                                  width: commonCardWidth4Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.bjmYesIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.bjmYesIsSelected = !widget
                                              .bjmYesIsSelected; // Toggle isSelected flag
                                        });
                                        widget.bjmYes = widget.bjmYesIsSelected
                                            ? "BGM"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "BGM",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* NO *********//
                                SizedBox(
                                  width: commonCardWidth4Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.bjmNoIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.bjmNoIsSelected = !widget
                                              .bjmNoIsSelected; // Toggle isSelected flag
                                        });
                                        widget.bjmNo = widget.bjmNoIsSelected
                                            ? "BGM NO"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "BGM NO",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                // //********* NONE *********//
                                // Container(
                                //   width: commonCardWidth2Latter,
                                //   child: Card(
                                //     elevation: 7,
                                //     margin: EdgeInsets.all(paddingCard),
                                //     color: widget.cutNoneIsSelected
                                //         ? mainColor
                                //         : null, // Set color based on isSelected flag
                                //     child: InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           widget.cutNoneIsSelected = !widget
                                //               .cutNoneIsSelected; // Toggle isSelected flag
                                //         });
                                //         widget.cutNone = widget.cutNoneIsSelected
                                //             ? "NN"
                                //             : null;
                                //       },
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(
                                //             paddingFullSearchWidget),
                                //         child: Center(
                                //           child:
                                //               // Changed to height for vertical spacing
                                //               Text(
                                //             "NN",
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //************Location **************//
                  SizedBox(
                    height:
                        textSingleContainerHight, // Provide a fixed height or other constraints
                    child: Container(
                      height: textSingleCardHight,
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Location",
                            style: TextStyle(
                                fontSize: fontSizeHeading,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.all(2),
                              scrollDirection: Axis.horizontal,
                              children: [
                                //********* CHINA *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.locChinaIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.locChinaIsSelected = !widget
                                              .locChinaIsSelected; // Toggle isSelected flag
                                        });
                                        widget.locChina =
                                            widget.locChinaIsSelected
                                                ? "China"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "CHINA",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* SZ *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.locSzIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.locSzIsSelected = !widget
                                              .locSzIsSelected; // Toggle isSelected flag
                                        });
                                        widget.locSz = widget.locSzIsSelected
                                            ? "SZ"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "SZ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* HK *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.locHkIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.locHkIsSelected = !widget
                                              .locHkIsSelected; // Toggle isSelected flag
                                        });
                                        widget.locHk = widget.locHkIsSelected
                                            ? "HK"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "HK",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* H-K *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.locH_KIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.locH_KIsSelected = !widget
                                              .locH_KIsSelected; // Toggle isSelected flag
                                        });
                                        widget.locH_K = widget.locH_KIsSelected
                                            ? "H-K"
                                            : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "H-K",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //********* Transit *********//
                                SizedBox(
                                  width: commonCardWidth5Latter,
                                  child: Card(
                                    elevation: elevationOfCard,
                                    margin: const EdgeInsets.all(paddingCard),
                                    color: widget.locTransitIsSelected
                                        ? mainColor
                                        : null, // Set color based on isSelected flag
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.locTransitIsSelected = !widget
                                              .locTransitIsSelected; // Toggle isSelected flag
                                        });
                                        widget.locTransit =
                                            widget.locTransitIsSelected
                                                ? "在途"
                                                : null;
                                        filterFunction();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(
                                            paddingFullSearchWidget),
                                        child: Center(
                                          child:
                                              // Changed to height for vertical spacing
                                              Text(
                                            "Transit",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // //********* NONE *********//
                                // Container(
                                //   width: commonCardWidth2Latter,
                                //   child: Card(
                                //     elevation: 7,
                                //     margin: EdgeInsets.all(paddingCard),
                                //     color: widget.cutNoneIsSelected
                                //         ? mainColor
                                //         : null, // Set color based on isSelected flag
                                //     child: InkWell(
                                //       onTap: () {
                                //         setState(() {
                                //           widget.cutNoneIsSelected = !widget
                                //               .cutNoneIsSelected; // Toggle isSelected flag
                                //         });
                                //         widget.cutNone = widget.cutNoneIsSelected
                                //             ? "NN"
                                //             : null;
                                //       },
                                //       child: Padding(
                                //         padding: const EdgeInsets.all(
                                //             paddingFullSearchWidget),
                                //         child: Center(
                                //           child:
                                //               // Changed to height for vertical spacing
                                //               Text(
                                //             "NN",
                                //             style: TextStyle(
                                //                 fontWeight: FontWeight.bold),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
            paddingCard), // Adjust the bottom padding as needed
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchResults(
                              diamondData: resultFilterDiamond,
                            )),
                  );
                  // Add your onPressed callback here
                },
                child: Column(
                  children: [
                    const Icon(Icons.search_rounded),
                    const SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    Text("Result(${resultFilterDiamond.length})")
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
                  setState(() {
                    widget.roundShpIsSelected = false;
                    widget.princeShpIsSelected = false;
                    widget.emraldShpIsSelected = false;
                    widget.ovalShpIsSelected = false;
                    widget.radiantShpIsSelected = false;
                    widget.pearShpIsSelected = false;
                    widget.marquiseShpIsSelected = false;
                    widget.heartShpIsSelected = false;
                    widget.cushionShpIsSelected = false;
                    widget.othersShpIsSelected = false;
                    widget.triangleShpIsSelected = false;
                    widget.caratIsSelected = false;
                    widget.caratFromIsSelected = false;
                    widget.caratToIsSelected = false;
                    widget.colDIsSelected = false;
                    widget.colEIsSelected = false;
                    widget.colFIsSelected = false;
                    widget.colGIsSelected = false;
                    widget.colHIsSelected = false;
                    widget.colIIsSelected = false;
                    widget.colJIsSelected = false;
                    widget.colKIsSelected = false;
                    widget.colLIsSelected = false;
                    widget.colMIsSelected = false;
                    widget.colNIsSelected = false;
                    widget.colO_PIsSelected = false;
                    widget.colQ_RIsSelected = false;
                    widget.colS_TIsSelected = false;
                    widget.colU_VIsSelected = false;
                    widget.colW_ZIsSelected = false;
                    widget.claFlIsSelected = false;
                    widget.claIfIsSelected = false;
                    widget.claVvs1IsSelected = false;
                    widget.claVvs2IsSelected = false;
                    widget.claVs1IsSelected = false;
                    widget.claVs2IsSelected = false;
                    widget.claSi1IsSelected = false;
                    widget.claSi2IsSelected = false;
                    widget.claSi3IsSelected = false;
                    widget.claI1IsSelected = false;
                    widget.claI2IsSelected = false;
                    widget.cutExIsSelected = false;
                    widget.cutVgIsSelected = false;
                    widget.cutGdIsSelected = false;
                    widget.cutFrIsSelected = false;
                    widget.cutPrIsSelected = false;
                    widget.cutNoneIsSelected = false;
                    widget.polExIsSelected = false;
                    widget.polVgIsSelected = false;
                    widget.polGdIsSelected = false;
                    widget.polFrIsSelected = false;
                    widget.polPrIsSelected = false;
                    widget.symExIsSelected = false;
                    widget.symVgIsSelected = false;
                    widget.symGdIsSelected = false;
                    widget.symFrIsSelected = false;
                    widget.symPrIsSelected = false;
                    widget.flNIsSelected = false;
                    widget.flFIsSelected = false;
                    widget.flMIsSelected = false;
                    widget.flSIsSelected = false;
                    widget.flVsIsSelected = false;
                    widget.certGiaIsSelected = false;
                    widget.certIgiIsSelected = false;
                    widget.certHrdIsSelected = false;
                    widget.certNgtcIsSelected = false;
                    widget.bjmYesIsSelected = false;
                    widget.bjmNoIsSelected = false;
                    widget.locIndiaIsSelected = false;
                    widget.locChinaIsSelected = false;
                    widget.locHkIsSelected = false;
                    widget.locSzIsSelected = false;
                    widget.locH_KIsSelected = false;
                    widget.locTransitIsSelected = false;
                    widget.shortCut3EXNIsSelected = false;
                    widget.shortCut3VGNIsSelected = false;
                    filterFunction();
                  });
                },
                child: const Column(
                  children: [
                    Icon(Icons.border_clear_rounded),
                    SizedBox(
                      height: 2,
                    ),
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
