import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/main.dart';
import 'package:my_first_flutter_app/DbHelper.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String name;
  int price;
  String image;
  String description;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  final _descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product Page'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Center(
          child: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Product name is Required';
                    }
                    return value;
                  },
                  onSaved: (String value) {
                    name = value;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Price is required';
                    }
                    final n = num.tryParse(value);
                    if (n == null) {
                      return '"$value" is not a valid number';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    price = int.parse(value);
                  },
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: InputDecoration(
                    labelText: 'Image',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Image is required';
                    }
                    return value;
                  },
                  onSaved: (String value) {
                    image = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _descriptionController,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          style: BorderStyle.solid, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    helperMaxLines: 10,
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Description is Required';
                    }
                    return description;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                /*RaisedButton.icon(onPressed: (){print('Product added successfully');},
                    icon: Icon(Icons.add), label: Text('ADD'),
                shape: RoundedRectangleBorder(side: BorderSide(color: Colors.teal)),),*/
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                  child: FlatButton(
                    onPressed: () {
                      if (!_formkey.currentState.validate()) {
                        return 'Failed';
                      }else {
                        _formkey.currentState.save();
                        ProductCard product = ProductCard(
                            7, name, description, price, image);
                        SQLiteDbProvider().insert(product);
                        _nameController.text = product.name;
                        _priceController.text = product.price.toString();
                        _imageController.text = product.image;
                        _descriptionController.text = product.description;

                        Navigator.pop(context);
                      }


                    },
                    child: Text('ADD'),
                    padding: EdgeInsets.all(5.0),
                    color: Colors.blue,
                    minWidth: 5.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
