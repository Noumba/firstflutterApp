import 'package:flutter/material.dart';


class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Friends Page',
            style: TextStyle(),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: (){
          Navigator.pushNamed(context, '/add_friend');

        },
          isExtended: true,
          backgroundColor: Colors.pink,
          label: Text('Add Friend'),
          icon: Icon(Icons.add,
          size: 25,
          color: Colors.white,),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: [
            Container(
              padding: EdgeInsets.all(5.0),
              color: Colors.white,
              child: Container(
                child: Column(children: <Widget>[
                  Container(
                    height: 40,
                    /*margin: EdgeInsets.all(5.0),*/
                    padding: EdgeInsets.all(5.0),
                    color: Colors.blue[50],
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              height: 30,
                              color: Colors.white,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'search friend',
                                  hintStyle: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              )),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            FriendCard(name: 'Numba Emmanuel', image: 'pic1.jpg'),
            FriendCard(name: 'Numba Emmanuel', image: 'pic1.jpg'),
            FriendCard(name: 'Numba Emmanuel', image: 'pic1.jpg'),
            FriendCard(name: 'Numba Emmanuel', image: 'pic1.jpg'),
            FriendCard(name: 'Numba Emmanuel', image: 'pic1.jpg'),
            FriendCard(name: 'Numba Emmanuel', image: 'pic1.jpg'),
            FriendCard(name: 'Numba Emmanuel', image: 'pic1.jpg'),
            FriendCard(name: 'Numba Emmanuel', image: 'pic1.jpg'),
          ],
        ));
  }
}

class FriendCard extends StatelessWidget {
  FriendCard({Key key, this.name, this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: 80,
      color: Colors.tealAccent,
      child: GestureDetector(
        onTap: () {},
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                backgroundImage : AssetImage('asset/' + this.image),
                  radius: 30.0,
                ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                  child: Text(
                this.name,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              )),
              Icon(Icons.more_vert,
              color: Colors.green,),
            ],
          ),
        ),
      ),
    );
  }
}
