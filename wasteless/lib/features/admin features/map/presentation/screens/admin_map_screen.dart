import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/features/admin%20features/map/presentation/bloc/map_items_bloc.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../widgets/filtering_options_widget.dart';

class AdminMapScreen extends StatefulWidget {
  static const String id = 'admin_map_screen';
  const AdminMapScreen({super.key});

  @override
  State<AdminMapScreen> createState() => _AdminMapScreenState();
}

class _AdminMapScreenState extends State<AdminMapScreen> {
  late GoogleMapController mapController;
  double percent = 0.3;

  final ref = FirebaseDatabase.instance.ref().child('bin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80.0),
          child: FloatingActionButton(
            child: Image.asset(
              FILTRING_ICON,
              height: context.height * 0.04,
            ),
            onPressed: () => showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40))),
                backgroundColor: WHITE,
                context: context,
                builder: (context) => FilteringOptionsWidget(
                      selected: true,
                      ontap: () {},
                    )),
          ),
        ),
        body: BlocBuilder<MapItemsBloc, MapItemsState>(
            builder: ((context, state) {
          if (state is LoadingMapItemsState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedMapItemsState) {
            return FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                return ListTile(
                  title: Text(snapshot.child('wasteLevel').toString()),
                );
              },
            );
          } else if (state is ErrorMapItemsState) {
            return Container(
              alignment: Alignment.center,
              child: const Text('error'),
            );
          }
          return Container(
            alignment: Alignment.center,
            child: const Text('another'),
          );
        })));
  }
}
