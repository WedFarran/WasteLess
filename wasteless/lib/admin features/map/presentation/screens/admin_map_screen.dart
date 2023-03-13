import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteless/admin%20features/map/domain/entities/bin_entity.dart';
import 'package:wasteless/admin%20features/map/domain/entities/driver_entity.dart';
import '../../../../core/widgets/error_message_display_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../bloc/bloc/map_itemss_bloc.dart';
import '../widgets/map_items_list_widget.dart';

class AdminMapScreen extends StatelessWidget {
  const AdminMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: NavigationBar(
        height: 60,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: '',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: '',
            selectedIcon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}

Widget _buildBody() {
  return BlocBuilder<MapItemssBloc, MapItemssState>(builder: (context, state) {
    if (state is LoadingMapItemsState) {
      return const LoadingWidget();
    } else if (state
        is LoadedMapBinsState /* && state is LoadedMapDriversState*/) {
      return MapItemsListWidget(bins: state.mapBins, drivers: state.mapBins);
    } else if (state is ErrorMapBinsState && state is ErrorMapDriversState) {
      return ErrorMessageDisplayWidget(message: state.message);
    }

    return MapItemsListWidget(
      bins: const [
        MapBin(
            id: 1,
            status: true,
            lat: 25.1193,
            lng: 25.1193,
            wasteLevel: 50,
            fullnesTime: "1h")
      ],
      drivers: const [
        MapBin(
            id: 1,
            status: true,
            lat: 25.1193,
            lng: 25.1193,
            wasteLevel: 50,
            fullnesTime: "1h")
      ],
    );
  });
}
