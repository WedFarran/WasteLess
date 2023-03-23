import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
        body: _buildBody(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            color: PRIMARY_BLUE,
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: data.length,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = i;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            padding: const EdgeInsets.only(bottom: 10),
                            width: 20,
                            decoration: BoxDecoration(
                              color: i == selectedIndex ? PRIMARY_GREEN : null,
                              boxShadow: i == selectedIndex
                                  ? [
                                      const BoxShadow(
                                          color: SHADOW_GREY,
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(0, 4))
                                    ]
                                  : null,
                            ),
                            child: SizedBox(
                              child: data[i],

                              //size: 35,
                            ),
                          ),
                        ),
                      )),
            ),
          ),
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
    } else if (state is ErrorMapItemsState && state is ErrorMapItemsState) {
      print('error');
      return ErrorMessageDisplayWidget(message: state.message);
    }
    print('last return');
    return const MapItemsListWidget();
  });
}
