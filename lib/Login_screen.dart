import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/scheduler.dart';
import 'package:my_first_flutter_app/AfterSplash.dart';
//import 'package:my_first_flutter_app/AfterSplash.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
import 'package:my_first_flutter_app/Forms/RegisterForm.dart';
import 'package:my_first_flutter_app/LoginResponse.dart';
import 'package:my_first_flutter_app/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

enum LoginStatus { notSignIn, SignIn, SignInAsGuest }

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin
    implements LoginCallback {
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
    // ignore: deprecated_member_use
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
        var loginBtn = new Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: new ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
        ),),
              backgroundColor: MaterialStateProperty.all(Colors.green)
            ),
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
          ),
        );

        var guestloginbtn = new Container(
          height: 40,
          width: MediaQuery.of(context).size.width * 0.65,
          child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),),
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor: MaterialStateProperty.all(Colors.green)
              ),
              onPressed: () {
                _loginStatus = LoginStatus.SignInAsGuest;
                print(_loginStatus);
                setState(() {});
              },
              child: Text(
                'Guest',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )),
        );

        var loginForm2 = CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Text(
                'daVinci',
                textDirection: TextDirection.ltr,
                softWrap: true,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'sans-serif'),
              ),
            ),
            // expandedHeight: MediaQuery.of(context).size.height * 0.2,
            // collapsedHeight: MediaQuery.of(context).size.height * 0.1,
            excludeHeaderSemantics: true,
            snap: true,
            floating: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            backgroundColor: MaterialColor(4048669772, <int, Color>{
              300: Color(3707764736),
              400: Color(4282557941),
              600: Color(4048669772),
            }),
          ),
          SliverAppBar(
            // expandedHeight: MediaQuery.of(context).size.height * 0.2,
            // collapsedHeight: MediaQuery.of(context).size.height * 0.1,
            pinned: true,
            toolbarHeight: 2.0,
            bottom: TabBar(
              controller: TabController(
                vsync: this,
                initialIndex: 0,
                length: 3,
              ),
              tabs: [
                Tab(child: Text('tab1')),
                Tab(child: Text('tab2')),
                Tab(child: Text('tab3')),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            backgroundColor: MaterialColor(4048669772, <int, Color>{
              300: Color(3707764736),
              400: Color(4282557941),
              600: Color(4048669772),
            }),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Align(
                  heightFactor: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Hello.\nWelcome Back',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Form(
                      key: _formKey,
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
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
                            padding: EdgeInsets.symmetric(horizontal: 15),
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
                Align(heightFactor: 1.5, child: loginBtn),
                Align(
                  heightFactor: 1.0,
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
                          Navigator.push(
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
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(child: guestloginbtn),
                )
              ],
            ),
          ),
        ]);
        // var loginForm = new Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     Padding(
        //       padding: const EdgeInsets.all(5.0),
        //       child: Align(alignment: Alignment.topLeft,
        //         child: Text('Hello.\nWelcome Back',
        //         style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 22
        //         ),),
        //       ),
        //     ),
        //
        //     new Form(
        //         key: _formKey,
        //         child: new Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: <Widget>[
        //             new Padding(
        //               padding: EdgeInsets.all(10.0),
        //               child: new TextFormField(
        //                 controller: _nameController,
        //                 validator: (String value) {
        //                   if (value.isEmpty) {
        //                     return 'name is required';
        //                   }
        //                   return null;
        //                 },
        //                 onSaved: (String value) => username = value,
        //                 decoration: InputDecoration(
        //                     labelText: 'Username',
        //                     suffixIcon: Icon(Icons.person)),
        //                 keyboardType: TextInputType.text,
        //               ),
        //             ),
        //             new Padding(
        //               padding: EdgeInsets.all(10.0),
        //               child: new TextFormField(
        //                 controller: _passwordController,
        //                 validator: (String value) {
        //                   if (value.isEmpty) {
        //                     return 'name is required';
        //                   }
        //                   return null;
        //                 },
        //                 onSaved: (String value) => password = value,
        //                 decoration: InputDecoration(
        //                     labelText: 'Password',
        //                     suffixIcon: Icon(Icons.lock)),
        //                 keyboardType: TextInputType.text,
        //               ),
        //             ),
        //           ],
        //         )),
        //     loginBtn,
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text('No account?',
        //         style: TextStyle(
        //           color: Colors.grey[600]
        //         ),),
        //         GestureDetector(
        //           onTap: (){
        //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Registration()));
        //           },
        //           child: Text('Sign Up here ',
        //           style:TextStyle(
        //             color: Colors.blue,
        //             decoration: TextDecoration.underline
        //           ),),
        //         ),
        //       ],
        //     )
        //   ],
        // );

        // Future<bool> rebuild() async{
        //   if(!mounted) return false;
        //   if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle){
        //     await SchedulerBinding.instance.endOfFrame;
        //     if(!mounted) return false;
        //   }
        //
        //   setState(() {
        //     _loginStatus = LoginStatus.SignInAsGuest;
        //   });
        //   return true;
        // }
        return new Scaffold(
          key: scaffoldKey,
          body: loginForm2,
        );
        break;
      case LoginStatus.SignIn:
        return new Container(
            child: new FutureBuilder<List<UserReal>>(
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

                    UserReal newUser =
                        UserReal(id, username, password, email, phoneNumber);
                    print(user.data);
                    print(user.data.first.username);
                    return Container(child: AfterSplash(newUser, _loginStatus));
                  }
                  return new Container(
                    alignment: AlignmentDirectional.center,
                    child: new CircularProgressIndicator(),
                  );
                }));
        break;
      case LoginStatus.SignInAsGuest:
        UserReal _user = UserReal(null, 'Guest', null, null, null);
        dbHelper.saveUser(_user);
        if (_user != null) {
          return Container(child: AfterSplash(_user, _loginStatus));
        }
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
  void onLoginSuccess(UserReal user) async {
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
