
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Desktop/firstflutterApp/lib/Forms/FirstTaskForm.dart';


class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
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
                        Text('Name',
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
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/ninja');
                            },
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 75.0, 0.0),
                            color: Colors.transparent,
                            minWidth: 170.0,
                            highlightColor: Colors.transparent,
                            child: Container(child: Text('Profile'))),

                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/about');
                            },
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 80.0, 0.0),
                            color: Colors.transparent,
                            minWidth: 170.0,
                            highlightColor: Colors.blue,
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
                child: RaisedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FirstTask()));
                }, child: Text('Menu Item1'),
                  color: Colors.grey[500],)
              ),
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
                child: RaisedButton(onPressed: (){}, child: Text('Menu Item2'),
                color: Colors.grey[400],)
              ),
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
                  child: RaisedButton(onPressed: (){}, child: Text('Menu Item3'),
                    color: Colors.grey[300],)
              ),
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
                  child: RaisedButton(onPressed: (){}, child: Text('Menu Item4'),
                    color: Colors.grey[200],)
              ),

            ],
          ),
        ),
      ),
    );
  }
}
