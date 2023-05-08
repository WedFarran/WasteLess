import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/common/data/models/driver_models.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/utils/styles.dart';

class DriverDropDownMenu extends StatelessWidget {
  final List<DriversModel> itemsList;
  final DriversModel? value;
  final Function(dynamic) onChanged;
  final bool itemSelected;
  const DriverDropDownMenu({
    super.key,
    required this.value,
    required this.itemsList,
    required this.onChanged,
    required this.itemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            width: context.width * 0.88,
            height: context.height * 0.08,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: WHITE,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 3.5),
                      blurRadius: 4,
                      color: BLACK.withOpacity(0.25))
                ]),
            child: DropdownButton<DriversModel>(
              items: itemsList
                  .map((driver) => DropdownMenuItem(
                      value: driver,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(driver.image),
                          ),
                          SizedBox(width: context.width * 0.03),
                          Text(
                            driver.fullName.toString(),
                            style: anyColorSize16(PRIMARY_BLUE),
                          )
                        ],
                      )))
                  .toList(),
              value: value,
              onChanged: onChanged,
              isExpanded: true,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
          child: Visibility(
            visible: itemSelected,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                translations(context).select_driver,
                style: anyColorSize16(RED),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
