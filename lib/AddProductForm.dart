
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Image',
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                  ),
                ),
               TextField(
                 decoration: InputDecoration(
                   labelText: 'Description',
                   border: OutlineInputBorder(
                     borderSide: BorderSide.none,
                     borderRadius: BorderRadius.circular(4.0),
                   ),
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
