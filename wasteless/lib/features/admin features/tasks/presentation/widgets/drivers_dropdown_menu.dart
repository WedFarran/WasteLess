import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/common/data/models/driver_models.dart';
import '../../../../../core/strings/consts.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/utils/styles.dart';

class DriverDropDownMenu extends StatefulWidget {
  final DriversModel? value;
  final Function(dynamic) onChanged;
  final bool itemSelected;
  const DriverDropDownMenu({
    super.key,
    required this.value,
    required this.onChanged,
    required this.itemSelected,
  });

  @override
  State<DriverDropDownMenu> createState() => _DriverDropDownMenuState();
}

class _DriverDropDownMenuState extends State<DriverDropDownMenu> {
  late DatabaseReference dbDrivers;
  @override
  void initState() {
    dbDrivers = FirebaseDatabase.instance.ref(DRIVER);
    super.initState();
  }

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
            child: StreamBuilder(
                stream: dbDrivers.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  Map<String, dynamic> map = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map);

                  List<DriversModel> driversList = [];
                  map.forEach((key, value) {
                    driversList.add(DriversModel(
                        id: key,
                        area: value['area'],
                        email: value['email'],
                        fullName: value['fullName'],
                        idNumber: value['idNumber'],
                        image: value['image'],
                        lat: value['lat'],
                        lng: value['lng'],
                        nationality: value['nationality'],
                        qR: value['qR']));
                  });

                  return DropdownButton<DriversModel>(
                    items: driversList
                        .map((driver) => DropdownMenuItem(
                            value: driver,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                /* CircleAvatar(
                                  backgroundImage: NetworkImage(driver.image),
                                ),*/
                                SizedBox(width: context.width * 0.03),
                                Text(
                                  '', // driver.fullName.toString(),
                                  style: anyColorSize16(PRIMARY_BLUE),
                                )
                              ],
                            )))
                        .toList(),
                    value: widget.value,
                    onChanged: widget.onChanged,
                    isExpanded: true,
                  );
                })),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
          child: Visibility(
            visible: widget.itemSelected,
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
