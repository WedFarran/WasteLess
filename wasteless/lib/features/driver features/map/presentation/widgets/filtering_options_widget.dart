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
  final List<Data> data;
  final Function(List<Data>) onFilter;
  const FilteringOptionsWidget(
      {super.key, required this.selected, required this.ontap, required this.data, required this.onFilter});

  @override
  State<FilteringOptionsWidget> createState() => _FilteringOptionsWidgetState();
}

class _FilteringOptionsWidgetState extends State<FilteringOptionsWidget> {
  bool fullSelected = false;
  bool halfFullSelected = false;
  bool emptySelected = false;

  List<Data> _filteredData = [];

  void _updateFilter() {
    setState(() {
      _filteredData = widget.data.where((item) {
        if (fullSelected && item.status == 'Full') {
          return true;
        }
        if (halfFullSelected && item.status == 'Half Full') {
          return true;
        }
        if (emptySelected && item.status == 'Empty') {
          return true;
        }
        return false;
      }).toList();
    });

    widget.onFilter(_filteredData);
  }


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
                onTap: () {
                  setState(() {
                    fullSelected = false;
                    halfFullSelected = false;
                    emptySelected = false;
                    _filteredData = [];
                  });

                  widget.onFilter(widget.data);
                },
              ),
            ],
          ),
          FilteringButtonWidget(
            onTap: () {
              setState(() {
                fullSelected = !fullSelected;
                _updateFilter();
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
                _updateFilter();
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
                _updateFilter();
              });
            },
            selected: emptySelected,
            icon: EMPTY_BIN_ICON,
            status: 'Empty',
          ),
        ],
      ),
    );
  }
}

class Data {
  String name;
  String status;

  Data(this.name, this.status);
}

