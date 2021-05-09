import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
import 'package:my_first_flutter_app/Photo.dart';
//import 'package:my_first_flutter_app/PictureModel.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as pPath;
// import 'package:provider/provider.dart';
// import 'package:my_first_flutter_app/Pictures.dart';


class TakePicScreen extends StatefulWidget {
  @override
  _TakePicScreenState createState() => _TakePicScreenState();
}

class _TakePicScreenState extends State<TakePicScreen> {

  SQLiteDbProvider dbHelper = SQLiteDbProvider();

  File _takenImage;

  Future<void> _takePicture() async{
    final imageFile = await ImagePicker().getImage(source: ImageSource.camera);
    if(imageFile == null){
      return 'No picks';
  }
    setState(() {
      _takenImage = File(imageFile.path);
      print(_takenImage);
    });
    final appDir = await pPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await _takenImage.copy('${appDir.path}/$fileName');
    final dbSavedImage = savedImage.path;
    //final db = FileImage(File(dbSavedImage));

    //var imageToStore = Picture(picName: savedImage);
    var imageToStoreInDB = Photo(dbSavedImage);
    dbHelper.insertPhoto(imageToStoreInDB);

    // _storeImage(){
    //   Provider.of<Pictures>(context, listen: false).storeImage(imageToStore);
    // }
    //
    // _storeImage();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton.icon(onPressed: _takePicture,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white70),
              elevation: MaterialStateProperty.all(0.0),
            ),
            icon: Icon(Icons.photo_camera, size: 100, color: Colors.blue,),
            label: Text('')),
      ),
    );
  }
}
