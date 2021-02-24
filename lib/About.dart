import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us Page'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Image(
            image: AssetImage('asset/nkolb.jpg'),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.blue,
                  ),
                  onPressed: () {},
                ),
                Icon(
                  Icons.location_on,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.phone,
                  color: Colors.blue,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[300],
            height: 300,
            child: Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'our services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 5.0,
                    color: Colors.grey,
                    thickness: 1.0,
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      'We offer you the best service you can imagine',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.pinkAccent,
                        fontFamily: 'Iowan Old Style',
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            /*padding: EdgeInsets.all(2.0),*/
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('asset/nkolb.jpg'),
                                  height: 70.0,
                                  width: 100.0,
                                ),
                                Text(
                                  'Creative Design',
                                  style: TextStyle(
                                    decorationThickness: 10.0,
                                    fontFamily: 'Serif',
                                    fontSize: 13.0,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'This is our best',
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Divider(
                                  height: 5.0,
                                  color: Colors.pinkAccent,
                                  thickness: 1.0,
                                  indent: 4.0,
                                  endIndent: 4.0,
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  'This is one of our favorite '
                                  'and best designs for an about ',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 10,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  textTheme: ButtonTextTheme.accent,
                                  color: Colors.pink[50],
                                  colorBrightness: Brightness.light,
                                  child: Text(
                                    'Learn more',
                                    style: TextStyle(
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.pink)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('asset/nkolb.jpg'),
                                  height: 70.0,
                                  width: 100.0,
                                ),
                                Text(
                                  'Creative Design',
                                  style: TextStyle(
                                    decorationThickness: 10.0,
                                    fontFamily: 'Serif',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'This is our best',
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Divider(
                                  height: 5.0,
                                  color: Colors.pink,
                                  thickness: 1.0,
                                  indent: 4.0,
                                  endIndent: 4.0,
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  'This is one of our favorite '
                                  'and best designs for an about ',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  textTheme: ButtonTextTheme.accent,
                                  color: Colors.pink[50],
                                  colorBrightness: Brightness.light,
                                  child: Text(
                                    'Learn more',
                                    style: TextStyle(
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.pink)),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage('asset/nkolb.jpg'),
                                  height: 70.0,
                                  width: 100.0,
                                ),
                                Text(
                                  'Creative Design',
                                  style: TextStyle(
                                    decorationThickness: 10.0,
                                    fontFamily: 'Serif',
                                    fontStyle: FontStyle.normal,
                                    fontSize: 13.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'This is our best',
                                  softWrap: true,
                                  style: TextStyle(
                                    color: Colors.pinkAccent,
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Divider(
                                  height: 5.0,
                                  color: Colors.grey,
                                  thickness: 1.0,
                                  indent: 4.0,
                                  endIndent: 4.0,
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  'This is one of our favorite '
                                  'and best designs for an about ',
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 10.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  textTheme: ButtonTextTheme.accent,
                                  color: Colors.pink[50],
                                  colorBrightness: Brightness.light,
                                  child: Text(
                                    'Learn more',
                                    style: TextStyle(
                                      color: Colors.pinkAccent,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.pink)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Text(
                    'about us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  height: 5.0,
                  color: Colors.pink,
                  thickness: 1.0,
                  indent: 40.0,
                  endIndent: 40.0,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Text(
                    'contact to know more about us',
                    style: TextStyle(fontSize: 10.0, color: Colors.lime),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('asset/pic1.jpg'),
                      width: 130,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                    Image(
                      image: AssetImage('asset/pic2.jpg'),
                      width: 130,
                      height: 80,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
