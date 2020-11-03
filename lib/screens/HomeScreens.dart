import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Cart.dart';
import 'package:shopapp/screens/cartViewScreens.dart';
import 'package:shopapp/widgets/homeScreens/allProductsView.dart';

enum Options {
  Favorit,
  All,
}

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  var _favorit = false;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartdata>(context).cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("MyShop"),
        actions: [
          PopupMenuButton(
            onSelected: (Options op) {
              setState(() {
                if (op == Options.Favorit) {
                  _favorit = true;
                }
                if (op == Options.All) {
                  _favorit = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Favorit"),
                value: Options.Favorit,
              ),
              PopupMenuItem(
                child: Text("All Products"),
                value: Options.All,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7),
            child: Stack(
              children: [
                Text(cart.length.toString()),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartViewScreens.routeName);
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: AllProductsView(_favorit),
    );
  }
}
