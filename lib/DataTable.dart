import 'package:flutter/material.dart';

class DataTablePage extends StatefulWidget {
  @override
  _DataTablePageState createState() => _DataTablePageState();
}

class _DataTablePageState extends State<DataTablePage> {

  List<String> locations = ['Douala', 'Buea', 'Yaounde', 'Bamenda', 'Bamenda', 'Douala' ];
  List<int> amounts = [01, 12, 10, 8, 15, 16];
  int total = 0 ;
  int add(){
    //amounts.forEach((element) {total = total + element;});
    for(int n = 0; n < amounts.length; n++){
      total = total + amounts[n];
    }
    return total;
  }

  Widget secondDesignedTable(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
      child: ListView(
        children: [
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('SN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]
                  ),)),
              ),
              Expanded(
                child: Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        width: 1.0,
                        style: BorderStyle.solid,
                      )),
                  child: Center(child: Text('Location',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]
                    ),)),
                ),
              ),
              Container(
                height: 35.0,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('Amount',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]
                  ),)),
              )
            ],
          ),
          ListView.builder(
            itemCount: locations.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
              return new Row(
                children: <Widget>[
                  new Container(
                    height: 35.0,
                    width: 35.0,
                    decoration: new BoxDecoration(
                        border: new Border.all(
                          width: 0.5,
                          style: BorderStyle.solid,
                        )),
                    child: new Center(child: new Text((index + 1).toString(),)),
                  ),
                  new Expanded(child: new Container(
                    height: 35.0,
                    //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 64),

                    decoration: new BoxDecoration(
                        border: new Border.all(
                          width: 0.5,
                          style: BorderStyle.solid,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 65),
                      child: new Align(alignment: Alignment.centerLeft,
                          child: new Text(locations[index],)),
                    ),
                  ),),
                  new Container(
                    height: 35.0,
                    width: 80,
                    //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: new BoxDecoration(
                        border: new Border.all(
                          width: 0.5,
                          style: BorderStyle.solid,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: new Align(alignment: Alignment.center,
                          child: new Text(amounts[index].toString(),)),
                    ),
                  ),
                ],
              );
              }),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        width: 1.0,
                        style: BorderStyle.solid,
                      )),
                  child: Align(alignment: Alignment.centerLeft,
                      child: Text('Total:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]
                    ),)),
                ),
              ),
              Container(
                height: 35.0,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                      width: 1.0,
                      style: BorderStyle.solid,
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(alignment: Alignment.center,
                      child: Text(add().toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]
                    ),)),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }

  Widget designedTable() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5.0),
      child: ListView(
        /*mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,*/
        children: [
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                    border: Border.all(
                  width: 1.0,
                  style: BorderStyle.solid,
                )),
                child: Center(child: Text('SN',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800]
                  ),)),
              ),
              Expanded(
                child: Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                    width: 1.0,
                    style: BorderStyle.solid,
                  )),
                  child: Center(child: Text('Location',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800]
                    ),)),
                ),
              ),
              Container(
                height: 35.0,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(
                  width: 1.0,
                  style: BorderStyle.solid,
                )),
                child: Center(child: Text('Amount',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]
                ),)),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('1',)),
              ),
              Expanded(child: Container(
                height: 35.0,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 64),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('Douala',),
              ),),
              Container(
                height: 35.0,
                width: 80,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('01',),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('2',)),
              ),
              Expanded(child: Container(
                height: 35.0,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 64),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('Buea',),
              ),),
              Container(
                height: 35.0,
                width: 80,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('10',),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('3',)),
              ),
              Expanded(child: Container(
                height: 35.0,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 64),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('Yaounde',),
              ),),
              Container(
                height: 35.0,
                width: 80,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('12',),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('4',)),
              ),
              Expanded(child: Container(
                height: 35.0,
                //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 64),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('Bamenda',)),
              ),),
              Container(
                height: 35.0,
                width: 80,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('8',),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('5',)),
              ),
              Expanded(child: Container(
                height: 35.0,
                //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 64),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('Bamenda',)),
              ),),
              Container(
                height: 35.0,
                width: 80,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('8',),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('6',)),
              ),
              Expanded(child: Container(
                height: 35.0,
                //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 64),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Center(child: Text('Bamenda',
                softWrap: true,)),
              ),),
              Container(
                height: 35.0,
                width: 80,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      style: BorderStyle.solid,
                    )),
                child: Text('8',),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Table'),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.grey[800],
        ),
        body: secondDesignedTable()
        /*Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: SingleChildScrollView(
          child: DataTable(columns: <DataColumn>[
            DataColumn(label: Text('SN')),
            DataColumn(label: Text('Location')),
            DataColumn(label: Text('Amount')),
          ],

              rows: <DataRow>[
                DataRow(cells: <DataCell>[
                  DataCell(Text('1')),
                  DataCell(Text('Douala')),
                  DataCell(Text('01')),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text('2')),
                  DataCell(Text('Buea')),
                  DataCell(Text('12')),
                ]),
                DataRow(cells: <DataCell>[
                  DataCell(Text('3')),
                  DataCell(Text('Yaounde')),
                  DataCell(Text('10')),
                ]),
              ]),
        ),
      ),*/
        );
  }
}
