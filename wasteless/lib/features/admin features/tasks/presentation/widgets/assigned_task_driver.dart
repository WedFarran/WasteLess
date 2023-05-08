import 'package:firebase_database/firebase_database.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/colors.dart';

class AssignedDriver extends StatefulWidget {
  final String driverId;
  const AssignedDriver({super.key, required this.driverId});

  @override
  State<AssignedDriver> createState() => _AssignedDriverState();
}

class _AssignedDriverState extends State<AssignedDriver> {
  late DatabaseReference driverRef;
  late Query querdDriver;
  @override
  void initState() {
    driverRef = FirebaseDatabase.instance.ref('driver/${widget.driverId}');
    querdDriver = driverRef.child('driver').equalTo(widget.driverId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: StreamBuilder(
          stream: driverRef.onValue,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot.data!.snapshot
                              .child('image')
                              .value
                              .toString()),
                          backgroundColor: WHITE,
                          radius: 25,
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.04,
                      ),
                      Text(
                        snapshot.data!.snapshot
                            .child('fullName')
                            .value
                            .toString(),
                        style: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 11,
                            color: PRIMARY_BLUE,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 13.0),
                    child: Icon(
                      Icons.arrow_downward_outlined,
                    ),
                  ),
                ]);
          }),
    );
  }
}
