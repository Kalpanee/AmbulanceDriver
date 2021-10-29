import 'dart:async';

import 'package:ambulance_tracking/MapBottomPill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//pages
import './about.dart';
import './main.dart';

const LatLng SOURCE_LOCATION = LatLng(7.092086848810781, 80.00039721573887);
const LatLng DEST_LOCATION = LatLng(7.09309, 80.01642);
const double CAMERA_ZOOM = 15;
const double CAMERA_TILT = 60;
const double CAMERA_BEARING = 30;
const double PIN_VISIBLE_POSITION = 20;
const double PIN_INVISIBLE_POSITION = -220;


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  double pinPillPosition = PIN_VISIBLE_POSITION;

  late LatLng currentLocation;
  late LatLng destinationLocation;

  @override
  void initState() {
    super.initState();

    //set up initial location
    this.setInitialLocation();
    //set up marker icons
    this.setSourceAndDestinationMarkerIcons();
  }

  void setSourceAndDestinationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration(devicePixelRatio: 3.0),
      'assets/SourcePin.png'
    );

    destinationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 0.5),
      'assets/DestPin.png'
    );
  }

  void setInitialLocation() {
    currentLocation = LatLng(
      SOURCE_LOCATION.latitude,
      SOURCE_LOCATION.longitude
    );

    destinationLocation = LatLng(
      DEST_LOCATION.latitude,
      DEST_LOCATION.longitude
    );
  }

  @override
  Widget build(BuildContext context) {

    CameraPosition initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("EaseCare"),
        flexibleSpace: Image.asset("assets/med2.jpg",
          fit: BoxFit.cover,),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Hashan Dilhara'),
                accountEmail: Text('dilharahashan1996@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://www.pngarts.com/files/3/Avatar-PNG-Download-Image.png'),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://st4.depositphotos.com/36924814/41459/i/450/depositphotos_414593596-stock-photo-medical-health-red-cross-pattern.jpg'
                    ),
                    fit: BoxFit.cover,
                  ),
                )
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => AboutPage())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => Welcome())
                );
              },
            ),


          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: GoogleMap(
                   myLocationButtonEnabled: true,
                   compassEnabled: false,
                   tiltGesturesEnabled: false,
                   markers: _markers,
                   mapType: MapType.normal,
                   initialCameraPosition: initialCameraPosition,
                   onTap: (LatLng loc){
                     //tapping on map will dismiss bottom pill
                     setState(() {
                       this.pinPillPosition = PIN_INVISIBLE_POSITION;

                     });
                   },
                   onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);

                    showPinsOnMap();
                  }
              )
          ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            bottom: this.pinPillPosition,
            child: MapBottomPill()
          )
        ],
      )
      );

  }
  void showPinsOnMap(){
   setState(() {
     _markers.add(Marker(
         markerId: MarkerId('sourcePin'),
         position: currentLocation,
         icon: sourceIcon
     )
     );

     _markers.add(Marker(
         markerId: MarkerId('destinationPin'),
         position: destinationLocation,
         icon: destinationIcon,
         onTap: () {
           setState(() {
             this.pinPillPosition = PIN_VISIBLE_POSITION;
           });
         }
     )
     );
   });
  }
}
