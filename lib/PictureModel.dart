
import 'dart:io';

import 'package:flutter/cupertino.dart';

class Picture with ChangeNotifier{
  final File picName;
  Picture({@required this.picName});
}