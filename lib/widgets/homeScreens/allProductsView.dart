import 'package:flutter/material.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screens/favoriteScreens.dart';
import 'package:shopapp/widgets/homeScreens/singleCategory.dart';

class AllProductsView extends StatefulWidget {
  static const routeName = '/all-products-screens';
  final bool favorit;
  AllProductsView([this.favorit]);
  @override
  _AllProductsViewState createState() => _AllProductsViewState();
}

class _AllProductsViewState extends State<AllProductsView> {
  @override
  Widget build(BuildContext context) {
    return widget.favorit
        ? FavoriteScreens()
        : ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(15),
            children: [
              Container(
                child: Center(
                  child: Text(
                    "All Products",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SingleCategory(Catagory_shop.Men, "Men Products"),
              SingleCategory(Catagory_shop.Woman, "Whomen Products"),
              SingleCategory(Catagory_shop.Men_Shoe, "Men Showos"),
              SingleCategory(Catagory_shop.Whomen_Shoes, "Whomen Showos"),
              SingleCategory(Catagory_shop.T_Shart, "T Sharts"),
            ],
          );
  }
}
