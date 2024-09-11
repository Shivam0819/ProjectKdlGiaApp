import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kdlgia/navigation_pages/home_page.dart';
import 'package:kdlgia/navigation_pages/search_page.dart';
import 'package:kdlgia/search/apiDiamondSerach.dart';
import 'package:kdlgia/search/diamondData.dart';
import 'package:kdlgia/search/diamondDataDetail.dart';
import 'package:kdlgia/search/searchTemp.dart';
import 'package:kdlgia/style/search_card_ui.dart';

class SearchUi extends StatefulWidget {
  final String token;
  String totalStock;
  SearchUi({
    super.key,
    required this.token,
    this.totalStock = "****",
  });
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
  String noBgm = "";
  String avaiable = "";
  String imageAvailable = "";
  String movieAvaible = "";
  String holdLoanDiamond = "";
  String holdDiamond = "";
  String loanDiamond = "";

  String certificateAvailable = "";
  String onBlackList = "";
  String? priceFrom;
  String? priceTo;
  String? tableFrom;
  String? tableTo;
  String? depthFrom;
  String? depthTo;

  // Define the corresponding isSelected properties as bool
  bool noBgmboool = false;
  bool isAvaiable = false;
  bool isImage = false;
  bool isMovie = false;
  bool isCertificate = false;
  bool isOnBlackList = false;
  bool isHoldLoanDiamond = false;
  bool isHoldDiamond = false;
  bool isLoanDiamond = false;

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

  @override
  _SearchUiState createState() => _SearchUiState();
}

class _SearchUiState extends State<SearchUi> {
  late Future<DiamondData> diamondsFuture;

