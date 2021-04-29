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
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    elevation: MaterialStateProperty.all(0.0)
                  ),
                  child: Text('Register',
                  style: TextStyle(
                    color: Colors.orange,
                  ),),

                ),
              ),
              Container(
                color: Colors.transparent,
                width: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(8.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0.0)
                  ),
                  child: Text('Login',
                  style: TextStyle(
                    color: Colors.orange,
                  ),),
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
