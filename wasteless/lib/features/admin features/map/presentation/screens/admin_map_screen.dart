import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/widgets/error_message_display_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../bloc/map_items/map_itemss_bloc.dart';
import '../widgets/map_items_list_widget.dart';

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container() /*_buildBody()*/);
  }
}

Widget _buildBody() {
  return BlocBuilder<MapItemssBloc, MapItemssState>(builder: (context, state) {
    if (state is LoadingMapItemsState) {
      print('loading');
      return const LoadingWidget();
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
    print('loaded');
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
