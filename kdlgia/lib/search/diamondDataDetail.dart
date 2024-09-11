


class Diamond {
  final String inCart;
  final String id;
  final String diaSource;
  final String diaItemNo;
  final String diaPlace;
  final String diaStatus;
  var canToCart;
  final String diaShape;
  final String diaCarat;
  final String diaColor;
  final String diaColorIntensity;
  final String diaColorOvertone;
  final String diaColorColor;
  final String diaClarity;
  final String diaCut;
  final String diaPolish;
  final String diaSymmetry;
  final String diaFluorescence;
  final String diaDiameter;
  final String diaColsh;
  final String diaMilky;
  final String diaWc;
  final String diaWt;
  final String diaBt;
  final String diaBc;
  final String diaEyeClean;
  final String diaHna;
  final String diaIns;
  final String diaTable;
  final String diaDepth;
  final String diaCa;
  final String diaPa;
  final String diaReport;
  final String diaReportNo;
  final String diaRap;
  final String diaArrive;
  final String diaTime;
  final String diaSerial;
  final String imageUrl;
  final String movieUrl;
  final String diaNote;
  final String back;
  final String dollar1;
  final String rmb;
  final String rmbTax;
  final String rap;
  var fieldMore;
  final String dia_kts;


  Diamond({
    required this.inCart,
    required this.id,
    required this.diaSource,
    required this.diaItemNo,
    required this.diaPlace,
    required this.diaStatus,
    required this.canToCart,
    required this.diaShape,
    required this.diaCarat,
    required this.diaColor,
    required this.diaColorIntensity,
    required this.diaColorOvertone,
    required this.diaColorColor,
    required this.diaClarity,
    required this.diaCut,
    required this.diaPolish,
    required this.diaSymmetry,
    required this.diaFluorescence,
    required this.diaDiameter,
    required this.diaColsh,
    required this.diaMilky,
    required this.diaWc,
    required this.diaWt,
    required this.diaBt,
    required this.diaBc,
    required this.diaEyeClean,
    required this.diaHna,
    required this.diaIns,
    required this.diaTable,
    required this.diaDepth,
    required this.diaCa,
    required this.diaPa,
    required this.diaReport,
    required this.diaReportNo,
    required this.diaRap,
    required this.diaArrive,
    required this.diaTime,
    required this.diaSerial,
    required this.imageUrl,
    required this.movieUrl,
    required this.diaNote,
    required this.back,
    required this.dollar1,
    required this.rmb,
    required this.rmbTax,
    required this.rap,
    required this.fieldMore,
    required this.dia_kts,
  });

  factory Diamond.fromJson(List<dynamic> json) {
    return Diamond(
      inCart: json[0],
      id: json[1],
      diaSource: json[2],
      diaItemNo: json[3],
      diaPlace: json[4],
      diaStatus: json[5],
      canToCart: json[6],
      diaShape: json[7].toString().toUpperCase(),
      diaCarat: json[8],
      diaColor: json[9],
      diaColorIntensity: json[10],
      diaColorOvertone: json[11],
      diaColorColor: json[12],
      diaClarity: json[13],
      diaCut: json[14],
      diaPolish: json[15],
      diaSymmetry: json[16],
      diaFluorescence: json[17],
      diaDiameter: json[18],
      diaColsh: json[19],
      diaMilky: json[20],
      diaWc: json[21],
      diaWt: json[22],
      diaBt: json[23],
      diaBc: json[24],
      diaEyeClean: json[25],
      diaHna: json[26],
      diaIns: json[27],
      diaTable: json[28],
      diaDepth: json[29],
      diaCa: json[30],
      diaPa: json[31],
      diaReport: json[32],
      diaReportNo: json[33],
      diaRap: json[34],
      diaArrive: json[35],
      diaTime: json[36],
      diaSerial: json[37],
      imageUrl: json[38],
      movieUrl: json[39],
      diaNote: json[40],
      back: json[41],
      dollar1: json[42],
      rmb: json[43],
      rmbTax: json[44],
      rap: json[45],
      fieldMore: json[46],
      dia_kts: json[47],
    );
  }
}

