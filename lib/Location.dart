import 'package:flutter/material.dart';
//import 'package:map_view/map_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocation/geolocation.dart' as geo;

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

const API_KEY = "AIzaSyAxRrQcNbRDLizuykn7McObFrr2MvQ8Sto";

class _GeoLocationState extends State<GeoLocation> {
  // MapView mapView;
  // StaticMapProvider staticMapProvider;
  // Uri imageUri;
  // geo.Location currentLocation;
  // Location selectedLocation;
  GoogleMapController myController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     showMapView();
        //   },
        //   tooltip: "new map",
        //   child: new Icon(Icons.map),
        // ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
                initialCameraPosition:
                    new CameraPosition(target: _center, zoom: 10.0)),
            Padding(padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: (){},
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.green,
                child: const Icon(Icons.map, size: 30.0,),
              ),
            ),)
          ],
        ));
  }
}
