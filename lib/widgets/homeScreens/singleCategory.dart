import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/homeScreens/singleProd.dart';

class SingleCategory extends StatelessWidget {
  final Catagory_shop catagory;
  final String catagoryName;
  SingleCategory(this.catagory, this.catagoryName);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    final item = products.prod(catagory);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              catagoryName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: 3,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.double,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 3,
            ),
            height: MediaQuery.of(context).size.height / 4,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: item.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: item[i],
                child: SingleProd(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
