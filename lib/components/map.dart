import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopMaps extends StatefulWidget {
  const ShopMaps({Key? key}) : super(key: key);

  @override
  _ShopMapsState createState() => _ShopMapsState();
}

class _ShopMapsState extends State<ShopMaps> {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);
  static CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 10, tilt: 0, bearing: 0);
  late GoogleMapController _controller;
  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('mapStyle/map_style.json');
    _controller.setMapStyle(value);
  }

  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), 'images/mapIcons/m2.png')
        .then((icon) {
      setState(() {
        markerIcon = icon;
      });
    });
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        markerId: MarkerId("Pets Barn"),
        position: LatLng(19.13902910622346, 72.82586458465644),
        infoWindow: InfoWindow(title: 'Pets Barn'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Air Pets Relocation"),
        position: LatLng(28.528694, 77.086746),
        infoWindow: InfoWindow(title: 'Air Pets Relocation'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Heavy Petting"),
        position: LatLng(12.909888005923161, 77.63836351534354),
        infoWindow: InfoWindow(title: 'Heavy Petting'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Tamed Pets"),
        position: LatLng(12.977240831594784, 80.2221304693129),
        infoWindow: InfoWindow(title: 'Tamed Pets'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Pets Arena"),
        position: LatLng(22.612304163979697, 88.385215),
        infoWindow: InfoWindow(title: 'Pets Arena'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Dogs & Pets"),
        position: LatLng(26.858083022427323, 81.00033369259515),
        infoWindow: InfoWindow(title: 'Dogs & Pets'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Tarzoo Pet Care"),
        position: LatLng(20.256627956210618, 85.82558588465646),
        infoWindow: InfoWindow(title: 'Tarzoo Pet Care'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Pets Life Style"),
        position: LatLng(23.21832981576014, 77.42824961534355),
        infoWindow: InfoWindow(title: 'Pets Life Style'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Aman Dog Kennel"),
        position: LatLng(23.358758871506613, 85.33764307671775),
        infoWindow: InfoWindow(title: 'Aman Dog Kennel'),
        icon: markerIcon,
      ),
      Marker(
        markerId: MarkerId("Pets Paradise"),
        position: LatLng(23.636820501798237, 86.1639867),
        infoWindow: InfoWindow(title: 'Pets Paradise'),
        icon: markerIcon,
      ),
    };
  }

  //
  // BitmapDescriptor _mapMarker;
  //
  // setMapMarker() async{
  // _mapMarker= await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'images/mapIcons/shopMapIcon.png');
  // }
  //
  // @override
  // void initState(){
  //   super.initState();
  //   setMapMarker();
  // }

  @override
  void initState() {
    addCustomIcon();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff223843),
        title: Text('Pet Shops'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _controller
      //       .animateCamera(CameraUpdate.newCameraPosition(_kInitialPosition)),
      //   child: Icon(Icons.center_focus_strong),
      // ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: onMapCreated,
        markers: _createMarker(),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}

class Utils {
  static String mapStyles = '''[
  {
    "featureType": "poi.attraction",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.business",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.government",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.medical",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.place_of_worship",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.school",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "poi.sports_complex",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "on"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station.airport",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station.bus",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "featureType": "transit.station.rail",
    "elementType": "labels",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  }
]''';
}
