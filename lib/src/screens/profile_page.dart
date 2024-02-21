import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../common/constants/app_collors.dart';
import '../view/custom_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bcColor,
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ProfileItem(
              titleT: Text("History"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Massage"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Payments"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("basket"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
            ProfileItem(
              titleT: Text("Other"),
              trailingI: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}





// class GoogleMap1 extends StatefulWidget {
//   const GoogleMap1({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleMap1> createState() => _GoogleMap1State();
// }
//
// double lat = 41.3398472;
// double long = 69.2488915;
//
// class _GoogleMap1State extends State<GoogleMap1> {
//   late GoogleMapController googleMapController;
//
//   static CameraPosition initialCameraPosition = CameraPosition(
//     target: LatLng(lat, long),
//     zoom: 15,
//   );
//
//
//   @override
//   void dispose() {
//     googleMapController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Scaffold(
//       backgroundColor: Colors.grey,
//       body:
//       GoogleMap(
//         // initialCameraPosition: Provider.of<ProFunc>(context).initialCameraPosition,
//         initialCameraPosition:  CameraPosition(
//           target: LatLng(lat, long),
//           zoom: 15,
//         ),
//         onMapCreated: (controller) => googleMapController = controller,
//         markers: {
//           Marker(
//             markerId: const MarkerId("01"),
//             infoWindow: const InfoWindow(title: 'Origin'),
//             // position: LatLng(Provider.of<ProFunc>(context).lat, Provider.of<ProFunc>(context).long),
//             // position: Provider.of<ProFunc>(context, listen: false).latLng(),
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueGreen),
//           ),
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//
//         foregroundColor: Colors.black,
//         onPressed: () {
//           googleMapController.animateCamera(
//             CameraUpdate.newCameraPosition(initialCameraPosition),
//           );
//         },
//         child: const Icon(Icons.center_focus_strong),
//       ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.startFloat
//       );
//   }
// }




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
              _markers.add(Marker(
                markerId: const MarkerId("2"),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: const InfoWindow(title: "My Current location"),
              ));
              CameraPosition cameraPosition = CameraPosition(
                  zoom: 14, target: LatLng(value.latitude, value.longitude));
              final GoogleMapController controller = await _controller.future;

              controller.animateCamera(
                  CameraUpdate.newCameraPosition(cameraPosition));
              setState(() {});
            });
          },
          child: const Icon(Icons.center_focus_strong),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}


