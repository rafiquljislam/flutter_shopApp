import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/homeScreens/singleProd.dart';

class FavoriteScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allfavorites =
        Provider.of<Products>(context, listen: false).favoriteItems;
    return allfavorites.length == 0
        ? Center(
            child: Text(
              "No Favorite Added",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          )
        : ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    "Favorites Products",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(
                  bottom: 150,
                  left: 10,
                  right: 10,
                  top: 10,
                ),
                child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: allfavorites.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: allfavorites[i],
                    child: SingleProd(),
                  ),
                ),
              ),
            ],
          );
  }
}
