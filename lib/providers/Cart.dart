import 'package:flutter/cupertino.dart';

class Cart {
  final String id;
  final String prodId;
  final double price;
  final String title;
  final DateTime dateTime;
  final int quantity;

  Cart({
    this.id,
    this.prodId,
    this.price,
    this.title,
    this.dateTime,
    this.quantity,
  });
}

class Cartdata with ChangeNotifier {
  List<Cart> _carts = [
    Cart(
      id: 'cart1',
      prodId: 'p1',
      price: 29.99,
      title: 'Men Drees 1',
      quantity: 4,
    ),
    Cart(
      id: 'cart2',
      prodId: 'p2',
      price: 29.99,
      title: 'Men Drees 2',
      quantity: 5,
    ),
  ];

  List<Cart> get cart {
    return [..._carts];
  }

  double get total {
    double _total = 0.0;
    _carts.forEach((element) {
      _total += element.price * element.quantity;
    });
    return _total;
  }

  void removeSingleQuanty(String cartid) {
    var singlecart = _carts.firstWhere((element) => element.id == cartid);
    var index = _carts.indexWhere((element) => element.id == cartid);
    if (singlecart.quantity > 1) {
      _carts[index] = Cart(
        id: cartid,
        prodId: singlecart.prodId,
        title: singlecart.title,
        price: singlecart.price,
        dateTime: singlecart.dateTime,
        quantity: singlecart.quantity - 1,
      );
    } else {
      _carts.removeWhere((element) => element.id == cartid);
    }
    notifyListeners();
  }

  void addToCart(String prodid, String title, double price) {
    var data;
    try {
      data = _carts.firstWhere((element) => element.id == prodid);
    } catch (e) {
      print(e.toString());
    }
    var index = _carts.indexWhere((element) => element.id == prodid);
    if (data != null) {
      Cart caffff = Cart(
        id: data.id,
        prodId: prodid,
        dateTime: data.dateTime,
        price: data.price,
        title: data.title,
        quantity: data.quantity + 1,
      );
      _carts[index] = caffff;
    } else if (data == null) {
      _carts.add(
        Cart(
          id: prodid,
          prodId: prodid,
          title: title,
          price: price,
          quantity: 1,
          dateTime: DateTime.now(),
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _carts = [];
    notifyListeners();
  }
}
