import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/drowerPage.dart';
import 'package:shopapp/widgets/homeScreens/singleCategory.dart';

class ProductDetailsScreens extends StatelessWidget {
  static const routeName = '/Product-Details-Screens';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final item = Provider.of<Products>(context, listen: false).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      drawer: DrowerPage(),
      body: ListView(
        children: [
          Image(
            width: double.infinity,
            height: 350,
            image: AssetImage(item.imageUrl),
            fit: BoxFit.fitHeight,
          ),
          SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                  ),
                  width: 100,
                  height: 40,
                  child: Text(
                    "\$ ${item.price}",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 15),
                RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart,
                    size: 22,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Add to cart",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  item.description +
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SingleCategory(item.catagory[0], "Releted Products")),
        ],
      ),
    );
  }
}
