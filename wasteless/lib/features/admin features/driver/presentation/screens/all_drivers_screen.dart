import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/assets_path.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import 'admin_driver_profile.dart';

class DriversScreen extends StatelessWidget {
  static const String id = 'admin_drivers_screen';
  const DriversScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref('driver');
    return ScaffoldBlueBackground(
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Members',
                style: TextStyle(
                    color: PRIMARY_BLUE,
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                          color: BLACK.withOpacity(0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4))
                    ]),
              ),
              Image.asset(
                WASTELESS_LOGO,
                height: context.height * 0.15,
              )
            ],
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: const Center(
                  child: CircularProgressIndicator(),
                ),
                itemBuilder: (context, snapshot, animation, i) {
                  return InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, AdminDriverProfileScreen.id,
                        arguments: {
                          'image': snapshot.child('image').value.toString(),
                          "fullName":
                              snapshot.child('fullName').value.toString(),
                          "idNumber":
                              snapshot.child('idNumber').value.toString(),
                          "nationality":
                              snapshot.child('nationality').value.toString(),
                          "area": snapshot.child('area').value.toString(),
                          "email": snapshot.child('email').value.toString(),
                          "driverId": snapshot
                        }),
                    child: Container(
                      height: context.height * 0.12,
                      width: context.width * 0.2,
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: LIGHT_BLUE,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: BLACK.withOpacity(0.25),
                                offset: const Offset(0, 4),
                                blurRadius: 4)
                          ]),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                snapshot.child('image').value.toString()),
                            radius: 35,
                          ),
                          SizedBox(
                            width: context.width * 0.06,
                          ),
                          Text(
                            snapshot.child('fullName').value.toString(),
                            style: anyColorSize16(PRIMARY_BLUE),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
