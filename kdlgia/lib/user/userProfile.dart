class UserProfile {
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
  final String sales;
  final String salesPhone;
  final String salesWeixin;
  var exrate;
  var tax;

  UserProfile({
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
      userId: json['user_id'],
      userKind: json['user_kind'],
      userName: json['user_name'],
      userRealName: json['user_real_name'],
      userGender: json['user_gender'],
      userQQ: json['user_qq'],
      userSkype: json['user_skype'],
      userWeixin: json['user_weixin'],
      userEmail: json['user_email'],
      userPhone: json['user_phone'],
      userAddress: json['user_address'],
      userLoginTimes: json['user_login_times'],
      userAddTime: json['user_add_time'],
      userThisTime: json['user_this_time'],
      userThisIp: json['user_this_ip'],
      userLastTime: json['user_last_time'],
      userLastIp: json['user_last_ip'],
      isModified: json['is_modified'],
      userAbbr: json['user_abbr'],
      userCompany: json['user_company'],
      userFetchDays: json['user_fetch_days'],
      orders: json['orders'],
      quantity: json['quantity'],
      consumption: json['consumption'],
      balance: json['balance'],
      myHold: json['my_hold'],
      myMemo: json['my_memo'],
      myNotTakenCount: json['my_not_taken_count'],
      myNotTakenAmount: json['my_not_taken_amount'],
      sales: json['sales'],
      salesPhone: json['sales_phone'],
      salesWeixin: json['sales_weixin'],
      exrate: json['exrate'],
      tax: json['tax'],
    );
  }
}
