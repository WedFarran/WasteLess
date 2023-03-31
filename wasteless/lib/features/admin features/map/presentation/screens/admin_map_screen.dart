import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/map_widgets/bin_details.dart';
import '../bloc/map_items/map_itemss_bloc.dart';

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  late GoogleMapController mapController;

  Map<String, Marker> markers = {};
  mapThings() async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), HALF_FULL_BIN_PIN);

    Marker marker = Marker(
      onTap: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            backgroundColor: WHITE,
            context: context,
            builder: (context) => BinDetailsWidget());
      },
      markerId: const MarkerId('value'),
      position: const LatLng(25.1193, 55.3773),
      icon: markerIcon,
    );
    markers['1'] = marker;
    setState(() {});
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
        mapThings();
      },
      initialCameraPosition:
          const CameraPosition(target: LatLng(25.1193, 55.3773), zoom: 14),
    ));
  }
}

Widget _buildBody() {
  late GoogleMapController mapController;
  Map<String, Marker> markers = {};
  mapThings() async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), HALF_FULL_BIN_PIN);

    Marker marker = Marker(
      markerId: MarkerId('value'),
      infoWindow: InfoWindow(title: "hhh"),
      position: LatLng(25.1193, 55.3773),
      icon: markerIcon,
    );
    markers['1'] = marker;
  }

  return BlocBuilder<MapItemssBloc, MapItemssState>(builder: (context, state) {
    if (state is LoadingMapItemsState) {
      print('loading');
      return /*LoadingWidget();*/ GoogleMap(
        mapType: MapType.hybrid,
        markers: markers.values.toSet(),
        onMapCreated: (controller) {
          mapController = controller;
          mapThings();
        },
        initialCameraPosition:
            const CameraPosition(target: LatLng(25.1193, 55.3773), zoom: 14),
      );
    } else if (state is LoadedMapItemsState) {
      print('loaded');
      return const GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(25.1193, 55.3773), zoom: 14),
      );
    } else if (state is ErrorMapItemsState) {
      print(state.message);
      return Text(state.message);
    }
    print('not any state');
    return Container();
  });

  /*BlocBuilder<MapItemssBloc, MapItemssState>(builder: (context, state) {
    if (state is LoadingMapItemsState) {
      print('loading');
      return const LoadingWidget();
    } else if (state
        is LoadedMapItemsState /* && state is LoadedMapDriversState*/) {
      print('loaded');
      return const MapItemsListWidget();
    } else if (state is ErrorMapItemsState) {
      print('error');
      return ErrorMessageDisplayWidget(message: state.message);
    }
    print('last return');
    return const MapItemsListWidget();
  });*/
}
