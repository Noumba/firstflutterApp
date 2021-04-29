import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/TakePictureScreen.dart';
import 'package:my_first_flutter_app/ImageScreen.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final List<Map<String, Object>> _pages = [
    {
      'page': TakePicScreen(),
      'title': 'Take Photo',
    },
    {'page': ViewImages(), 'title': 'Your Images'}
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        //backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: _pages[_selectedPageIndex]['title'] == 'Your Images'
            ? Colors.black87
            : Theme.of(context).primaryColor,
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        backgroundColor: _pages[_selectedPageIndex]['title'] == 'Your Images'
            ? Colors.black87
            : Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Camera'),
          BottomNavigationBarItem(
              icon: Icon(Icons.image),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Images'),
        ],
      ),
    );
  }
}
