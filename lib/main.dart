import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Cart.dart';
import 'package:shopapp/providers/Profile.dart';
import 'package:shopapp/providers/order.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screens/HomeScreens.dart';
import 'package:shopapp/screens/ProfileScreens.dart';
import 'package:shopapp/screens/addProducts.dart';
import 'package:shopapp/screens/cartViewScreens.dart';
import 'package:shopapp/screens/editProductsScreens.dart';
import 'package:shopapp/screens/orderViewScreens.dart';
import 'package:shopapp/screens/productDetailsScreens.dart';
import 'package:shopapp/widgets/homeScreens/allProductsView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cartdata()),
        ChangeNotifierProvider(create: (ctx) => ProfileData()),
        ChangeNotifierProvider(create: (ctx) => OrderData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          primaryColor: Colors.green,
        ),
        home: HomeScreens(),
        routes: {
          AllProductsView.routeName: (ctx) => AllProductsView(),
          ProductDetailsScreens.routeName: (ctx) => ProductDetailsScreens(),
          CartViewScreens.routeName: (ctx) => CartViewScreens(),
          OrderViewscreens.routeName: (ctx) => OrderViewscreens(),
          ProfileScreens.routeName: (ctx) => ProfileScreens(),
          HomeScreens.routeName: (ctx) => HomeScreens(),
          AddProducts.routeName: (ctx) => AddProducts(),
          EditProductScreens.routeName: (ctx) => EditProductScreens(),
        },
      ),
    );
  }
}
