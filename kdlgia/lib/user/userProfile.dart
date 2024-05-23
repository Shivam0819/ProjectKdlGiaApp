class UserProfile {
  final String m;
  final String s;
  final String userId;
  final String userKind;
  final String userName;
  final String userRealName;
  final String? userGender; // Nullable field
  final String? userQQ; // Nullable field
  final String? userSkype; // Nullable field
  final String? userWeixin; // Nullable field
  final String? userEmail; // Nullable field
  final String? userPhone; // Nullable field
  final String? userAddress; // Nullable field
  var userLoginTimes;
  final String userAddTime;
  final String userThisTime;
  final String userThisIp;
  final String userLastTime;
  final String userLastIp;
  final bool isModified;
  final String? userAbbr; // Nullable field
  final String? userCompany; // Nullable field
  var userFetchDays;
  var orders;
  var quantity;
  var consumption;
  var balance;
  var myHold;
  var myMemo;
  var myNotTakenCount;
  var myNotTakenAmount;
  final String? sales;
  final String? salesPhone;
  final String? salesWeixin;
  final String? salesSkype;
  final String? salesWhatsapp;
  final String? salesPerson;
  final String? salesPersonPhone;
  final String? salesPersonWeixin;
  final String? salesPersonSkype;
  final String? salesPersonWhatsapp;
  var exrate;
  var tax;

  UserProfile({
    required this.m,
    required this.s,
    required this.userId,
    required this.userKind,
    required this.userName,
    required this.userRealName,
    required this.userLoginTimes,
    required this.userAddTime,
    required this.userThisTime,
    required this.userThisIp,
    required this.userLastTime,
    required this.userLastIp,
    required this.isModified,
    required this.userFetchDays,
    required this.orders,
    required this.quantity,
    required this.consumption,
    required this.balance,
    required this.myHold,
    required this.myMemo,
    required this.myNotTakenCount,
    required this.myNotTakenAmount,
    required this.sales,
    required this.salesPhone,
    required this.salesWeixin,
    required this.salesSkype,
    required this.salesWhatsapp,
    required this.salesPerson,
    required this.salesPersonPhone,
    required this.salesPersonWeixin,
    required this.salesPersonSkype,
    required this.salesPersonWhatsapp,
    required this.exrate,
    required this.tax,
    this.userGender,
    this.userQQ,
    this.userSkype,
    this.userWeixin,
    this.userEmail,
    this.userPhone,
    this.userAddress,
    this.userAbbr,
    this.userCompany,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
  return UserProfile(
    m: json['m'] ?? "",
    s: json['s'] ?? "",
    userId: json['user_id'] ?? "",
    userKind: json['user_kind'] ?? "",
    userName: json['user_name'] ?? "",
    userRealName: json['user_real_name'] ?? "",
    userGender: json['user_gender'],
    userQQ: json['user_qq'],
    userSkype: json['user_skype'],
    userWeixin: json['user_weixin'],
    userEmail: json['user_email'],
    userPhone: json['user_phone'],
    userAddress: json['user_address'],
    userLoginTimes: json['user_login_times'] ?? 0,
    userAddTime: json['user_add_time'] ?? "",
    userThisTime: json['user_this_time'] ?? "",
    userThisIp: json['user_this_ip'] ?? "",
    userLastTime: json['user_last_time'] ?? "",
    userLastIp: json['user_last_ip'] ?? "",
    isModified: json['is_modified'] ?? false,
    userAbbr: json['user_abbr'],
    userCompany: json['user_company'],
    userFetchDays: json['user_fetch_days'] ?? 0,
    orders: json['orders'] ?? 0,
    quantity: json['quantity'] ?? 0,
    consumption: json['consumption'] ?? 0,
    balance: json['balance'] ?? 0,
    myHold: json['my_hold'] ?? 0,
    myMemo: json['my_memo'] ?? 0,
    myNotTakenCount: json['my_not_taken_count'] ?? 0,
    myNotTakenAmount: json['my_not_taken_amount'] ?? 0,
    sales: json['sales'] ?? "",
    salesPhone: json['sales_phone'] ?? "",
    salesWeixin: json['sales_weixin'] ?? "",
    salesSkype: json['sales_skype'] ?? "",
    salesWhatsapp: json['sales_whatsapp'] ?? "",
    salesPerson: json['sales_person'] ?? "",
    salesPersonPhone: json['sales_person_phone'] ?? "",
    salesPersonWeixin: json['sales_person_weixin'] ?? "",
    salesPersonSkype: json['sales_person_skype'] ?? "",
    salesPersonWhatsapp: json['sales_person_whatsapp'] ?? "",
    exrate: json['exrate'] ?? 0,
    tax: json['tax'] ?? 0,
  );
}
}