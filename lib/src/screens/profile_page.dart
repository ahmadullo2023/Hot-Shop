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
