import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/DbHelper.dart';
//import 'package:provider/provider.dart';
import 'package:my_first_flutter_app/Photo.dart';
//import 'package:my_first_flutter_app/PictureModel.dart';
import 'dart:io';

class ViewImages extends StatefulWidget {
  @override
  _ViewImagesState createState() => _ViewImagesState();
}

class _ViewImagesState extends State<ViewImages> {

  SQLiteDbProvider dbHelper;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = SQLiteDbProvider();
  }
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List<Photo>>(
      future: dbHelper.getAllPhotos(),
        builder: (context, photos){
          if(photos.hasData){
            return new GridView.builder(
                itemCount: photos.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index){
                  var image = File(photos.data[index].photoName);
                  return new ImageItem(image);
                });
          }
          return new Container(
            alignment: AlignmentDirectional.center,
            child: new CircularProgressIndicator(),
          );
        });
  }
}


// class ViewImages extends StatefulWidget {
//   @override
//   _ViewImagesState createState() => _ViewImagesState();
// }
//
// class _ViewImagesState extends State<ViewImages> {
//   @override
//   Widget build(BuildContext context) {
//     final imagesData = Provider.of<Pictures>(context);
//     final images = imagesData.pics;
//     return GridView.builder(
//         shrinkWrap: true,
//         itemCount: images.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemBuilder: (context, index) => ChangeNotifierProvider.value(
//             value: images[index],
//             child: images.isEmpty ? Text('Add Some Images') : ImageItem()));
//   }
// }

class ImageItem extends StatelessWidget {
  final File photoName;
  ImageItem(this.photoName);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: const [BoxShadow(blurRadius: 10)]),
        margin: EdgeInsets.only(bottom: 5.0),
        height: 250,
        width: 250,
        child: Image.file(
          photoName,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
