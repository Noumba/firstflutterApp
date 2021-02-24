import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFriend extends StatefulWidget {
  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  String name;
  String email;
  String phonenumber;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name '),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email '),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }
        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number '),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }
        return null;
      },
      onSaved: (String value) {
        phonenumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Friend'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        /*color: Colors.blue,
        margin: EdgeInsets.all(24),*/
        child: Form(
            key: _formkey,
            child: ListView(
              padding: EdgeInsets.all(30),
              scrollDirection: Axis.vertical,
              /*mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,*/
              children: [
                _buildName(),
                _buildEmail(),
                _buildPhoneNumber(),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 24,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    if (!_formkey.currentState.validate()) {
                      return 'Failed';
                    }
                    _formkey.currentState.save();
                    print('Success');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: Text(
                    'AddFriend',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