  late TextEditingController _controllerCaratFrom;
  late TextEditingController _controllerCaratTo;
  late TextEditingController _controllerPriceFrom;
  late TextEditingController _controllerPriceTo;
  late TextEditingController _controllerTableFrom;
  late TextEditingController _controllerTableTo;
  late TextEditingController _controllerDepthFrom;
  late TextEditingController _controllerDepthTo;
  List<Diamond> resultFilterDiamond = [];
  String buildQueryString() {
    List<String?> shapes = [
      widget.roundShp.toString().toLowerCase(),
      widget.princeShp.toString().toLowerCase(),
      widget.emraldShp.toString().toLowerCase(),
      widget.ovalShp.toString().toLowerCase(),
      widget.radiantShp.toString().toLowerCase(),
      widget.pearShp.toString().toLowerCase(),
      widget.marquiseShp.toString().toLowerCase(),
      widget.heartShp.toString().toLowerCase(),
      widget.cushionShp.toString().toLowerCase(),
      widget.othersShp.toString().toLowerCase(),
      widget.triangleShp.toString().toLowerCase()
    ];

    String shapesParam =
        shapes.where((shape) => shape != null && shape!.isNotEmpty).join(',');

    List<String?> colors = [
      widget.colD,
      widget.colE,
      widget.colF,
      widget.colG,
      widget.colH,
      widget.colI,
      widget.colJ,
      widget.colK,
      widget.colL,
      widget.colM,
      widget.colN,
      widget.colO_P,
      widget.colQ_R,
      widget.colS_T,
      widget.colU_V,
      widget.colW_Z
    ];

    String colorsParam =
        colors.where((color) => color != null && color!.isNotEmpty).join(',');

    List<String?> clarities = [
      widget.claFl,
      widget.claIf,
      widget.claVvs1,
      widget.claVvs2,
      widget.claVs1,
      widget.claVs2,
      widget.claSi1,
      widget.claSi2,
      widget.claSi3,
      widget.claI1,
      widget.claI2
    ];

    String claritiesParam = clarities
        .where((clarity) => clarity != null && clarity!.isNotEmpty)
        .join(',');

    List<String?> cuts = [
      widget.cutEx,
      widget.cutVg,
      widget.cutGd,
      widget.cutFr,
      widget.cutPr,
      widget.cutNone
    ];

    String cutsParam =
        cuts.where((cut) => cut != null && cut!.isNotEmpty).join(',');

    List<String?> polishes = [
      widget.polEx,
      widget.polVg,
      widget.polGd,
      widget.polFr,
      widget.polPr
    ];

    String polishesParam = polishes
        .where((polish) => polish != null && polish!.isNotEmpty)
        .join(',');

    List<String?> symmetries = [
      widget.symEx,
      widget.symVg,
      widget.symGd,
      widget.symFr,
      widget.symPr
    ];

    String symmetriesParam = symmetries
        .where((symmetry) => symmetry != null && symmetry!.isNotEmpty)
        .join(',');

    List<String?> fluor = [
      widget.flN,
      widget.flF,
      widget.flM,
      widget.flS,
      widget.flVs
    ];

    String fluorParam =
        fluor.where((f) => f != null && f!.isNotEmpty).join(',');

    List<String?> certs = [
      widget.certGia,
      widget.certIgi,
      widget.certHrd,
      widget.certNgtc
    ];

    String certsParam =
        certs.where((cert) => cert != null && cert!.isNotEmpty).join(',');

    List<String?> locations = [
      widget.locIndia,
      widget.locChina,
      widget.locHk,
      widget.locSz,
      widget.locH_K,
      widget.locTransit
    ];

    String locationsParam = locations
        .where((location) => location != null && location!.isNotEmpty)
        .join(',');

    List<String?> shortCuts = [widget.shortCut3EXN, widget.shortCut3VGN];

    String shortCutsParam = shortCuts
        .where((shortcut) => shortcut != null && shortcut!.isNotEmpty)
        .join(',');

    print(
        "************************************************************************************");
    print(widget.caratFrom);
    print(
        "************************************************************************************");

    String? querr =
        'q_is_schv=1&q_shp=$shapesParam&q_co=$colorsParam&q_cl=$claritiesParam&q_lab=$certsParam&q_places=$locationsParam&q_cut=$cutsParam&q_pol=$polishesParam&q_sym=$symmetriesParam&q_fl=$fluorParam&q_carat1=${widget.caratFrom.toString()}&q_carat2=${widget.caratTo.toString()}&q_is_nobgm=${widget.noBgm}&q_is_available=${widget.avaiable}&q_is_image=${widget.imageAvailable}&q_is_movie=${widget.movieAvaible}&q_is_budget=${widget.certificateAvailable}&q_bkl=${widget.onBlackList}&q_ms=${widget.holdDiamond},${widget.loanDiamond}&q_price1=${widget.priceFrom == null ? "" : widget.priceFrom}&q_price2=${widget.priceTo == null ? "" : widget.priceTo}&q_price_type=dollar&q_depth1=${widget.depthFrom}&q_depth2=${widget.depthTo}&q_table1=${widget.tableFrom}&q_table2=${widget.tableTo}&q_perpage=25';

    //  "q_is_schv=1"
    // // "&q_shp=${shapesParam}"
    // "&q_co=${colorsParam}"ms
    // // "&q_cl=${claritiesParam}"
    // // "&q_lab=${certsParam}"
    // // "&q_carat1=${widget.caratFrom ?? ''}"
    // // "&q_carat2=${widget.caratTo ?? ''}"
    // // "&q_id="
    // // "&q_id_type=report_no"
    // // "&q_perpage=25"
    // // "&q_price1="
    // // "&q_price2="
    // // "&q_price_type=dollar"
    // // "&q_depth1="
    // // "&q_depth2="
    // // "&q_table1="
    // // "&q_table2="
    // ;

    print(querr);

    return querr;
  }

  @override
  void initState() {
    super.initState();
    _controllerCaratFrom = TextEditingController();
    _controllerCaratTo = TextEditingController();
    _controllerPriceFrom = TextEditingController();
    _controllerPriceTo = TextEditingController();
    _controllerTableFrom = TextEditingController();
    _controllerTableTo = TextEditingController();
    _controllerDepthFrom = TextEditingController();
    _controllerDepthTo = TextEditingController();
    diamondsFuture = fetchDataSearchDiamond(widget.token);
  }

