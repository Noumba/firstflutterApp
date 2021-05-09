import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/CameraPage.dart';
import 'package:my_first_flutter_app/CovidTracker.dart';
import 'file:///C:/Users/user/Desktop/firstflutterApp/lib/Forms/FirstTaskForm.dart';
import 'package:my_first_flutter_app/DataTable.dart';
import 'package:my_first_flutter_app/FeedbackPage.dart';
import 'package:my_first_flutter_app/Jsondata.dart';
import 'package:my_first_flutter_app/Location.dart';
import 'package:my_first_flutter_app/UserModel.dart';
import 'package:my_first_flutter_app/Notification.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_first_flutter_app/Login_screen.dart';
// import 'package:provider/provider.dart';
// import 'package:my_first_flutter_app/Pictures.dart';

class AfterSplash extends StatefulWidget {
   final UserReal _user;
   final LoginStatus _loginStatus;
  AfterSplash(this._user, this._loginStatus);
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  bool _clickedNotification = false;
  List<NotificationDetails> names = [
    NotificationDetails(
        'Noumba Leonard', 'updated his timeline and many people are liking it'),
    NotificationDetails(
        'Chiatial Calson', 'updated his timeline and many people are liking it'),
    NotificationDetails(
        'Cute Stephany', 'updated his timeline and many people are liking it'),
    NotificationDetails(
        'Cute Stephany', 'updated his timeline and many people are liking it'),
  ];

  LoginStatus _loginStatus;
  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      // ignore: deprecated_member_use
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
      print('logged Out');
    });
  }

  Widget popUpNotifications() {
    return PopupMenuButton(
        icon: new Stack(
          children: [
            new Icon(
              _clickedNotification == false
                  ? Icons.notifications
                  : Icons.notifications_active,
              color: Colors.white,
            ),
            new Positioned(
              right: -1,
                top: 0,
                child: new Container(
                  width: 18.0,
                  height: 18.0,
                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(14.0)
                  ),
                  constraints: BoxConstraints(
                    maxHeight: 14.0,
                    maxWidth: 14.0,
                  ),
                  child: new Text(
                    names.length.toString(),
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
        offset: Offset.fromDirection(0.0, 100),
        itemBuilder: (context) {
          List<PopupMenuEntry<dynamic>> menuItem = [];
          for (var i = 0; i < names.length; i++) {
            menuItem.add(PopupMenuItem(
                child: Row(
                  children: [
                  new Container(
                    child: new Image(
                    image: new ExactAssetImage('asset/pic2.jpg'),
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                  SizedBox(
                    width: 5.0,
                  ),
                  new Expanded(
                    child: new Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Align(
                          alignment:Alignment.topLeft ,
                          child: new Text(names[i].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          //width: 150,
                          child: new Text(names[i].notedetails,
                            maxLines: 1,
                            softWrap: true,
                            textWidthBasis: TextWidthBasis.longestLine,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                ),
                ],
              )));
            menuItem.add(
              const PopupMenuDivider()
            );
          }
          return menuItem;
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginStatus = widget._loginStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        actions: [
          popUpNotifications(),
        ],
        backgroundColor: Colors.grey[800],
        title: Text('Menu Items'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Container(
        color: Colors.transparent,
        width: 220,
        height: 560,
        child: Drawer(
          child: Container(
            color: Colors.grey[400],
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DrawerHeader(
                    padding: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 35.0,
                            color: Colors.grey[800],
                          ),
                          radius: 30.0,
                        ),
                        Text(
                          widget._user.username,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 11,
                          ),
                          Icon(
                            Icons.person_pin,
                            color: Colors.lightBlue[900],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Icon(
                            Icons.people,
                            color: Colors.lightBlue[900],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/ninja');
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0.0, 0.0, 75.0, 0.0)),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              minimumSize: MaterialStateProperty.all(Size(170.0, 30.0))
                            ),
                            child: Container(child: Text('Profile'))),
                        // ignore: deprecated_member_use
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/about');
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 0.0)),
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                minimumSize: MaterialStateProperty.all(Size(170.0, 30.0))
                            ),
                            child: Container(child: Text('About'))),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 5.0,
                  thickness: 3.0,
                  indent: 10,
                  endIndent: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Icon(
                            Icons.help,
                            color: Colors.lightBlue[900],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      children: [
                        // ignore: deprecated_member_use
                        FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 85.0, 0.0),
                            color: Colors.transparent,
                            minWidth: 170.0,
                            highlightColor: Colors.transparent,
                            child: Container(child: Text('Help'))),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Icon(
                            Icons.feedback,
                            color: Colors.lightBlue[900],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FeedbackPage()));
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(0.0, 0.0, 57.0, 0.0)),
                                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                                minimumSize: MaterialStateProperty.all(Size(170.0, 30.0))
                            ),
                            child: Container(child: Text('Feedback'))),
                      ],
                    ),
                  ],
                ),

                ListTile(
                  tileColor: Colors.deepOrange[900],
                  contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 105.0, 0.0),
                  onTap: (){
                    if(_loginStatus == LoginStatus.SignInAsGuest){
                      print('SignOut Guest');
                      setState(() {
                        _loginStatus = LoginStatus.notSignIn;
                      });
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    }else {
                      print('SignOut Real User');
                      signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
                    }
                  },
                  leading:
                      Icon(
                        Icons.logout,
                        color: Colors.lightBlue[900],
                      ),
                  trailing: Container(child: Text('SignOut',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white70
                  ),)),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
        color: Colors.transparent,
        child: Center(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1.0, style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstTask()));
                    },
                    child: Text('Simple Form'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey[800])
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DataTablePage()));
                    },
                    child: Text('Data Table'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[700])
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0)),
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => NamesJson()));
                    },
                    child: Text('Json Data'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[600])
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage()));
                    },
                    child: Text('Take Photo'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey[500],)
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GeoLocation()));
                    },
                    child: Text('Location'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[400],)
                    ),

                  )),
              Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.none,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(0.0)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CovidTracker()));
                    },
                    child: Text('Covid-19 Tracker'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[700])
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
