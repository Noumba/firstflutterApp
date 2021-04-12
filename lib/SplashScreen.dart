import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:my_first_flutter_app/CustomScrollView.dart';
import 'package:my_first_flutter_app/Login_screen.dart';
//import 'package:my_first_flutter_app/AfterSplash.dart';
//import 'package:my_first_flutter_app/Login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashDelay = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadWidget();
  }

  _loadWidget() async{
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        splashColor: Colors.grey[200],
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 7,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('asset/phone.png'),
                          height: 300,
                          width: 300,),
                          Padding(padding: EdgeInsets.only(top: 10)),
                        ],
                      ),
                    )),
                Expanded(child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Container(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Spacer(),
                        Text('Loading'),
                        Spacer(
                          flex: 4,
                        ),
                        Text('android'),
                        Spacer(),
                      ],
                    )
                  ],
                ))
              ],
            )
          ],
        ),
      ),

    );
  }
}
