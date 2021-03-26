import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
import 'package:my_first_flutter_app/FriendsModel.dart';

class AddFriend extends StatefulWidget {
  final int uid;
  AddFriend(this.uid);
  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  String name;
  String email;
  String phonenumber;
  String image;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _imageController = TextEditingController();
  final _phoneController = TextEditingController();

  SQLiteDbProvider dbHelper = SQLiteDbProvider();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name '),
      controller: _nameController,
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
      controller: _emailController,
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
      controller: _phoneController,
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

  Widget _buildImage() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Image '),
      controller: _imageController,
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {

        }
        return null;
      },
      onSaved: (String value) {
        image = value;
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
                _buildImage(),
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

                    name = _nameController.text;
                    email = _emailController.text;
                    image = _imageController.text;
                    phonenumber = _phoneController.text;
                    _formkey.currentState.save();

                    Friend friend = Friend(widget.uid, name, phonenumber, email, image);
                    try {
                      dbHelper.addFriend(friend);
                    } catch (e){print(e);}

                    Navigator.pop(context);
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
