import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/styles.dart';
import 'filtering_button_widget.dart';

class FilteringOptionsWidget extends StatelessWidget {
  final Function()? fullOnTap;
  final Function()? halfFullOnTap;
  final Function()? emptyOnTap;
  final Function()? driversOnTap;
  final Function()? resetOnTap;
  final bool driversSelected;
  final bool halfFullSelected;
  final bool emptySelected;
  final bool fullSelected;
  const FilteringOptionsWidget(
      {super.key,
      required this.driversOnTap,
      required this.emptyOnTap,
      required this.fullOnTap,
      required this.halfFullOnTap,
      required this.resetOnTap,
      required this.driversSelected,
      required this.emptySelected,
      required this.fullSelected,
      required this.halfFullSelected});

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
                    style: anyColorSize16(FONT_GRAY),
                  )
                ],
              ),
              InkWell(
                onTap: resetOnTap,
                child: Text('Reset', style: anyColorSize16(BLACK)),
              ),
            ],
          ),
          FilteringButtonWidget(
            onTap: fullOnTap,
            selected: fullSelected,
            icon: Full_BIN_ICON,
            status: 'Full',
          ),
          FilteringButtonWidget(
            onTap: halfFullOnTap,
            selected: halfFullSelected,
            icon: HALF_FULL_BIN_ICON,
            status: 'Half Full',
          ),
          FilteringButtonWidget(
            onTap: emptyOnTap,
            selected: emptySelected,
            icon: EMPTY_BIN_ICON,
            status: 'Empty',
          ),
          const Divider(
            color: PRIMARY_BLUE,
            thickness: 1,
          ),
          FilteringButtonWidget(
            onTap: driversOnTap,
            selected: driversSelected,
            icon: VEHICLE_ICON,
            status: 'Drivers',
          ),
        ],
      ),
    );
  }
}
