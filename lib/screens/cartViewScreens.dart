import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Cart.dart';

class CartViewScreens extends StatelessWidget {
  static const routeName = "/cart-view-screens";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartdata>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: cart.cart.length + 1,
        itemBuilder: (ctx, i) => i == 0
            ? Container(
                height: 90,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Total: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        '\$ ${cart.total.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Spacer(),
                      RaisedButton.icon(
                        color: Theme.of(context).primaryColor,
                        onPressed: cart.total == 0
                            ? null
                            : () {
                                cart.clear();
                              },
                        icon: Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        label: Text(
                          "Order Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                height: 90,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Row(
                    children: [
                      Text(
                        cart.cart[i - 1].title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "\$ ${cart.cart[i - 1].price}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          cart.removeSingleQuanty("${cart.cart[i - 1].id}");
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "-",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "${cart.cart[i - 1].quantity} X",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          cart.addToCart(
                            "${cart.cart[i - 1].id}",
                            "${cart.cart[i - 1].title}",
                            cart.cart[i - 1].price,
                          );
                        },
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            "+",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
