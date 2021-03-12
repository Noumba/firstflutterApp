import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:my_first_flutter_app/UserModel.dart';

import 'main.dart';

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
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "description TEXT,"
          "price INTEGER,"
          "image TEXT"
          ")");
      await db.execute("CREATE TABLE Users ("
          "id INTEGER PRIMARY KEY,"
          "username TEXT,"
          "email TEXT,"
          "password TEXT,"
          "phoneNumber TEXT"
          ")");

      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            1,
            "iPhone",
            "iPhone is the stylist phone ever for me",
            1000,
            "phone.png"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            2,
            "Pixel",
            "Pixel is the most feature phone ever",
            800,
            "pic1.jpg"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            3,
            "Laptop",
            "Laptop is most productive development tool",
            2000,
            "pic2.jpg"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            4,
            "Tablet",
            "Laptop is most productive development tool Laptop is most productive development tool",
            1500,
            "phone.png"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            5,
            "Pendrive",
            "Pendrive is useful storage medium",
            100,
            "phone.png"
          ]);

      await db.execute(
          "INSERT INTO Product ('id', 'name', 'description', 'price', 'image') values (?, ?, ?, ?, ?)",
          [
            6,
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
        columns: ProductCard.columns, orderBy: "id DESC");

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

    var maxIdResult =
        await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Product");
    var id = maxIdResult.first["last_inserted_id"];

    var result = await db.rawInsert(
        "INSERT Into Product (id, name, description, price, image)"
        " VALUES (?, ?, ?, ?, ?)",
        [id, product.name, product.description, product.price, product.image]);
    return result;

  }

  update(ProductCard product) async {
    final db = await database;

    var result = await db.update("Product", product.toMap(),
        where: "id = ?", whereArgs: [product.id]);
    return result;
  }

  delete(int id) async {
    final db = await database;

    db.delete("Product", where: "id = ?", whereArgs: [id]);

  }

  //Insert new user into User table
  Future<int> saveUser(User user) async {
    final dbClient = await database;
    int res = await dbClient.insert('Users', user.toMap());
    return res;
  }
  //Delete a user from the Users table
  Future<int> deleteUser(User user) async {
    final dbClient = await database;
    int res = await dbClient.delete('Users');
    return res;
  }

  Future<User> getLogin(String username, String password) async {
    final dbClient = await database;
    var res = await dbClient.rawQuery("SELECT * FROM Users WHERE username = '$username' and password = '$password'");

    if (res.length > 0) {
      return new User.fromMap(res.first);
    }
    return null;
  }

  Future<List<User>> getAllUser() async {
    final dbClient = await database;
    var res = await dbClient.query("Users");

    List<User> list = res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : null ;
    return list;
  }

}
