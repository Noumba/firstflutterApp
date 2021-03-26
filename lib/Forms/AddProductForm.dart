import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/main.dart';
import 'package:my_first_flutter_app/DbHelper.dart';

class AddProduct extends StatefulWidget {
  final int _userid;
  AddProduct(this._userid);

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
  /*void initState() {
    // TODO: implement initState
    super.initState();
     /*_nameController = TextEditingController();
     _priceController = TextEditingController();
     _imageController = TextEditingController();
     _descriptionController = TextEditingController();*/
    _nameController.text = name;
    _priceController.text = price.toString();
    _imageController.text = image;
    _descriptionController.text = description;
  }*/


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
                    return null;
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
                      
                    }
                    return null;
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
                    return null;
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
                        if (_formkey.currentState.validate()) {

                           name = _nameController.text;
                           price = int.parse(_priceController.text);
                           image = _imageController.text;
                           description = _descriptionController.text;
                          _formkey.currentState.save();
                          debugPrint(price.toString());
                          ProductCard product = ProductCard(null, widget._userid, name, description, price, image);
                          try {
                            SQLiteDbProvider().insert(product);
                          } catch (e){print(e);}

                           Navigator.pop(context);
                        }

                      /*Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList())).then((value) {});*/
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
