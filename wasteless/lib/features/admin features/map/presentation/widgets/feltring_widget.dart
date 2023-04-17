// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import 'filtering_button_widget.dart';

class FilteringWidget extends StatefulWidget {
  bool driversCheck;
  bool emptyCheck;
  bool fullCheck;
  bool halfFullCheck;
  FilteringWidget(
      {super.key,
      required this.driversCheck,
      required this.emptyCheck,
      required this.fullCheck,
      required this.halfFullCheck});

  @override
  State<FilteringWidget> createState() => _FilteringWidgetState();
}

class _FilteringWidgetState extends State<FilteringWidget> {
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
                onTap: () => setState(() {
                  widget.driversCheck = true;
                  widget.emptyCheck = true;
                  widget.fullCheck = true;
                  widget.halfFullCheck = true;
                }),
                child: Text('Reset', style: anyColorSize16(BLACK)),
              ),
            ],
          ),
          FilteringButtonWidget(
            onTap: () {
              widget.fullCheck = !widget.fullCheck;
              setState(() {});
            },
            selected: widget.fullCheck,
            icon: Full_BIN_ICON,
            status: 'Full',
          ),
          FilteringButtonWidget(
            onTap: () => setState(() {
              widget.halfFullCheck = !widget.halfFullCheck;
            }),
            selected: widget.halfFullCheck,
            icon: HALF_FULL_BIN_ICON,
            status: 'Half Full',
          ),
          FilteringButtonWidget(
            onTap: () => setState(() {
              widget.emptyCheck = !widget.emptyCheck;
            }),
            selected: widget.emptyCheck,
            icon: EMPTY_BIN_ICON,
            status: 'Empty',
          ),
          const Divider(
            color: PRIMARY_BLUE,
            thickness: 1,
          ),
          FilteringButtonWidget(
            onTap: () => setState(() {
              widget.driversCheck = !widget.driversCheck;
            }),
            selected: widget.driversCheck,
            icon: VEHICLE_ICON,
            status: 'Drivers',
          ),
        ],
      ),
    );
  }
}
