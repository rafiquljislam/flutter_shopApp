import 'package:flutter/cupertino.dart';
import 'package:shopapp/providers/Cart.dart';

class Order {
  final String id;
  final DateTime dateTime;
  final double amounts;
  final List<Cart> products;

  Order({
    @required this.id,
    @required this.dateTime,
    @required this.amounts,
    @required this.products,
  });
}

class OrderData with ChangeNotifier {
  List<Order> _order = [
    Order(id: "order1", amounts: 454.0, dateTime: DateTime.now(), products: [
      Cart(
        dateTime: DateTime.now(),
        prodId: 'p1',
        price: 29.99,
        title: 'Men Drees 1',
        quantity: 4,
      ),
      Cart(
        prodId: 'p2',
        dateTime: DateTime.now(),
        price: 29.99,
        title: 'Men Drees 2',
        quantity: 4,
      ),
      Cart(
        dateTime: DateTime.now(),
        prodId: 'p1',
        price: 29.99,
        title: 'Men Drees 2',
        quantity: 4,
      ),
    ]),
    Order(id: "order2", amounts: 444.0, dateTime: DateTime.now(), products: [
      Cart(
        dateTime: DateTime.now(),
        prodId: 'p1',
        price: 29.99,
        title: 'Men Drees 1',
        quantity: 4,
      ),
      Cart(
        dateTime: DateTime.now(),
        prodId: 'p2',
        price: 29.99,
        title: 'Men Drees 2',
        quantity: 4,
      ),
      Cart(
        dateTime: DateTime.now(),
        prodId: 'p1',
        price: 29.99,
        title: 'Men Drees 2',
        quantity: 4,
      ),
      Cart(
        dateTime: DateTime.now(),
        prodId: 'p1',
        price: 29.99,
        title: 'Men Drees 2',
        quantity: 4,
      ),
      Cart(
        dateTime: DateTime.now(),
        prodId: 'p1',
        price: 29.99,
        title: 'Men Drees 2',
        quantity: 4,
      ),
      Cart(
        dateTime: DateTime.now(),
        prodId: 'p1',
        price: 29.99,
        title: 'Men Drees 2',
        quantity: 4,
      ),
    ]),
  ];

  List<Order> get order {
    return [..._order];
  }

  double get totalAmount {
    double _total = 0.0;
    _order.forEach((element) {
      _total += element.amounts;
    });
    return _total;
  }

  Order singleOrder(String id) {
    return _order.firstWhere((element) => element.id == id);
  }
}
