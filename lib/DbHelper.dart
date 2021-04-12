import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:my_first_flutter_app/UserModel.dart';
import 'package:my_first_flutter_app/RatingModel.dart';
import 'package:my_first_flutter_app/FriendsModel.dart';

import 'main.dart';
import 'package:my_first_flutter_app/Photo.dart';

class SQLiteDbProvider {
 /* SQLiteDbProvider._();

  static final SQLiteDbProvider db = SQLiteDbProvider._();*/

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "ProductDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Product ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "user_id INTEGER,"
          "name TEXT,"
          "description TEXT,"
          "price INTEGER,"
          "image TEXT,"
          "FOREIGN KEY(user_id) REFERENCES Users(id)"
          ")");
      await db.execute("CREATE TABLE Users ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "username TEXT,"
          "email TEXT,"
          "password TEXT,"
          "phoneNumber TEXT"
          ")");
      await db.execute("CREATE TABLE Rating ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "stars INTEGER,"
          "uid INTEGER,"
          "pid INTEGER,"
          "FOREIGN KEY(uid) REFERENCES Users(id),"
          "FOREIGN KEY(pid) REFERENCES Product(id)"
          ")");
      await db.execute("CREATE TABLE Friends ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "uid INTEGER,"
          "name TEXT,"
          "number TEXT,"
          "email TEXT,"
          "image TEXT,"
          "FOREIGN KEY(uid) REFERENCES Users(id)"
          ")");
      await db.execute("CREATE TABLE Photos ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "photoName TEXT"
          ")");

      await db.execute(
          "INSERT INTO Friends ('id', 'uid', 'name', 'number', 'email', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            1,
            1,
            "Carlos",
            "678674772",
            "n.leonardeinstein@gmail.com",
            "pic2.jpg"
          ]);

      await db.execute(
          "INSERT INTO Users ('id', 'username', 'email', 'password', 'phoneNumber') values (?, ?, ?, ?, ?)",
          [
            1,
            "Noumba",
            "n.leonardeinstein@gmail.com",
            "leonardo",
            "678674772"
          ]);

      await db.execute(
          "INSERT INTO Users ('id', 'username', 'email', 'password', 'phoneNumber') values (?, ?, ?, ?, ?)",
          [
            2,
            "Vinci",
            "noumba@gmail.com",
            "leonardo",
            "676765656"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'user_id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            1,
            1,
            "iPhone",
            "iPhone is the stylist phone ever for me",
            1000,
            "phone.png"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'user_id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            2,
            1,
            "Pixel",
            "Pixel is the most feature phone ever",
            800,
            "pic1.jpg"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'user_id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            3,
            1,
            "Laptop",
            "Laptop is most productive development tool",
            2000,
            "pic2.jpg"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'user_id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            4,
            1,
            "Tablet",
            "Laptop is most productive development tool Laptop is most productive development tool",
            1500,
            "phone.png"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'user_id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            5,
            1,
            "Pendrive",
            "Pendrive is useful storage medium",
            100,
            "phone.png"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'user_id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            6,
            1,
            "Floppy Drive",
            "Floppy drive is useful rescue storage medium",
            20,
            "nkolb.jpg"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'user_id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            7,
            2,
            "iPhone",
            "iPhone is the stylist phone ever for me",
            1000,
            "phone.png"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'user_id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?, ?)",
          [
            8,
            2,
            "Floppy Drive",
            "Floppy drive is useful rescue storage medium",
            20,
            "nkolb.jpg"
          ]);
    });

  }

  Future<List<ProductCard>> getAllProducts() async {
    final db = await database;

    List<Map> results = await db.query("Product",
        /*columns: ProductCard.columns,*/ orderBy: "id DESC");

    List<ProductCard> products = new List();
    results.forEach((result) {
      ProductCard product = ProductCard.fromMap(result);
      products.add(product);
    });
    print('All Products are ready');

    return products;
  }

  Future<List<ProductCard>> getAllProductsSpecificToUser(int id) async {
    final db = await database;

    List<Map> results = await db.query("Product", where: "user_id = ?", whereArgs: [id],
        /*columns: ProductCard.columns,*/ orderBy: "id DESC");

  List<ProductCard> products = new List();
  results.forEach((result) {
  ProductCard product = ProductCard.fromMap(result);
  products.add(product);
  });
  print('All Products are ready');

  return products;
}

  Future<ProductCard> getProductById(int id) async {
    final db = await database;

    var result = await db.query("Product", where: "id = ", whereArgs: [id]);

    print(result.toString());
    return result.isNotEmpty ? ProductCard.fromMap(result.first) : Null;

  }

  insert(ProductCard product) async {
    final db = await database;

    /*var maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Product");
    var id = maxIdResult.first["last_inserted_id"];*/

    /*var result = await db.rawInsert(
        "INSERT Into Product (user_id, name, description, price, image)"
        " VALUES (?, ?, ?, ?, ?)",
        [product.user_id, product.name, product.description, product.price, product.image]);*/
    var result = await db.insert('Product', product.toMap());
    print('Product Added Success');
    return result;

  }

  update(ProductCard product, int id) async {
    final db = await database;

    var result = await db.update("Product", product.toMap(),
        where: "id = ?", whereArgs: [id]);
    return result;
  }

  delete(int id) async {
    final db = await database;

    db.delete("Product", where: "id = ?", whereArgs: [id]);

  }

  //Insert new user into User table
  Future<int> saveUser(UserReal user) async {
    final dbClient = await database;
    int res = await dbClient.insert('Users', user.toMap());
    print('Saved successful');
    return res;
  }
  //Delete a user from the Users table
  Future<int> deleteUser(UserReal user) async {
    final dbClient = await database;
    int res = await dbClient.delete('Users');
    return res;
  }

  Future<UserReal> getLogin(String username, String password) async {
    final dbClient = await database;
    var res = await dbClient.rawQuery("SELECT * FROM Users WHERE username = '$username' and password = '$password'");

    if (res.length > 0) {
      return new UserReal.fromMap(res.first);
    }
    return null;
  }

  Future<List<UserReal>> getAllUser() async {
    final dbClient = await database;
    var res = await dbClient.query("Users");

    List<UserReal> list = res.isNotEmpty ? res.map((c) => UserReal.fromMap(c)).toList() : null ;
    print(list);
    return list;
  }

  Future<List<UserReal>> getSpecificUser(String _name, String _password) async {
    final db = await database;
    print(_name);
    /*List<Map> result = await db.query("Users", where: "username = ? and password = ? " , whereArgs: [_name, _password]);*/
    List<Map> result = await db.query("Users", where: "username = ? and password = ? " , whereArgs: [_name, _password]);
      List<UserReal> users = new List();
      result.forEach((result) {
        UserReal user = UserReal.fromMap(result);
        print(user.id);
        users.add(user);
      });
      /*return result.isNotEmpty ? User.fromMap(result.first) : Null;*/
      print(users.first.username);
      return users;

  }

   insertOrAddRating(Rating rating, int uid, int pid) async {
    final db = await database;
    /*List<Map> result = await db.query("Users", where: "username = ? and password = ? " , whereArgs: [_name, _password]);*/
    List<Map> result = await db.query("Rating", where: "uid = ? and pid = ? " , whereArgs: [uid, pid]);
    if(result.isNotEmpty){
      // update rating
       var result = await db.update("Rating", rating.toMap(),
          where: "uid = ? and pid = ?", whereArgs: [rating.uid, rating.pid]);
       print('Update Success');
      return result;
    }else {
      //insert rating
      var result = await db.insert('Rating', rating.toMap());
      print('Rating Added Success');
      return result;
    }

  }

  Future<Rating> getSpecificRating(int uid, int pid) async {
    final db = await database;
    var result = await db.query("Rating", where: "uid = ? and pid = ? " , whereArgs: [uid, pid]);
    Rating rating = new Rating.fromMap(result.first);
    print('specific rating gotten');
    return rating;

  }

  Future<List<Friend>> getAllFriendsSpecificToUser(int id) async {
    final db = await database;

    List<Map> results = await db.query("Friends", where: "uid = ?", whereArgs: [id],
        /*columns: ProductCard.columns,*/ orderBy: "id DESC");

    List<Friend> friends = new List();
    results.forEach((result) {
      Friend friend = Friend.fromMap(result);
      friends.add(friend);
    });
    print('All Products are ready');

    return friends;
  }

  addFriend(Friend friend) async {
    final db = await database;

    var result = await db.insert('Friends', friend.toMap());
    print('Friend Added Success');
    return result;

  }

  insertPhoto(Photo photo) async {
    final db = await database;
    var result = await db.insert('Photos', photo.toMap());
    print('Photo Added Success');
    return result;
  }

  Future<List<Photo>> getAllPhotos() async {
    final db = await database;

    List<Map> results = await db.query("Photos",
        /*columns: ProductCard.columns,*/ orderBy: "id DESC");

    List<Photo> photos = new List();
    results.forEach((result) {
      Photo photo = Photo.fromMap(result);
      photos.add(photo);
    });
    print('All Photos are ready');

    return photos;
  }

}

