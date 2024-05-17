import 'package:kdlgia/search/diamondDataDetail.dart';

class DiamondData {
  var  s;
  var  m;
  var cartNum;
  var total;
  var perPage;
  var page;
  var pages;
  final List<Diamond> diamonds;

  DiamondData({
    required this.s,
    required this.m,
    required this.cartNum,
    required this.total,
    required this.perPage,
    required this.page,
    required this.pages,
    required this.diamonds,
  });
}