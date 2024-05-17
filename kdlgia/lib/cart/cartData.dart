class CartResponse {
  final int s;
  final String m;
  final CartData cart;
  final List<dynamic> post;
  final List<dynamic> get;

  CartResponse({
    required this.s,
    required this.m,
    required this.cart,
    required this.post,
    required this.get,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      s: json['s'],
      m: json['m'],
      cart: CartData.fromJson(json['cart']),
      post: json['post'],
      get: json['get'],
    );
  }
}

class CartData {
  final List<String> item;
  final int total;
  final String amount;
  final FormData form;

  CartData({
    required this.item,
    required this.total,
    required this.amount,
    required this.form,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      item: List<String>.from(json['item']),
      total: json['total'],
      amount: json['amount'],
      form: FormData.fromJson(json['form']),
    );
  }
}

class FormData {
  final String cartReceiver;
  final String cartPhone;
  final String cartAddress;
  final String cartNote;

  FormData({
    required this.cartReceiver,
    required this.cartPhone,
    required this.cartAddress,
    required this.cartNote,
  });

  factory FormData.fromJson(Map<String, dynamic> json) {
    return FormData(
      cartReceiver: json['cart_receiver'],
      cartPhone: json['cart_phone'],
      cartAddress: json['cart_address'],
      cartNote: json['cart_note'],
    );
  }
}
