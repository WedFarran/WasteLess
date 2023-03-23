import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/error_message_display_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../bloc/bloc/map_itemss_bloc.dart';
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
    int selectedIndex = 0;
    List data = [
      Image.asset(
        'assets/icons/drivers.png',
        scale: 10.0,
      ),
      Image.asset(
        'assets/icons/map.png',
        scale: 10.0,
      ),
      Image.asset(
        'assets/icons/tasks.png',
        scale: 10.0,
      ),
      Image.asset(
        'assets/icons/settings.png',
        scale: 10.0,
      )
    ];
    return const Scaffold(
        body: GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(25.1193, 55.3773), zoom: 14),
    ));
  }
}

Widget _buildBody() {
  return BlocBuilder<MapItemssBloc, MapItemssState>(builder: (context, state) {
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
  });
}
