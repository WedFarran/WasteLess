// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../domain/entities/bin_entity.dart';

class MapItemsListWidget extends StatelessWidget {
  const MapItemsListWidget({super.key});

  //final List<MapBin> bins;
  //List< /*MapDriver*/ MapBin> drivers;
  //MapItemsListWidget({required this.bins, required this.drivers, super.key});

  @override
  Widget build(BuildContext context) {
    return const GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(25.1193, 55.3773), zoom: 14),
    );
  }
}
