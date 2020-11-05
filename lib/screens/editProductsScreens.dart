import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/product.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/imageCamera.dart';

class EditProductScreens extends StatefulWidget {
  static const routeName = '/edit-product-screens';

  @override
  _EditProductScreensState createState() => _EditProductScreensState();
}

class _EditProductScreensState extends State<EditProductScreens> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  Catagory_shop _tempCatagory;
  String _imagePath;
  String _title;
  String _description;
  double _price;
  TextStyle _popUpstyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  _getImagePath(String path) {
    setState(() {
      _imagePath = path;
    });
  }

  Future<void> saveFrom() async {
    if (!_form.currentState.validate()) {
      return;
    }
    _form.currentState.save();
    print(_title);
    print(_description);
    print(_tempCatagory);
    print(_price);
    print(_imagePath);
    Product product = Product(
      id: DateTime.now().toString(),
      imageUrl: _imagePath,
      description: _description,
      title: _title,
      price: _price,
      catagory: [_tempCatagory],
    );
    Provider.of<Products>(context, listen: false).addProduct(product);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Products"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    labelText: 'Title',
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return "Enter a title";
                    }
                    if (v.length <= 10) {
                      return "Title Most be 10 carecter";
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _title = v;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                  ),
                  validator: (v) {
                    if (v.isEmpty) {
                      return "Enter a Description";
                    }
                    if (v.length <= 10) {
                      return "Description Most be 10 carecter";
                    }
                    return null;
                  },
                  onSaved: (v) {
                    _description = v;
                  },
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    PopupMenuButton(
                      onSelected: (Catagory_shop cate) {
                        setState(() {
                          _tempCatagory = cate;
                        });
                      },
                      itemBuilder: (_) => [
                        PopupMenuItem(
                          child: Text(
                            describeEnum(Catagory_shop.Men).toString(),
                            style: _popUpstyle,
                          ),
                          value: Catagory_shop.Men,
                        ),
                        PopupMenuItem(
                          value: Catagory_shop.Woman,
                          child: Text(
                            describeEnum(Catagory_shop.Woman).toString(),
                            style: _popUpstyle,
                          ),
                        ),
                        PopupMenuItem(
                          value: Catagory_shop.Men_Shoe,
                          child: Text(
                            describeEnum(Catagory_shop.Men_Shoe).toString(),
                            style: _popUpstyle,
                          ),
                        ),
                        PopupMenuItem(
                          value: Catagory_shop.Whomen_Shoes,
                          child: Text(
                            describeEnum(Catagory_shop.Whomen_Shoes).toString(),
                            style: _popUpstyle,
                          ),
                        ),
                        PopupMenuItem(
                          value: Catagory_shop.Shoes,
                          child: Text(
                            describeEnum(Catagory_shop.Shoes).toString(),
                            style: _popUpstyle,
                          ),
                        ),
                        PopupMenuItem(
                          value: Catagory_shop.T_Shart,
                          child: Text(
                            describeEnum(Catagory_shop.T_Shart).toString(),
                            style: _popUpstyle,
                          ),
                        ),
                      ],
                      child: Container(
                        width: 150,
                        child: Row(
                          children: [
                            Text(
                              _tempCatagory == null
                                  ? "Catagory"
                                  : describeEnum(
                                      _tempCatagory.toString(),
                                    ),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Price',
                          labelText: 'Price',
                        ),
                        validator: (v) {
                          if (v.isEmpty) {
                            return "Enter a price";
                          }
                          if (double.parse(v) <= 0) {
                            return "Give a Valid Price";
                          }
                          return null;
                        },
                        onSaved: (v) {
                          _price = double.parse(v);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ImageCameta(_getImagePath),
                SizedBox(height: 30),
                Container(
                  child: RaisedButton(
                    color: Colors.redAccent,
                    onPressed: () {
                      saveFrom();
                    },
                    child: Text(
                      "Add Product",
                      style: TextStyle(
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