  @override
  void dispose() {
    _controllerCaratFrom.dispose();
    _controllerCaratTo.dispose();
    _controllerPriceFrom.dispose();
    _controllerPriceTo.dispose();
    _controllerTableFrom.dispose();
    _controllerTableTo.dispose();
    _controllerDepthFrom.dispose();
    _controllerDepthTo.dispose();
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

        title: FutureBuilder(
            future: fetchDataSearchDiamond(widget.token,
                searchQuerry: buildQueryString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(strokeWidth: 3.0),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Result")
                    ]);
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              {
                return Text('${snapshot.data!.total} Results');
              }
            }),
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
                                          ;
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          widget.pearShp =
                                              widget.pearShpIsSelected
                                                  ? "Pear"
                                                  : null;
                                          // Toggle isSelected flag

                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
                                          ; // Trigger filter function after updating the value
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
                                          ;
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());

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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());

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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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

                  //************Image,Video & certificate**************//
                  Card(
                      elevation: elevationOfCard,
                      margin: const EdgeInsets.all(paddingCard),
                      // Set color based on isSelected flag
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(paddingCard),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //             image Available

                                const Text(
                                  "Image",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 5),
                                Checkbox(
                                  value: widget.isImage,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.isImage = value!;
                                      widget.imageAvailable =
                                          widget.isImage ? "1" : "";
                                      fetchDataSearchDiamond(widget.token,
                                          searchQuerry: buildQueryString());
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          //             Video Available

                          Container(
                            padding: const EdgeInsets.all(paddingCard),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Video",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 5),
                                Checkbox(
                                  value: widget.isMovie,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.isMovie = value!;
                                      widget.movieAvaible =
                                          widget.isMovie ? "1" : "";
                                      fetchDataSearchDiamond(widget.token,
                                          searchQuerry: buildQueryString());
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          //             Certificate available
                          Container(
                            padding: const EdgeInsets.all(paddingCard),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Cert",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 5),
                                Checkbox(
                                  value: widget.isCertificate,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.isCertificate = value!;
                                      widget.certificateAvailable =
                                          widget.noBgmboool ? "1" : "";
                                      fetchDataSearchDiamond(widget.token,
                                          searchQuerry: buildQueryString());
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      )),

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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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
                                        fetchDataSearchDiamond(widget.token,
                                            searchQuerry: buildQueryString());
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

                  // Hello world

//************BGM & Not in Black list**************//

                  Card(
                      elevation: elevationOfCard,
                      margin: const EdgeInsets.all(paddingCard),
                      // Set color based on isSelected flag
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // NoBGm
                          Container(
                            padding: const EdgeInsets.all(paddingCard),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "No BGM",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 5),
                                Checkbox(
                                  value: widget.noBgmboool,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.noBgmboool = value!;
                                      widget.noBgm =
                                          widget.noBgmboool ? "1" : "";
                                      fetchDataSearchDiamond(widget.token,
                                          searchQuerry: buildQueryString());
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          //Not in blacklist

                          Container(
                            padding: const EdgeInsets.all(paddingCard),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Not BlackList",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 5),
                                Checkbox(
                                  value: widget.isOnBlackList,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.isOnBlackList = value!;
                                      widget.onBlackList =
                                          widget.noBgmboool ? "1" : "";
                                      fetchDataSearchDiamond(widget.token,
                                          searchQuerry: buildQueryString());
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                  //************Hold and Loan Diamond**************//
                  Card(
                      elevation: elevationOfCard,
                      margin: const EdgeInsets.all(paddingCard),
                      // Set color based on isSelected flag
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(paddingCard),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Hold Diamond

                                const Text(
                                  "My Hold",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 5),
                                Checkbox(
                                  value: widget.isHoldDiamond,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.isHoldDiamond = value!;
                                      widget.holdDiamond =
                                          widget.isHoldDiamond ? "3" : "";
                                      fetchDataSearchDiamond(widget.token,
                                          searchQuerry: buildQueryString());
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          //             Video Available

                          Container(
                            padding: const EdgeInsets.all(paddingCard),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "My Memo",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 5),
                                Checkbox(
                                  value: widget.isLoanDiamond,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      widget.isLoanDiamond = value!;
                                      widget.loanDiamond =
                                          widget.isLoanDiamond ? "2" : "";
                                      fetchDataSearchDiamond(widget.token,
                                          searchQuerry: buildQueryString());
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          //             Certificate available
                        ],
                      )),

                  // Price
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Price",
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
                                      controller: _controllerPriceFrom,
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
                                          widget.priceFrom =
                                              _controllerPriceFrom.text
                                                  .toString();
                                          print(widget.priceFrom);
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
                                          ; // Trigger filter function after updating the value
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
                                      controller: _controllerPriceTo,
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
                                          widget.priceTo = _controllerPriceTo
                                              .text
                                              .toString();
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
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
                  // Table
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Table %",
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
                                      controller: _controllerTableFrom,
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
                                          widget.tableFrom =
                                              _controllerTableFrom.text
                                                  .toString();
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
                                          ; // Trigger filter function after updating the value
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
                                      controller: _controllerTableTo,
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
                                          widget.tableTo = _controllerTableTo
                                              .text
                                              .toString();
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
                                          ;
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
                  // Depth
                  SizedBox(
                    height: 130,
                    child: Padding(
                      padding: const EdgeInsets.all(paddingCard),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Depth %",
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
                                      controller: _controllerDepthFrom,
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
                                          widget.depthFrom =
                                              _controllerDepthFrom.text
                                                  .toString();
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
                                          ; // Trigger filter function after updating the value
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
                                      controller: _controllerDepthTo,
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
                                          widget.depthTo = _controllerDepthTo
                                              .text
                                              .toString();
                                          fetchDataSearchDiamond(widget.token,
                                              searchQuerry: buildQueryString());
                                          ;
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
                    Icon(Icons.home),
                    SizedBox(height: 2),
                    Text('Home'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  fetchDataSearchDiamond(widget.token,
                          searchQuerry: buildQueryString())
                      .then((diamondData) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResultsTemp(
                          diamondData: diamondData,
                          token: widget.token,
                          querryUrl: buildQueryString(),
                        ),
                      ),
                    );
                  }).catchError((error) {
                    // Handle error
                    print('Error: $error');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('An error occurred. Please try again later.'),
                      ),
                    );
                  });
                  // Add your onPressed callback here
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search_rounded),
                    const SizedBox(
                      height: 2,
                    ), // Add some space between the icon and text
                    FutureBuilder(
                        future: fetchDataSearchDiamond(widget.token,
                            searchQuerry: buildQueryString()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Search("),
                                  Center(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 3.0),
                                  ),
                                  Text(")"),
                                ]);
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          {
                            return Text('Search(${snapshot.data!.total})');
                          }
                        }),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchPage(
                                  token: widget.token,
                                )));
                  // Add your onPressed callback here
                  // setState(() {
                  //   widget.roundShpIsSelected = false;
                  //   widget.roundShp = null;
                  //   widget.princeShpIsSelected = false;
                  //   widget.princeShp = null;
                  //   widget.emraldShpIsSelected = false;
                  //   widget.emraldShp = null;
                  //   widget.ovalShpIsSelected = false;
                  //   widget.ovalShp = null;
                  //   widget.radiantShpIsSelected = false;
                  //   widget.radiantShp = null;
                  //   widget.pearShpIsSelected = false;
                  //   widget.pearShp = null;
                  //   widget.marquiseShpIsSelected = false;
                  //   widget.marquiseShp = null;
                  //   widget.heartShpIsSelected = false;
                  //   widget.heartShp = null;
                  //   widget.cushionShpIsSelected = false;
                  //   widget.cushionShp = null;
                  //   widget.othersShpIsSelected = false;
                  //   widget.othersShp = null;
                  //   widget.triangleShpIsSelected = false;
                  //   widget.triangleShp = null;
                  //   widget.caratIsSelected = false;
                  //   widget.carat = null;
                  //   widget.caratFromIsSelected = false;
                  //   widget.caratFrom = null;
                  //   widget.caratToIsSelected = false;
                  //   widget.caratTo = null;
                  //   widget.colDIsSelected = false;
                  //   widget.colD = null;
                  //   widget.colEIsSelected = false;
                  //   widget.colE = null;
                  //   widget.colFIsSelected = false;
                  //   widget.colF = null;
                  //   widget.colGIsSelected = false;
                  //   widget.colG = null;
                  //   widget.colHIsSelected = false;
                  //   widget.colH = null;
                  //   widget.colIIsSelected = false;
                  //   widget.colI = null;
                  //   widget.colJIsSelected = false;
                  //   widget.colJ = null;
                  //   widget.colKIsSelected = false;
                  //   widget.colK = null;
                  //   widget.colLIsSelected = false;
                  //   widget.colL = null;
                  //   widget.colMIsSelected = false;
                  //   widget.colM = null;
                  //   widget.colNIsSelected = false;
                  //   widget.colN = null;
                  //   widget.colO_PIsSelected = false;
                  //   widget.colO_P = null;
                  //   widget.colQ_RIsSelected = false;
                  //   widget.colQ_R = null;
                  //   widget.colS_TIsSelected = false;
                  //   widget.colS_T = null;
                  //   widget.colU_VIsSelected = false;
                  //   widget.colU_V = null;
                  //   widget.colW_ZIsSelected = false;
                  //   widget.colW_Z = null;
                  //   widget.claFlIsSelected = false;
                  //   widget.claFl = null;
                  //   widget.claIfIsSelected = false;
                  //   widget.claIf = null;
                  //   widget.claVvs1IsSelected = false;
                  //   widget.claVvs1 = null;
                  //   widget.claVvs2IsSelected = false;
                  //   widget.claVvs2 = null;
                  //   widget.claVs1IsSelected = false;
                  //   widget.claVs1 = null;
                  //   widget.claVs2IsSelected = false;
                  //   widget.claVs2 = null;
                  //   widget.claSi1IsSelected = false;
                  //   widget.claSi1 = null;
                  //   widget.claSi2IsSelected = false;
                  //   widget.claSi2 = null;
                  //   widget.claSi3IsSelected = false;
                  //   widget.claSi3 = null;
                  //   widget.claI1IsSelected = false;
                  //   widget.claI1 = null;
                  //   widget.claI2IsSelected = false;
                  //   widget.claI2 = null;
                  //   widget.cutExIsSelected = false;
                  //   widget.cutEx = null;
                  //   widget.cutVgIsSelected = false;
                  //   widget.cutVg = null;
                  //   widget.cutGdIsSelected = false;
                  //   widget.cutGd = null;
                  //   widget.cutFrIsSelected = false;
                  //   widget.cutFr = null;
                  //   widget.cutPrIsSelected = false;
                  //   widget.cutPr = null;
                  //   widget.cutNoneIsSelected = false;
                  //   widget.cutNone = null;
                  //   widget.polExIsSelected = false;
                  //   widget.polEx = null;
                  //   widget.polVgIsSelected = false;
                  //   widget.polVg = null;
                  //   widget.polGdIsSelected = false;
                  //   widget.polGd = null;
                  //   widget.polFrIsSelected = false;
                  //   widget.polFr = null;
                  //   widget.polPrIsSelected = false;
                  //   widget.polPr = null;
                  //   widget.symExIsSelected = false;
                  //   widget.symEx = null;
                  //   widget.symVgIsSelected = false;
                  //   widget.symVg = null;
                  //   widget.symGdIsSelected = false;
                  //   widget.symGd = null;
                  //   widget.symFrIsSelected = false;
                  //   widget.symFr = null;
                  //   widget.symPrIsSelected = false;
                  //   widget.symPr = null;
                  //   widget.flNIsSelected = false;
                  //   widget.flN = null;
                  //   widget.flFIsSelected = false;
                  //   widget.flF = null;
                  //   widget.flMIsSelected = false;
                  //   widget.flM = null;
                  //   widget.flSIsSelected = false;
                  //   widget.flS = null;
                  //   widget.flVsIsSelected = false;
                  //   widget.flVs = null;
                  //   widget.certGiaIsSelected = false;
                  //   widget.certGia = null;
                  //   widget.certIgiIsSelected = false;
                  //   widget.certIgi = null;
                  //   widget.certHrdIsSelected = false;
                  //   widget.certHrd = null;
                  //   widget.certNgtcIsSelected = false;
                  //   widget.certNgtc = null;
                  //   widget.bjmYesIsSelected = false;
                  //   widget.bjmYes = null;
                  //   widget.bjmNoIsSelected = false;
                  //   widget.bjmNo = null;
                  //   widget.locIndiaIsSelected = false;
                  //   widget.locIndia = null;
                  //   widget.locChinaIsSelected = false;
                  //   widget.locChina = null;
                  //   widget.locHkIsSelected = false;
                  //   widget.locHk = null;
                  //   widget.locSzIsSelected = false;
                  //   widget.locSz = null;
                  //   widget.locH_KIsSelected = false;
                  //   widget.locH_K = null;
                  //   widget.locTransitIsSelected = false;
                  //   widget.locTransit = null;
                  //   widget.shortCut3EXNIsSelected = false;
                  //   widget.shortCut3EXN = null;
                  //   widget.shortCut3VGNIsSelected = false;
                  //   widget.shortCut3VGN = null;

                  //   widget.noBgmboool = false;
                  //   widget.noBgm = "";
                  //   widget.isOnBlackList = false;
                  //   widget.onBlackList = "";
                  //   widget.isImage = false;
                  //   widget.imageAvailable = "";
                  //   widget.isMovie = false;
                  //   widget.movieAvaible = "";
                  //   widget.isCertificate = false;
                  //   widget.certificateAvailable = "";
                  //   widget.isHoldDiamond = false;
                  //   widget.holdDiamond = "";
                  //   widget.isLoanDiamond = false;
                  //   widget.loanDiamond = "";


                  //   widget.priceFrom = null;
                  //   widget.priceTo = null;
                  //   widget.tableFrom = null;
                  //   widget.tableTo = null;
                  //   widget.depthFrom =null;
                  //   widget.depthTo = null;
                    
                  //   fetchDataSearchDiamond(widget.token,
                  //       searchQuerry: buildQueryString());
                  // });
                },
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
