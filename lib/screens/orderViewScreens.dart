import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/order.dart';
import 'package:shopapp/widgets/drowerPage.dart';
import 'package:shopapp/widgets/singleOrders.dart';

class OrderViewscreens extends StatelessWidget {
  static const routeName = '/order-view-screens';
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<OrderData>(context, listen: false).order;
    final datas = Provider.of<OrderData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      drawer: DrowerPage(),
      body: ListView.builder(
        itemCount: data.length + 1,
        itemBuilder: (ctx, i) => i == 0
            ? Container(
                height: 60,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Order : ${data.length}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Amounts : ${datas.totalAmount}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : SingleOrder(data[i - 1].id),
      ),
    );
  }
}
