

/*


 */
class OrderData {
  var  s;
  var  m;
  var total;
  var perPage;
  var page;
  var pages;
  final List<Order> order;

  OrderData({
    required this.s,
    required this.m,
    required this.total,
    required this.perPage,
    required this.page,
    required this.pages,
    required this.order,
  });
}

//{"s":1,"m":"获取成功","data":{"page":1,"perpage":25,"total":7,"pages":1,"list":[{"ord_id":"168439","ord_sn":"2405110027","ord_user_discount":"0.00","ord_amount":"$173.91","ord_amount_actual":"$173.91","ord_amount_received":"$0.00","ord_time":"1715416341","ord_status":"20","dia_place":"HK","dia_shape":"圆形","dia_carat":"0.31","dia_color":"F","dia_color_intensity":"","dia_color_overtone":"","dia_color_color":"","dia_clarity":"I1","dia_cut":"GD","dia_polish":"GD","dia_symmetry":"GD","dia_fluorescence":"M","dia_diameter":"4.21-4.27x2.68","dia_colsh":"不咖","dia_milky":"不奶","dia_wc":"","dia_wt":"WT2","dia_bt":"BT1","dia_bc":"BC1","dia_eye_clean":"EC0","dia_hna":"","dia_ins":"1","dia_table":"61.00","dia_depth":"63.20","dia_ca":"37.00","dia_pa":"41.20","dia_report":"GIA","dia_report_no":"2487543866","dia_rap":"1100","dia_arrive":"1000-01-01","dia_time":"1709883964","dia_first_time":"1709883964","dia_serial":"0042104270268003114A4444","image_url":"","movie_url":"","dia_note":"","dia_tags":"4","back":"-49.00","dollar_1":"$173.91","rmb":"","rmb_tax":"¥0","rap":1100,"field_more":"1"},{"ord_id":"168435","ord_sn":"2405110023","ord_user_discount":"0.00","ord_amount":"$196.95","ord_amount_actual":"$196.95","ord_amount_received":"$0.00","ord_time":"1715414159","ord_status":"20","dia_place":"HK","dia_shape":"圆形","dia_carat":"0.30","dia_color":"D","dia_color_intensity":"","dia_color_overtone":"","dia_color_color":"","dia_clarity":"I1","dia_cut":"VG","dia_polish":"VG","dia_symmetry":"GD","dia_fluorescence":"M","dia_diameter":"4.22-4.25x2.63","dia_colsh":"不咖","dia_milky":"不奶","dia_wc":"","dia_wt":"WT2","dia_bt":"BT1","dia_bc":"BC1","dia_eye_clean":"EC0","dia_hna":"","dia_ins":"1","dia_table":"58.00","dia_depth":"62.10","dia_ca":"34.50","dia_pa":"40.60","dia_report":"GIA","dia_report_no":"7486543887","dia_rap":"1300","dia_arrive":"1000-01-01","dia_time":"1709883964","dia_first_time":"1709883964","dia_serial":"0042204250263003012A4334","image_url":"","movie_url":"","dia_note":"","dia_tags":"4","back":"-49.50","dollar_1":"$196.95","rmb":"","rmb_tax":"¥0","rap":1300,"field_more":"1"}]}}


class Order {
  final String ord_id;
  final String ord_sn;
  final String ord_user_discount;
  final String ord_amount;
  final String ord_amount_actual;
  final String ord_amount_received;
  final String ord_time;
  final String ord_status;
  final String diaPlace;
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
  final String dia_first_time;
  final String diaSerial;
  final String imageUrl;
  final String movieUrl;
  final String diaNote;
  final String dia_tags;
  final String back;
  final String dollar1;
  final String rmb;
  final String rmbTax;
  var rap;
  var fieldMore;

  Order({
    required this.ord_id,
    required this.ord_sn,
    required this.ord_user_discount,
    required this.ord_amount,
    required this.ord_amount_actual,
    required this.ord_amount_received,
    required this.ord_status,
    required this.ord_time,
    required this.diaPlace,
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
    required this.dia_first_time,
    required this.diaSerial,
    required this.imageUrl,
    required this.movieUrl,
    required this.diaNote,
    required this.dia_tags,
    required this.back,
    required this.dollar1,
    required this.rmb,
    required this.rmbTax,
    required this.rap,
    required this.fieldMore,
  });

  factory Order.fromJson(Map<String,dynamic> json) {
    return Order(
      ord_id: json["ord_id"],
      ord_sn: json["ord_sn"],
      ord_user_discount: json["ord_user_discount"],
      ord_amount: json["ord_amount"],
      ord_amount_actual: json["ord_amount_actual"],
      ord_amount_received: json["ord_amount_received"],
      ord_time: json["ord_time"],
      ord_status: json["ord_status"],
      diaPlace: json["dia_place"],
      diaShape: json["dia_shape"],
      diaCarat: json["dia_carat"],
      diaColor: json["dia_color"],
      diaColorIntensity: json["dia_color_intensity"],
      diaColorOvertone: json["dia_color_overtone"],
      diaColorColor: json["dia_color_color"],
      diaClarity: json["dia_clarity"],
      diaCut: json["dia_cut"],
      diaPolish: json["dia_polish"],
      diaSymmetry: json["dia_symmetry"],
      diaFluorescence: json["dia_fluorescence"],
      diaDiameter: json["dia_diameter"],
      diaColsh: json["dia_colsh"],
      diaMilky: json["dia_milky"],
      diaWc: json["dia_wc"],
      diaWt: json["dia_wt"],
      diaBt: json["dia_bt"],
      diaBc: json["dia_bc"],
      diaEyeClean: json["dia_eye_clean"],
      diaHna: json["dia_hna"],
      diaIns: json["dia_ins"],
      diaTable: json["dia_table"],
      diaDepth: json["dia_depth"],
      diaCa: json["dia_ca"],
      diaPa: json["dia_pa"],
      diaReport: json["dia_report"],
      diaReportNo: json["dia_report_no"],
      diaRap: json["dia_rap"],
      diaArrive: json["dia_arrive"],
      diaTime: json["dia_time"],
      dia_first_time: json["dia_first_time"],
      diaSerial: json["dia_serial"],
      imageUrl: json["image_url"],
      movieUrl: json["movie_url"],
      diaNote: json["dia_note"],
      dia_tags: json["dia_tags"],
      back: json["back"],
      dollar1: json["dollar_1"],
      rmb: json["rmb"],
      rmbTax: json["rmb_tax"],
      rap: json["rap"],
      fieldMore: json["field_more"],
    );
  }
}

/*

1 ord_id
2 ord_sn
3 ord_user_discount
4 ord_amount
5 ord_amount_actual
6 ord_amount_received
7 ord_time
8 ord_status
9 dia_place
10 dia_shape
11 dia_carat
12 dia_color
13 dia_color_intensity
14 dia_color_overtone
15 dia_color_color
16 dia_clarity
17 dia_cut
18 dia_polish
19 dia_symmetry
20 dia_fluorescence
21 dia_diameter
22 dia_colsh
23 dia_milky
24 dia_wc
25 dia_wt
26 dia_bt
27 dia_bc
28 dia_eye_clean
29 dia_hna
30 dia_ins
31 dia_table
32 dia_depth
33 dia_ca
34 dia_pa
35 dia_report
36 dia_report_no
37 dia_rap
38 dia_arrive
39 dia_time
40 dia_first_time
41 dia_serial
42 image_url
43 movie_url
44 dia_note
45 dia_tags
46 back
47 dollar_1
48 rmb
49 rmb_tax
50 rap
51 field_more
*/