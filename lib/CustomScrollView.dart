import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
import 'package:my_first_flutter_app/Forms/RegisterForm.dart';
import 'package:my_first_flutter_app/LoginResponse.dart';

class CustomScroll extends StatefulWidget {
  @override
  _CustomScrollState createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {
  String username, password;
  final _formKey = new GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  SQLiteDbProvider dbHelper = SQLiteDbProvider();

  LoginResponse _response;

  @override
  Widget build(BuildContext context) {
    var loginBtn = new Container(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, style: BorderStyle.none),
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: new RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            setState(() {
              username = _nameController.text;
              password = _passwordController.text;

              _formKey.currentState.save();
              debugPrint(username);
              try {
                _response.doLogin(username, password);
              } catch (e) {
                print(e);
              }
            });
          }
        },
        child: new Text('Login'),
        color: Colors.green,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Custom Scroll'),
          elevation: 2.0,
        ),
        body: CustomScrollView(slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Align(heightFactor: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Hello.\nWelcome Back',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Form(
                      //key: _formKey,
                      child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new TextFormField(
                          controller: _nameController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'name is required';
                            }
                            return null;
                          },
                          onSaved: (String value) => username = value,
                          decoration: InputDecoration(
                              labelText: 'Username',
                              suffixIcon: Icon(Icons.person)),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(10.0),
                        child: new TextFormField(
                          controller: _passwordController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'name is required';
                            }
                            return null;
                          },
                          onSaved: (String value) => password = value,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: Icon(Icons.lock)),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  )),
                ),
                Align(heightFactor: 1.5,
                    child: loginBtn),
                Align(heightFactor: 0.5,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No account?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registration()));
                        },
                        child: Text(
                          'Sign Up here ',
                          style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
