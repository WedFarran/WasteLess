import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/styles.dart';
import 'filtering_button_widget.dart';

class FilteringOptionsWidget extends StatefulWidget {
  final bool selected;
  final void Function()? ontap;
  const FilteringOptionsWidget(
      {super.key, required this.selected, required this.ontap});

  @override
  State<FilteringOptionsWidget> createState() => _FilteringOptionsWidgetState();
}

class _FilteringOptionsWidgetState extends State<FilteringOptionsWidget> {
  bool fullSelected = false;
  bool halfFullSelected = false;
  bool emptySelected = false;
  bool driversSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.33,
      margin: const EdgeInsets.only(top: 15, right: 20, bottom: 5, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    FILTRING_ICON,
                    height: context.height * 0.02,
                  ),
                  Text(
                    'Filter',
                    style: DETAILS_GRAY,
                  )
                ],
              ),
              InkWell(
                child: Text('Reset', style: RESET_BLACK),
                onTap: () => setState(() {
                  fullSelected = false;
                  halfFullSelected = false;
                  emptySelected = false;
                  driversSelected = false;
                }),
              ),
            ],
          ),
          FilteringButtonWidget(
            onTap: () {
              setState(() {
                fullSelected = !fullSelected;
              });
            },
            selected: fullSelected,
            icon: Full_BIN_ICON,
            status: 'Full',
          ),
          FilteringButtonWidget(
            onTap: () {
              setState(() {
                halfFullSelected = !halfFullSelected;
              });
            },
            selected: halfFullSelected,
            icon: HALF_FULL_BIN_ICON,
            status: 'Half Full',
          ),
          FilteringButtonWidget(
            onTap: () {
              setState(() {
                emptySelected = !emptySelected;
              });
            },
            selected: emptySelected,
            icon: EMPTY_BIN_ICON,
            status: 'Empty',
          ),
          const Divider(
            color: PRIMARY_BLUE,
            thickness: 1,
          ),
          FilteringButtonWidget(
            onTap: () {
              setState(() {
                driversSelected = !driversSelected;
              });
            },
            selected: driversSelected,
            icon: VEHICLE_ICON,
            status: 'Drivers',
          ),
        ],
      ),
    );
  }
}
