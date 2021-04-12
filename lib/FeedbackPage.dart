import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width * 0.2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20.0,),
            Center(child: Text('Give us your feedback Here',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.grey[700]
            ),)),
            SizedBox(height: 20.0,),
            TextFormField(
              controller: _descriptionController,
              minLines: 5,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                labelText: 'Feedback',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      style: BorderStyle.solid, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusColor: Colors.grey,
                hoverColor: Colors.grey,
                helperMaxLines: 10,
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Feedback is required';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _width,),
              height: 40,
              child: RaisedButton(
                onPressed: (){},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                color: Colors.black54,
                child: Text('Send',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ),),

              ),
            ),
          ],
        ),

      ),
    );
  }
}
