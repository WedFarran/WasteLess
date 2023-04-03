import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/map_widgets/bin_details.dart';

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  late GoogleMapController mapController;
  double percent = 0.3;
  Map<String, Marker> markers = {};
  mapThings(double percent) async {
    setState(() async {
      var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(),
        percent < 0.4
            ? EMPTY_BIN_PIN
            : percent >= 0.8
                ? FULL_BIN_PIN
                : HALF_FULL_BIN_PIN,
      );
      Marker marker = Marker(
        onTap: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              backgroundColor: WHITE,
              context: context,
              builder: (context) => BinDetailsWidget(
                    percent: percent,
                  ));
        },
        markerId: const MarkerId('value'),
        position: const LatLng(25.1193, 55.3773),
        icon: markerIcon,
      );
      markers['1'] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      markers: markers.values.toSet(),
      onTap: (argument) {},
      onMapCreated: (controller) {
        mapController = controller;
        mapController.setMapStyle(
            '[{"featureType": "poi","stylers": [{"visibility": "off"}]}]');
        mapThings(0.9);
      },
      initialCameraPosition:
          const CameraPosition(target: LatLng(25.1193, 55.3773), zoom: 14),
    ));
  }
}
