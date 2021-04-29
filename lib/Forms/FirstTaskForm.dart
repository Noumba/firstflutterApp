import 'package:flutter/material.dart';

class FirstTask extends StatefulWidget {
  @override
  _FirstTaskState createState() => _FirstTaskState();
}

enum Sex { Male, Female }

class _FirstTaskState extends State<FirstTask> {
  Sex _groupV = Sex.Male;
  bool _checked1 = false;
  bool _checked2 = false;
  bool _checked3 = false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.18;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Page',
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.transparent,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text('Name',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800])),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, width: 1.0, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Leonard',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text('Email',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800])),
            ),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(7.0)),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'noumba@example.com',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  widthFactor: 9.0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Sex',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                        value: Sex.Male,
                        groupValue: _groupV,
                        onChanged: (Sex value) {
                          setState(() {
                            _groupV = value;
                          });
                        }),
                    Text('Male'),
                    Radio(
                        value: Sex.Female,
                        groupValue: _groupV,
                        onChanged: (Sex value) {
                          setState(() {
                            _groupV = value;
                          });
                        }),
                    Text('FeMale'),
                  ],
                ),
              ],
            ),
            Container(
              child: Column(
                children: [
                  Divider(
                    height: 5.0,
                    thickness: 3.0,
                    indent: 40,
                    endIndent: 40,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Select Favorite Courses',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'sans-serif-light',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('CSC207'),
                          Checkbox(
                              value: _checked1,
                              onChanged: (value) {
                                setState(() {
                                  _checked1 = !_checked1;
                                });
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('CSC407'),
                          Checkbox(
                              value: _checked2,
                              onChanged: (value) {
                                setState(() {
                                  _checked2 = !_checked2;
                                });
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('CSC305'),
                          Checkbox(
                              value: _checked3,
                              onChanged: (value) {
                                setState(() {
                                  _checked3 = !_checked3;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: _width,
              ),
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.black54)),
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
