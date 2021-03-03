import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/Friends.dart';
import 'package:my_first_flutter_app/About.dart';
import 'package:my_first_flutter_app/AddFriendForm.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
import 'package:my_first_flutter_app/AddProductForm.dart';

void main() => runApp(MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => ProductList(),
        '/ninja': (context) => NinjaID(),
        '/friends': (context) => FriendsPage(),
        '/about': (context) => AboutUs(),
        '/add_friend': (context) => AddFriend(),
        '/add_product': (context) => AddProduct(),
      },
    ));

class NinjaID extends StatefulWidget {
  @override
  _NinjaIDState createState() => _NinjaIDState();
}

class _NinjaIDState extends State<NinjaID> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: <Widget>[],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.0,
            ),
            Text('Ninja ID Card'),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white38,
        elevation: 0.0,
      ),
      drawer: Container(
        color: Colors.transparent,
        width: 225,
        height: 550,
        /*decoration: BoxDecoration(
          color: Colors.transparent,

          backgroundBlendMode: BlendMode.screen,
        ),*/
        padding: const EdgeInsets.all(8.0),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Icon(
                        Icons.person,
                        size: 35.0,
                      ),
                      radius: 30.0,
                    ),
                    Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Row(
                  children: [
                    Icon(
                      Icons.person_pin,
                      color: Colors.lightBlue,
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/ninja');
                        },
                        color: Colors.white,
                        minWidth: 150.0,
                        highlightColor: Colors.blue,
                        child: Text('Profile')),
                  ],
                ),
              ),
              ListTile(
                leading: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/friends');
                    },
                    color: Colors.grey[200],
                    minWidth: 150.0,
                    highlightColor: Colors.blue,
                    child: Text('Friends')),
              ),
              ListTile(
                leading: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/about');
                    },
                    color: Colors.grey[200],
                    minWidth: 150.0,
                    highlightColor: Colors.blue,
                    child: Text('About Us')),
              ),
              ListTile(
                leading: FlatButton(
                    onPressed: () {},
                    color: Colors.grey[200],
                    minWidth: 150.0,
                    highlightColor: Colors.blue,
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              ninjaLevel += 1;
            });
          },
          tooltip: 'Add',
          child: Icon(
            Icons.add,
            color: Colors.blueGrey,
          ),
          backgroundColor: Colors.grey[800],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('asset/pic2.jpg'),
                  radius: 80.0,
                ),
              ),
              Divider(
                height: 50.0,
                color: Colors.amber[600],
              ),
              Text(
                'NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Leonard Vinci',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 26.0,
              ),
              Text(
                'Current Ninja Level',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                '$ninjaLevel',
                style: TextStyle(
                  color: Colors.amberAccent[200],
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'n.leonardeinstein"gmail.com',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'See List of Item',
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 18.9,
                    letterSpacing: 1.2),
              ),
              SizedBox(
                height: 15,
              ),
              /*FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, '');
                  },
                  child: Text('Items list'))*/
            ],
          ),
        ),
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  Future<List<ProductCard>> products;

  int id;
  String name;
  String description;
  int price;
  String image;

  SQLiteDbProvider dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    dbHelper = SQLiteDbProvider();
    products = refreshProductList();
  }

  refreshProductList() {
    setState(() {
      products = dbHelper.getAllProducts();
    });
  }

  _refreshAfterAdd() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _refreshAfterAdd();
              }),
        ],
        backgroundColor: Colors.blue[900],
        title: Text('Product List'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Container(
        color: Colors.blue,
        width: 220,
        height: 560,
        /*decoration: BoxDecoration(
          color: Colors.transparent,

          backgroundBlendMode: BlendMode.screen,
        ),*/

        child: Drawer(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DrawerHeader(
                  padding: EdgeInsets.fromLTRB(25.0, 40.0, 25.0, 10.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 35.0,
                        ),
                        radius: 30.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Icon(
                          Icons.person_pin,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Icon(
                          Icons.people,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Icon(
                          Icons.description,
                          color: Colors.lightBlue,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.mail,
                          color: Colors.lightBlue,
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
                      OutlineButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/ninja');
                          },
                          color: Colors.white,
                          /*minWidth: 170.0,*/
                          borderSide: BorderSide(),
                          highlightColor: Colors.transparent,
                          child: Text('Profile')),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/friends');
                          },
                          color: Colors.white,
                          minWidth: 170.0,
                          highlightColor: Colors.blue,
                          child: Text('Friends')),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/about');
                          },
                          color: Colors.white,
                          minWidth: 170.0,
                          highlightColor: Colors.blue,
                          child: Text('About')),
                      FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '');
                          },
                          color: Colors.white,
                          minWidth: 170.0,
                          highlightColor: Colors.blue,
                          child: Text('Contact us')),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_product');
        },
        backgroundColor: Colors.pink,
        child: Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
      body: new Container(
          padding: new EdgeInsets.all(16.0),
          child: new FutureBuilder<List<ProductCard>>(
            future: dbHelper.getAllProducts(),
            builder: (context, products) {
              if (products.hasData) {
                return new ListView.builder(
                    itemCount: products.data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductPage(
                                        products.data[index].name,
                                        products.data[index].description,
                                        products.data[index].price,
                                        products.data[index].image)));
                          },
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new Container(
                                  child: new Image(
                                    image: new ExactAssetImage(
                                        'asset/' + products.data[index].image),
                                    height: 120,
                                    width: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                new Expanded(
                                  child: new Container(
                                    color: Colors.white38,
                                    padding: EdgeInsets.all(5.0),
                                    child: new Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 5.0, 0.0, 5.0),
                                          width: 150,
                                          child: new Text(
                                            products.data[index].name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          width: 150,
                                          child: new Text(
                                            products.data[index].description,
                                            maxLines: 4,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.0,
                                        ),
                                        new Text(
                                          'Price: ' +
                                              products.data[index].price
                                                  .toString(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              30.0, 0.0, 0.0, 0.0),
                                          child: new RatingBox(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                /*new Text(snapshot.data[index].name,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 18.0)),
                                new Text(snapshot.data[index].description,
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 18.0))*/
                                new Divider()
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return new Container(
                alignment: AlignmentDirectional.center,
                child: new CircularProgressIndicator(),
              );
            },
          )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class MyAnimatedWidget extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  MyAnimatedWidget({this.animation, this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) => Container(
                child: Opacity(
                  opacity: animation.value,
                  child: child,
                ),
              ),
          child: child),
    );
  }
}

class ProductCard {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;

  static final columns = ["id", "name", "description", "price", "image"];
  ProductCard(this.id, this.name, this.description, this.price, this.image);

  factory ProductCard.fromMap(Map<String, dynamic> data) {
    return ProductCard(
      data['id'],
      data['name'],
      data['description'],
      data['price'],
      data['image'],
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'image': image,
      };

  /*@override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: 140,
      color: Colors.tealAccent,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProductPage(id, name, description, price, image)));
        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: AssetImage('asset/' + this.image),
                width: 100.0,
                height: 100.0,
              ),
              Expanded(
                child: Container(
                  color: Colors.white38,
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        this.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(this.description),
                      Text('Price:' + this.price.toString()),
                      RatingBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}

/*class MyPopUP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Drawer',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
      body: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  color: Colors.grey[200],
                  minWidth: 150.0,
                  highlightColor: Colors.blue,
                  child: Text('Home')),
            ),
            ListTile(
              leading: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  color: Colors.grey[200],
                  minWidth: 150.0,
                  highlightColor: Colors.blue,
                  child: Text('Friends')),
            ),
            ListTile(
              leading: FlatButton(
                  onPressed: () {},
                  color: Colors.grey[200],
                  minWidth: 150.0,
                  highlightColor: Colors.blue,
                  child: Text('About ')),
            ),
            ListTile(
              leading: FlatButton(
                  onPressed: () {},
                  color: Colors.grey[200],
                  minWidth: 150.0,
                  highlightColor: Colors.blue,
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                  )),
            ),
            ListTile(
              leading: FlatButton(
                  onPressed: () {},
                  color: Colors.grey[200],
                  minWidth: 150.0,
                  highlightColor: Colors.blue,
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                  )),
            ),
            ListTile(
              leading: FlatButton(
                  onPressed: () {},
                  color: Colors.grey[200],
                  minWidth: 150.0,
                  highlightColor: Colors.blue,
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: MyPopUP(),
          scrollable: true,
          contentPadding: EdgeInsets.zero,
        );
      });
}*/

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void setStateAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void setStateAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void setStateAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 20,
          child: IconButton(
            icon: (_rating >= 1
                ? Icon(
                    Icons.star,
                    size: 20,
                  )
                : Icon(
                    Icons.star_border,
                    size: 20,
                  )),
            onPressed: setStateAsOne,
            color: Colors.red,
            iconSize: 20,
          ),
        ),
        Container(
          width: 20,
          child: IconButton(
            icon: (_rating >= 2
                ? Icon(
                    Icons.star,
                    size: 20,
                  )
                : Icon(
                    Icons.star_border,
                    size: 20,
                  )),
            onPressed: setStateAsTwo,
            color: Colors.red,
            iconSize: 20,
          ),
        ),
        Container(
          width: 20,
          child: IconButton(
            icon: (_rating >= 3
                ? Icon(
                    Icons.star,
                    size: 20,
                  )
                : Icon(
                    Icons.star_border,
                    size: 20,
                  )),
            onPressed: setStateAsThree,
            color: Colors.red,
            iconSize: 20,
          ),
        ),
      ],
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage(this.name, this.description, this.price, this.image);
  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        children: <Widget>[
          Image(
            image: AssetImage(
              'asset/' + this.image,
            ),
            height: 320,
            width: 350,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
               /*mainAxisAlignment: MainAxisAlignment.start,*/
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 5.0,),
                Divider(
                  height: 10,
                  color: Colors.green,
                  indent: 10,
                  endIndent: 10,
                  thickness: 2,
                ),
                SizedBox(height: 5.0,),
                Text(
                  this.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(this.description),
                SizedBox(
                  height: 10,
                ),
                Text('Price: ' + this.price.toString()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200.0, 30.0, 0.0, 0.0),
                  child: RatingBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*
FadeTransition(
            child: ProductCard(
              id: 2,
              name: 'Iphone 12',
              description: 'Best and latest Iphone available',
              price: 800,
              image: 'phone.png',
            ),
            opacity: animation,
          ),
          MyAnimatedWidget(
            child: ProductCard(
              id: 2,
              name: 'Itel A56',
              description: 'Powerful brand from the itel group',
              price: 200,
              image: 'pic1.jpg',
            ),
            animation: animation,
          ),
          ProductCard(
            id: 2,
            name: 'Iphone 11Pro',
            description: 'Second brand of iPhone 11',
            price: 600,
            image: 'pic2.jpg',
          ),
          ProductCard(
            id: 2,
            name: 'Infinix Hot9',
            description: 'Best and latest Infinix phone available',
            price: 350,
            image: 'phone.png',
          ),
          ProductCard(
            id: 2,
            name: 'Galaxy S9',
            description: 'Best and latest Samsung available',
            price: 700,
            image: 'phone.png',
          ),
          ProductCard(
            id: 2,
            name: 'Note 10',
            description: 'Best and latest Galaxy Note available',
            price: 700,
            image: 'phone.png',
          )
 */
