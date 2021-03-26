import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
import 'file:///C:/Users/user/Desktop/firstflutterApp/lib/Models/UserModel.dart';
import 'package:my_first_flutter_app/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_first_flutter_app/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginStatus { notSignIn, SignIn }

class _LoginScreenState extends State<LoginScreen> implements LoginCallback {
  String username, password;
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  final _formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  SQLiteDbProvider dbHelper = SQLiteDbProvider();

  LoginResponse _response;
  /*LoginCallback _callback;*/

  loginPageState() {
    _response = new LoginResponse(onLoginSuccess, onLoginError);
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      username = preferences.getString("user");
      password = preferences.getString("pass");
      _loginStatus = value == 1 ? LoginStatus.SignIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      // ignore: deprecated_member_use
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  /*getUser() async{
    var run = await SQLiteDbProvider().getSpecificUser(username, password);
    print(run);
    User newUser = new User(run.id, run.username, run.password, run.email, run.phoneNumber);
    return ProductList(newUser);
  }*/

  @override
  void initState() {
    super.initState();
    _response = LoginResponse(onLoginSuccess, onLoginError);
    getPref();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        var loginBtn = new RaisedButton(
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
        );

        var loginForm = new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Form(
                key: _formKey,
                child: new Column(
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
            loginBtn,
          ],
        );

        return new Scaffold(
          appBar: new AppBar(
            title: Text('Login Page'),
          ),
          key: scaffoldKey,
          body: new Container(
            child: new Center(
              child: loginForm,
            ),
          ),
        );
        break;
      case LoginStatus.SignIn:
        return new Container(
            child: new FutureBuilder<List<User>>(
                future: dbHelper.getSpecificUser(username, password),
                builder: (context, user) {
                  if (user.hasData) {
                    final int id = user.data.first.id;
                    final String username = user.data.first.username;
                    final String password = user.data.first.password;
                    final String email = user.data.first.email;
                    final String phoneNumber = user.data.first.phoneNumber;
                    print(id);
                    print(username);
                    print(password);
                    User newUser =
                        User(id, username, password, email, phoneNumber);
                    print(user.data);
                    print(user.data.first.username);
                    return Container(child: ProductList(newUser));
                  }
                  return new Container(
                    alignment: AlignmentDirectional.center,
                    child: new CircularProgressIndicator(),
                  );
                }));
        break;
    }
  }

  savePref(int value, String user, String pass) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("user", user);
      preferences.setString("pass", pass);
      // ignore: deprecated_member_use
      preferences.commit();
    });
  }

  @override
  void onLoginError(String error) {
    _showSnackBar(error);
    setState(() {});
  }

  @override
  void onLoginSuccess(User user) async {
    if (user != null) {
      savePref(1, user.username, user.password);
      _loginStatus = LoginStatus.SignIn;
      print('Success');
    } else {
      _showSnackBar("Login Leonardo, Login Failed");
      setState(() {});
    }
  }
}
