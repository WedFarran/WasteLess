import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/map_widgets/bin_details.dart';

class DriverMapScreen extends StatefulWidget {
  static const String id = 'driver_map_screen';

  const DriverMapScreen({super.key});

  @override
  State<DriverMapScreen> createState() =>_DriverMapScreenState();
}
  class _DriverMapScreenState extends State<DriverMapScreen> {
  late GoogleMapController mapController;
  BitmapDescriptor driverMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor fullBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor halfFullBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor emptyBinMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor brokenBinMarker = BitmapDescriptor.defaultMarker;
  double percent = 0.3;

  @override
  void initState() {
  super.initState();
  setCustomerMarkerIcon();
  }
  
  setCustomerMarkerIcon(){
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, FULL_BIN_PIN).then((icon) => {fullBinMarker = icon});
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, HALF_FULL_BIN_PIN).then((icon) => {halfFullBinMarker = icon});
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, EMPTY_BIN_PIN).then((icon) => {emptyBinMarker = icon});
    //BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, BROKEN_BIN_PIN).then((icon) => {brokenBinMarker = icon});
    
    
    
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }




  }




