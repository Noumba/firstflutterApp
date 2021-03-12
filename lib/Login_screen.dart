import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/UserModel.dart';
import 'package:my_first_flutter_app/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_first_flutter_app/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginStatus { notSignIn, SignIn}

class _LoginScreenState extends State<LoginScreen> implements LoginCallback {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  String _username, _password;
  LoginResponse _response;

  loginPageState() {
    _response = new LoginResponse(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()){
      setState(() {
        form.save();
        _response.doLogin(_username, _password);
      });
    }
  }

  void _showSnackBar(String text){
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
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

  @override
  void initState(){
    super.initState();
    getPref();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (_loginStatus){
      case LoginStatus.notSignIn:
        var loginBtn = new RaisedButton(
          onPressed: _submit,
          child: new Text('Login'),
          color: Colors.green,
        );

        var loginForm = new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Form(
                key: formKey,
                child: new Column(
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new TextFormField(
                        onSaved: (val) => _username = val,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            suffixIcon: Icon(Icons.person)
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new TextFormField(
                        onSaved: (val) => _password = val,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Icon(Icons.lock)
                        ),
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
        ProductList();
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
  void onLoginError(String error){
    _showSnackBar(error);
    setState(() {
    });
  }

  @override
  void onLoginSuccess(User user) async {
    if(user != null){
      savePref(1, user.username, user.password);
      _loginStatus = LoginStatus.SignIn;
    }else{
      _showSnackBar("Login Leonardo, Silahkan Login Failed");
      setState(() {
      });
    }
  }
}
