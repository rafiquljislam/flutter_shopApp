import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/Cart.dart';
import 'package:shopapp/providers/order.dart';

class SingleOrder extends StatefulWidget {
  final String id;
  SingleOrder(this.id);
  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  bool _showall = false;
  void togolshowall() {
    setState(() {
      _showall = !_showall;
    });
  }

  _singleRow(List<Cart> cart) {
    List<Container> ddddddd = [];
    TextStyle _textstyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    cart.forEach((element) {
      ddddddd.add(
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(element.title, style: _textstyle),
              Text("||", style: _textstyle),
              Text("${element.quantity} X", style: _textstyle),
              Text("||", style: _textstyle),
              Text("\$ ${element.price}", style: _textstyle),
              Text("||", style: _textstyle),
              Expanded(
                child: Text(DateFormat("yyyy-MM-dd").format(element.dateTime),
                    style: _textstyle, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
      );
    });
    return ddddddd;
  }

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<OrderData>(context, listen: false).singleOrder(widget.id);
    return Container(
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
      child: Column(
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Amounts : ${data.amounts}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                      _showall ? Icons.arrow_upward : Icons.arrow_downward),
                  onPressed: togolshowall,
                ),
              ],
            ),
          ),
          if (_showall)
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
              ),
              child: Column(
                children: _singleRow(data.products),
              ),
            ),
        ],
      ),
    );
  }
}
