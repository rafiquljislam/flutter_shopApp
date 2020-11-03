import 'package:flutter/material.dart';
import './product.dart';

enum Catagory_shop {
  Men,
  Woman,
  Shoes,
  T_Shart,
  Whomen_Shoes,
  Men_Shoe,
}

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      catagory: [Catagory_shop.Men],
      title: 'Men Drees 1',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/men1.jpg',
    ),
    Product(
      id: 'p2',
      catagory: [Catagory_shop.Men],
      title: 'Men Drees 2',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/men2.jpg',
    ),
    Product(
      id: 'p3',
      catagory: [Catagory_shop.Men],
      title: 'Men Drees 3',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/men3.jpg',
    ),
    Product(
      id: 'p4',
      catagory: [Catagory_shop.Men],
      title: 'Men Drees 4',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/men4.jpg',
    ),
    Product(
      id: 'p5',
      catagory: [Catagory_shop.Men],
      title: 'Men Drees 5',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/men5.jpg',
    ),
    Product(
      id: 'p6',
      catagory: [Catagory_shop.Men],
      title: 'Men Drees 6',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/men6.jpg',
    ),
    Product(
      id: 'ms1',
      catagory: [
        Catagory_shop.Men_Shoe,
        Catagory_shop.Men,
        Catagory_shop.Shoes
      ],
      title: 'Men shows 1',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/menshoes1.jpg',
    ),
    Product(
      id: 'ms2',
      catagory: [
        Catagory_shop.Men_Shoe,
        Catagory_shop.Men,
        Catagory_shop.Shoes
      ],
      title: 'Men shows 2',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/menshoes2.jpg',
    ),
    Product(
      id: 'ms3',
      catagory: [
        Catagory_shop.Men_Shoe,
        Catagory_shop.Men,
        Catagory_shop.Shoes
      ],
      title: 'Men shows 3',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/menshoes3.jpg',
    ),
    Product(
      id: 'ms4',
      catagory: [
        Catagory_shop.Men_Shoe,
        Catagory_shop.Men,
        Catagory_shop.Shoes
      ],
      title: 'Men shows 4',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/menshoes4.jpg',
    ),
    Product(
      id: 'ms5',
      catagory: [
        Catagory_shop.Men_Shoe,
        Catagory_shop.Men,
        Catagory_shop.Shoes
      ],
      title: 'Men shows 5',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/menshoes5.jpg',
    ),
    Product(
      id: 'ms6',
      catagory: [
        Catagory_shop.Men_Shoe,
        Catagory_shop.Men,
        Catagory_shop.Shoes
      ],
      title: 'Men shows 6',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/menshoes6.jpg',
    ),
    Product(
      id: 'ts1',
      catagory: [Catagory_shop.T_Shart, Catagory_shop.Men, Catagory_shop.Shoes],
      title: 'Men T-Shart 1',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/tshart1.jpg',
    ),
    Product(
      id: 'ts2',
      catagory: [Catagory_shop.T_Shart, Catagory_shop.Men, Catagory_shop.Shoes],
      title: 'Men T-Shart 2',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/tshart2.jpg',
    ),
    Product(
      id: 'ts3',
      catagory: [Catagory_shop.T_Shart, Catagory_shop.Men],
      title: 'Men T-Shart 3',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/tshart3.jpeg',
    ),
    Product(
      id: 'ts4',
      catagory: [Catagory_shop.T_Shart, Catagory_shop.Men],
      title: 'Men T-Shart 4',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/tshart4.jpg',
    ),
    Product(
      id: 'ts5',
      catagory: [Catagory_shop.T_Shart, Catagory_shop.Men],
      title: 'Men T-Shart 5',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/tshart5.png',
    ),
    Product(
      id: 'ts6',
      catagory: [Catagory_shop.T_Shart, Catagory_shop.Men],
      title: 'Men T-Shart 6',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/tshart6.jpg',
    ),
    Product(
      id: 'ws1',
      catagory: [Catagory_shop.Whomen_Shoes, Catagory_shop.Woman],
      title: 'Whomen Shoes 1',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/whomenShoes1.jpg',
    ),
    Product(
      id: 'ws2',
      catagory: [Catagory_shop.Whomen_Shoes, Catagory_shop.Woman],
      title: 'Whomen Shoes 2',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/whomenShoes2.jpg',
    ),
    Product(
      id: 'ws3',
      catagory: [Catagory_shop.Whomen_Shoes, Catagory_shop.Woman],
      title: 'Whomen Shoes 3',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/whomenShoes3.jpg',
    ),
    Product(
      id: 'ws4',
      catagory: [Catagory_shop.Whomen_Shoes, Catagory_shop.Woman],
      title: 'Whomen Shoes 4',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/whomenShoes4.jpg',
    ),
    Product(
      id: 'ws5',
      catagory: [Catagory_shop.Whomen_Shoes, Catagory_shop.Woman],
      title: 'Whomen Shoes 5',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/whomenShoes5.jpg',
    ),
    Product(
      id: 'ws6',
      catagory: [Catagory_shop.Whomen_Shoes, Catagory_shop.Woman],
      title: 'Whomen Shoes 6',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/whomenShoes6.jpg',
    ),
    Product(
      id: 'ws1',
      catagory: [Catagory_shop.Whomen_Shoes, Catagory_shop.Woman],
      title: 'Whomen Shoes 7',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/whomenShoes7.jpg',
    ),
    Product(
      id: 'w1',
      catagory: [Catagory_shop.Woman],
      title: 'Whomen Dress 1',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/women1.jpg',
    ),
    Product(
      id: 'w2',
      catagory: [Catagory_shop.Woman],
      title: 'Whomen Dress 2',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/women2.webp',
    ),
    Product(
      id: 'w3',
      catagory: [Catagory_shop.Woman],
      title: 'Whomen Dress 3',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/women3.jpg',
    ),
    Product(
      id: 'w4',
      catagory: [Catagory_shop.Woman],
      title: 'Whomen Dress 4',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/women4.jpg',
    ),
    Product(
      id: 'w5',
      catagory: [Catagory_shop.Woman],
      title: 'Whomen Dress 5',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/women5.jpg',
    ),
    Product(
      id: 'w6',
      catagory: [Catagory_shop.Woman],
      title: 'Whomen Dress 6',
      description: 'Test Dscription',
      price: 29.99,
      imageUrl: 'assets/women6.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> prod(Catagory_shop catagoryType) {
    return _items
        .where((element) => element.catagory.contains(catagoryType))
        .toList();
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }
}
