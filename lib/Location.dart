import 'package:flutter/material.dart';
//import 'package:map_view/map_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

const API_KEY = "AIzaSyAxRrQcNbRDLizuykn7McObFrr2MvQ8Sto";

class _GeoLocationState extends State<GeoLocation> {
  // MapView mapView;
  // StaticMapProvider staticMapProvider;
  // Uri imageUri;
   //geo.Location currentLocation;
   //Location selectedLocation;
  GoogleMapController myController;

  MapType _currentMapType = MapType.normal;

  LatLng _currentMapPosition;
  Position _currentPosition;

  void _setCurrentMapPosition() {
    setState(() {
      _currentMapPosition = LatLng(_currentPosition.latitude, _currentPosition.longitude);
    });
  }

  void _onCameraMove(CameraPosition position){
    _setCurrentMapPosition();
    _currentMapPosition = position.target;
  }

  void getUserLocation() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _currentPosition = position;
      _setCurrentMapPosition();
      print('${placemark[0].name}');
    });
  }



  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  final Set<Marker> _marker = {};

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  void _onAddMarkerButtonPressed(){
    setState(() {
      _marker.add(Marker(markerId: MarkerId(_currentMapPosition.toString()),
      position: _currentMapPosition,
      infoWindow: InfoWindow(
        title: 'Nice Place'
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet)));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserLocation();
    setState(() {

    });
    // MapView.setApiKey(API_KEY);
    // mapView = new MapView();
    // staticMapProvider = new StaticMapProvider(API_KEY);
    // imageUri = staticMapProvider.getStaticUri(Locations.portland, 14);
    // setCurrentLocation();
  }

  //This method sets selectedLocation to current location
  // Future<void> setCurrentLocation() async {
  //   geo.Geolocation.currentLocation(accuracy: geo.LocationAccuracy.best)
  //       .listen((event) {
  //     if (event.isSuccessful) {
  //       print('result is $event');
  //       setState(() {
  //         currentLocation = event.location;
  //       });
  //     }
  //   });
  // }

  //This method shows the map view
  // void showMapView() {
  //   mapView.show(
  //       new MapOptions(
  //           mapViewType: MapViewType.normal,
  //           showUserLocation: true,
  //           initialCameraPosition: new CameraPosition(
  //               //if user hasn't selected a location, we show current location and vice versa
  //               selectedLocation != null
  //                   ? new Location(
  //                       selectedLocation.latitude, selectedLocation.longitude)
  //                   : new Location(
  //                       currentLocation.latitude, currentLocation.longitude),
  //               14),
  //           title: "Your Location"),
  //       toolbarActions: [
  //         new ToolbarAction("Close", 1),
  //         new ToolbarAction("Confirm", 2)
  //       ]);
  //   mapView.onMapReady.listen((Null _) {
  //     if (selectedLocation != null) {
  //       mapView.setMarkers([
  //         new Marker("1", "selected", selectedLocation.latitude,
  //             selectedLocation.longitude)
  //       ]);
  //     } else {
  //       mapView.setMarkers([
  //         new Marker("1", "current", currentLocation.latitude,
  //             currentLocation.longitude)
  //       ]);
  //     }
  //   });
  //   mapView.onToolbarAction.listen((id) {
  //     if (id == 1) {
  //       mapView.dismiss();
  //     } else if (id == 2) {
  //       print("len is: " + mapView.markers.length.toString());
  //       if (mapView.markers.isNotEmpty) {
  //         setState(() {
  //           imageUri =
  //               staticMapProvider.getStaticUriWithMarkers(mapView.markers);
  //           selectedLocation = Location(
  //               mapView.markers[0].latitude, mapView.markers[0].longitude);
  //         });
  //         mapView.dismiss();
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Location'),
          backgroundColor: Colors.grey[800],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     showMapView();
        //   },
        //   tooltip: "new map",
        //   child: new Icon(Icons.map),
        // ),
        body: Container(
          child:
          _currentMapPosition != null ?
          Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                compassEnabled: true,
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: _currentMapPosition, zoom: 10.0),
                mapType: _currentMapType,
                markers: _marker,
                onCameraMove: _onCameraMove,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    onPressed: () {
                      _onMapTypeButtonPressed();
                      _onAddMarkerButtonPressed();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    backgroundColor: Colors.green,
                    child: const Icon(
                      Icons.map,
                      size: 30.0,
                    ),
                  ),
                ),
              )
            ],
          )
          :
          Center(child: CircularProgressIndicator()),
        ));
  }
}
