import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Cart.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/screens/productDetailsScreens.dart';

class SingleProd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cartdata>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(2, 0),
          )
        ],
        color: Colors.white,
      ),
      margin: EdgeInsets.only(right: 15),
      width: 200,
      child: GridTile(
        header: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailsScreens.routeName, arguments: item.id);
          },
          child: Image(
            image: AssetImage(item.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: IconButton(
            onPressed: () {
              item.toggleFavoriteStatus();
            },
            icon:
                Icon(item.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Colors.red,
          ),
          title: Text(
            item.price.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addToCart(item.id, item.title, item.price);
            },
            icon: Icon(Icons.add_shopping_cart_outlined),
          ),
        ),
      ),
    );
  }
}
