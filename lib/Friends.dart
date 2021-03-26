import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Desktop/firstflutterApp/lib/Forms/AddFriendForm.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
import 'file:///C:/Users/user/Desktop/firstflutterApp/lib/Models/FriendsModel.dart';

class FriendsPage extends StatefulWidget {
  final int uid;
  FriendsPage(this.uid);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>
    with SingleTickerProviderStateMixin{
  Future<List<Friend>> friends;
  bool isSearching = false;
  SQLiteDbProvider dbHelper;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = SQLiteDbProvider();
    friends = refreshFriendsList();
    refreshAfterAdd();
  }

  refreshFriendsList() {
    friends = dbHelper.getAllFriendsSpecificToUser(widget.uid);
    setState(() {

    });
  }

  refreshAfterAdd(){
    setState(() {

    });
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFriend(widget.uid)));
        },
        isExtended: true,
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
      body: new Container(
        margin: new EdgeInsets.symmetric(horizontal: 20),
        color: Colors.grey[200],

        child: /*Column(
          children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black87,
                      width: 1.0,
                      style: BorderStyle.solid
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                            ),
                          )),
                      GestureDetector(
                        onTap: (){
                          isSearching = true;
                          setState(() {

                          });
                        },
                          child: Icon(Icons.search),
                      ),]),

                ),*/
              new FutureBuilder<List<Friend>>(
              future: dbHelper.getAllFriendsSpecificToUser(widget.uid),
              builder: (context, friends) {
                if (friends.hasData) {
                  return new ListView.builder(
                      itemCount: friends.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return new Container(
                          padding: EdgeInsets.all(1.0),
                          height: 80,
                          color: Colors.white38,
                          child: new GestureDetector(
                            onTap: () {},
                            child: new Card(
                              margin: new EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                              shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34),
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  SizedBox(
                                    width: 3.0,
                                  ),
                                  new CircleAvatar(
                                    backgroundImage: new AssetImage('asset/' + friends.data[index].image),
                                    radius: 30.0,
                                  ),
                                  new SizedBox(
                                    width: 8.0,
                                  ),
                                  new Expanded(
                                    child: new Text(
                                      friends.data[index].name,
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  new Icon(
                                    Icons.more_vert,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                }
                return new Center(
                  child: new CircularProgressIndicator(),
                );
              },
              ),
         /* ],
        ),*/
      ),
    );
  }
}

// class FriendCard extends StatelessWidget {
//   FriendCard({Key key, this.name, this.image});
//
//   final String name;
//   final String image;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.zero,
//       height: 80,
//       color: Colors.tealAccent,
//       child: GestureDetector(
//         onTap: () {},
//         child: Card(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               CircleAvatar(
//                 backgroundImage: AssetImage('asset/' + this.image),
//                 radius: 30.0,
//               ),
//               SizedBox(
//                 width: 8.0,
//               ),
//               Expanded(
//                   child: Text(
//                 this.name,
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 18,
//                 ),
//               )),
//               Icon(
//                 Icons.more_vert,
//                 color: Colors.green,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
