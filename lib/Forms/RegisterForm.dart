import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Login_screen.dart';
import 'package:my_first_flutter_app/UserModel.dart';
import 'package:my_first_flutter_app/DbHelper.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  String _username;
  String _password;
  String _email;
  String _phoneNumber;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
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
                    labelText: 'User Name',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Name is Required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _username = value;
                  },
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Email is required';
                    }
                    if (value == null) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _email = value;
                  },
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  onSaved: (String value) {
                    _password = value;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Phone Number'
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Phone Number is Required';
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

                        _username = _nameController.text;
                        _email = _priceController.text;
                        _password = _imageController.text;
                        _phoneNumber = _descriptionController.text;
                        _formkey.currentState.save();
                        UserReal user = UserReal(null, _username, _password, _email, _phoneNumber);
                        try {
                          SQLiteDbProvider().saveUser(user);
                          var r =SQLiteDbProvider().getSpecificUser(_username, _password);
                          print(r.toString());
                        } catch (e){print(e);}

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      }

                      /*Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList())).then((value) {});*/
                    },
                    child: Text('Register'),
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
