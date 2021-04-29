import 'dart:ui';

import 'package:flutter/cupertino.dart';
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
        builder: (context, photos) {
          if (photos.hasData) {
            return new GridView.builder(
                itemCount: photos.data.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150.0,
                ),
                itemBuilder: (context, index) {
                  var image = File(photos.data[index].photoName);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HeroDestination(image)));
                    },
                    child: Hero(tag: 'photoHero' + image.toString(), child: new ImageItem(image)),
                  );
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
      padding: const EdgeInsets.all(1.0),
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

class HeroDestination extends StatelessWidget {
  final File photoName;
  HeroDestination(this.photoName);
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.transparent,
          leading: CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            padding: EdgeInsets.only(bottom: 4.0),
            child: Icon(CupertinoIcons.back),
          ),
          middle: Text('Hero Destination'),
          trailing: CupertinoButton(
            onPressed: () {},
            padding: EdgeInsets.only(bottom: 4.0),
            child: Icon(CupertinoIcons.settings),
          ),
        ),
        child: Center(
          child: Hero(
            tag: 'photoHero' + photoName.toString(),
            child: Container(
              padding: EdgeInsets.all(0.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.file(
                photoName,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
