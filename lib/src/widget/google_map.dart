import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';

class GoogleMap1 extends StatefulWidget {
  const GoogleMap1({Key? key}) : super(key: key);

  @override
  State<GoogleMap1> createState() => _GoogleMap1State();
}

class _GoogleMap1State extends State<GoogleMap1> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 14,
  );

  final List<Marker> _markers = <Marker>[
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: "The title of the marker"),
    ),
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getUserCurrentLocation().then((value) async {

            Provider.of<ProFunc>(context, listen: false)
                .latFunc(value.latitude);
            Provider.of<ProFunc>(context, listen: false)
                .lngFunc(value.longitude);

            Provider.of<ProFunc>(context, listen: false)
                .latLngFunc(LatLng(value.latitude, value.longitude));

            _markers.add(Marker(
              markerId: const MarkerId("2"),
              position: LatLng(value.latitude, value.longitude),
              infoWindow: const InfoWindow(title: "My Current location"),
            ));
            CameraPosition cameraPosition = CameraPosition(
              zoom: 11,
              target: LatLng(value.latitude, value.longitude),
            );
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(
              CameraUpdate.newCameraPosition(cameraPosition),
            );
            setState(() {});
          });
        },
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}












class GoogleMap2 extends StatefulWidget {
  const GoogleMap2({
    super.key,
    required this.product,
  });

  final QueryDocumentSnapshot<Map<String, dynamic>> product;

  @override
  State<GoogleMap2> createState() => _GoogleMap2State();
}

class _GoogleMap2State extends State<GoogleMap2> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(41.311081, 69.240562),
    zoom: 14,
  );

  final List<Marker> _markers = <Marker>[
    const Marker(
      markerId: MarkerId("1"),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: "The title of the marker"),
    ),
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(_markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("u turgan joy FireBasedan olib kelyapman ${widget.product['latLng']}");
          double? lat3 = double.tryParse(widget.product['lat']);
          double? lng3 = double.tryParse(widget.product['lng']);

          _markers.add(Marker(
            markerId: MarkerId("2"),
            position: LatLng(lat3!, lng3!),
            infoWindow: InfoWindow(title: "My Current location"),
          ));
          CameraPosition cameraPosition = CameraPosition(
            zoom: 11,
            target: LatLng(lat3, lng3),
          );
          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(
            CameraUpdate.newCameraPosition(cameraPosition),
          );
          setState(() {});
        },
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
