import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome To Vinci'),
        centerTitle: false,
        elevation: 0.0,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.transparent,
                width: 60,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  padding: EdgeInsets.all(0.0),
                  child: Text('Register',
                  style: TextStyle(
                    color: Colors.orange,
                  ),),
                  elevation: 0.0,
                  color: Colors.transparent,

                ),
              ),
              Container(
                color: Colors.transparent,
                width: 60,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  padding: EdgeInsets.all(8.0),
                  child: Text('Login',
                  style: TextStyle(
                    color: Colors.orange,
                  ),),
                  color: Colors.transparent,
                  elevation: 0.0,
                ),
              )
            ],
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.blueGrey[300],
          child: Text(
            'We Welcome You',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
