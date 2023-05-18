import 'package:firebase_database/firebase_database.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/common/data/models/driver_models.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class AssignedDriver extends StatefulWidget {
  final String driverId;
  final DriversModel? driver;
  final Function(dynamic) onChanged;
  const AssignedDriver(
      {super.key,
      required this.driverId,
      required this.onChanged,
      required this.driver});

  @override
  State<AssignedDriver> createState() => _AssignedDriverState();
}

class _AssignedDriverState extends State<AssignedDriver> {
  late DatabaseReference driverRef;
  late DatabaseReference dbDrivers;
  late Query querdDriver;
  List<DriversModel> driversList = [];

  @override
  void initState() {
    driverRef = FirebaseDatabase.instance.ref('driver/${widget.driverId}');
    dbDrivers = FirebaseDatabase.instance.ref('driver');
    querdDriver = driverRef.child('driver').equalTo(widget.driverId);
    getDrivers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 13, right: 13),
        child: StreamBuilder(
            stream: dbDrivers.onValue,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return DropdownButton(
                items: driversList
                    .map((listDriver) => DropdownMenuItem(
                        value: listDriver,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            /* CircleAvatar(
                              backgroundImage: NetworkImage(listDriver.image),
                            ),*/
                            SizedBox(width: context.width * 0.03),
                            Text(
                              '', //listDriver.fullName.toString(),
                              style: anyColorSize16(PRIMARY_BLUE),
                            )
                          ],
                        )))
                    .toList(),
                /* value: widget.driver ??
                    driversList
                        .firstWhere((element) => element.id == widget.driverId),*/
                onChanged: widget.onChanged,
                isExpanded: true,
              );
            }),
      ),
    );
  }

  void getDrivers() {
    Stream<DatabaseEvent> streamDrivers = dbDrivers.onValue;
    streamDrivers.listen((DatabaseEvent event) {
      Map<String, dynamic> driversMap =
          Map<String, dynamic>.from(event.snapshot.value as Map);

      driversMap.forEach((key, value) {
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
      setState(() {});
    });
  }
}
