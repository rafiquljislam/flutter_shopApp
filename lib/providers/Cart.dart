import 'package:flutter/cupertino.dart';

class Cart {
  final String prodId;
  final double price;
  final String title;
  final DateTime dateTime;
  final int quantity;

  Cart({
    @required this.prodId,
    @required this.price,
    @required this.title,
    @required this.dateTime,
    @required this.quantity,
  });
}

class Cartdata with ChangeNotifier {
  Map<String, Cart> _carts = {
    'cart1': Cart(
      prodId: 'p1',
      price: 29.99,
      title: 'Men Drees 1',
      dateTime: DateTime.now(),
      quantity: 4,
    ),
    'cart2': Cart(
      prodId: 'p2',
      price: 29.99,
      title: 'Men Drees 2',
      dateTime: DateTime.now(),
      quantity: 5,
    ),
  };

  Map<String, Cart> get cart {
    return {..._carts};
  }

  double get total {
    double _total = 0.0;
    _carts.forEach((key, value) {
      _total += value.price * value.quantity;
    });
    return _total;
  }

  void addToCart(String cartid, String title, double price) {
    if (_carts.containsKey(cartid)) {
      _carts.update(
        cartid,
        (value) => Cart(
          prodId: value.prodId,
          title: value.title,
          dateTime: value.dateTime,
          price: value.price,
          quantity: value.quantity + 1,
        ),
      );
    } else {
      _carts.putIfAbsent(
        cartid,
        () => Cart(
          prodId: cartid,
          title: title,
          price: price,
          dateTime: DateTime.now(),
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String cartid) {
    var ffff = _carts.entries.firstWhere((element) => element.key == cartid);
    if (ffff.value.quantity > 1) {
      _carts.update(
        cartid,
        (value) => Cart(
          prodId: value.prodId,
          dateTime: value.dateTime,
          price: value.price,
          title: value.title,
          quantity: value.quantity - 1,
        ),
      );
    } else {
      _carts.remove(cartid);
    }
    notifyListeners();
  }

  void clear() {
    _carts = {};
    notifyListeners();
  }
}
