import 'package:flutter/foundation.dart';
import 'package:shopapp/providers/products.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final List<Catagory_shop> catagory;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.catagory,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
