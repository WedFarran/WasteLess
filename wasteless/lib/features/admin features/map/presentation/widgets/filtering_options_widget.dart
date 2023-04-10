import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/styles.dart';
import 'filtering_button_widget.dart';

class FilteringOptionsWidget extends StatefulWidget {
  final void Function()? ontap;
  late bool fullSelected;
  late bool halfFullSelected;
  late bool emptySelected;
  late bool driversSelected;
  FilteringOptionsWidget(
      {super.key,
      required this.ontap,
      required this.driversSelected,
      required this.emptySelected,
      required this.fullSelected,
      required this.halfFullSelected});

  @override
  State<FilteringOptionsWidget> createState() => _FilteringOptionsWidgetState();
}

class _FilteringOptionsWidgetState extends State<FilteringOptionsWidget> {
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
                  widget.fullSelected = false;
                  widget.halfFullSelected = false;
                  widget.emptySelected = false;
                  widget.driversSelected = false;
                }),
              ),
            ],
          ),
          FilteringButtonWidget(
            onTap: () {
              setState(() {
                widget.fullSelected = !widget.fullSelected;
              });
            },
            selected: widget.fullSelected,
            icon: Full_BIN_ICON,
            status: 'Full',
          ),
          FilteringButtonWidget(
            onTap: () {
              setState(() {
                widget.halfFullSelected = !widget.halfFullSelected;
              });
            },
            selected: widget.halfFullSelected,
            icon: HALF_FULL_BIN_ICON,
            status: 'Half Full',
          ),
          FilteringButtonWidget(
            onTap: () {
              setState(() {
                widget.emptySelected = !widget.emptySelected;
              });
            },
            selected: widget.emptySelected,
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
                widget.driversSelected = !widget.driversSelected;
              });
            },
            selected: widget.driversSelected,
            icon: VEHICLE_ICON,
            status: 'Drivers',
          ),
        ],
      ),
    );
  }
}
