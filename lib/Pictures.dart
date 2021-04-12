import 'package:flutter/widgets.dart';
import 'package:my_first_flutter_app/PictureModel.dart';

class Pictures with ChangeNotifier{
  List<Picture> _pics = [];
  List<Picture> get pics {
    return _pics;
  }

  storeImage(Picture pickedImage){
    final newImage = Picture(picName: pickedImage.picName);
    _pics.add(newImage);
    notifyListeners();
  }
}