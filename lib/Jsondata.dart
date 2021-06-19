import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:my_first_flutter_app/JsonModel.dart';
import 'package:my_first_flutter_app/namesjson.dart';
import 'dart:convert';
import 'dart:async';
//import 'package:flutter/foundation.dart';

class NamesJson extends StatefulWidget {
  @override
  _NamesJsonState createState() => _NamesJsonState();
}

class _NamesJsonState extends State<NamesJson> {
  // A function that converts a response body into a List<Photo>.
  List<Employees> parseEmployees(String responseBody) {
    //final parsed = json.decode(responseBody);
    // Map parsed = jsonDecode(responseBody);
    // var names = Employees.fromJson(json)
    // return parsed;
    //return parsed.map<Employees>((json) => Employees.fromJson(json)).toList();
    //return List<Employees>.from(parsed["response"].map((json) =>Employees.fromJson(json)) );
    Map<String, dynamic> parsed = jsonDecode(responseBody);
    var names = Names.fromJson(parsed);
    debugPrint(names.employees[0].firstName);
    return names.employees;
  }

  Future<List<Employees>> fetchEmployees(http.Client client) async {
    String url = 'http://192.168.43.217/users.json';
    final response = await client.get(url);
    print(response.body);

    return parseEmployees(response.body);
    // Use the compute function to run parsePhotos in a separate isolate.
    //return compute(parseEmployees, response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEmployees(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Json Data'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        //color: Colors.grey[500],
        //margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(5.0),
        child: FutureBuilder<List<Employees>>(
          future: fetchEmployees(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.grey,
                        child: ListTile(
                          leading: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                snapshot.data[index].firstName,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                          trailing: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                snapshot.data[index].lastName,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
