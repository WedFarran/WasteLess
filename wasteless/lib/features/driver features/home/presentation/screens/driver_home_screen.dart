import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';

import '../../../../../core/utils/assets_path.dart';

class DriverHomeScreen extends StatelessWidget {
  static const String id = 'driver_home_screen';
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  var user = FirebaseAuth.instance.currentUser;
    //  var userId = user!.uid;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('driver/F74yC0JSyUh4S6gdz3CGn6dxHoJ3');
    return Scaffold(
        backgroundColor: PRIMARY_BLUE,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: context.height * 0.75,
                  width: context.width,
                  decoration: const BoxDecoration(
                      color: WHITE,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Image.asset(
                        WASTELESS_LOGO,
                        height: context.height * 0.4,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: context.height * 0.17,
                        width: context.width * 0.75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: PRIMARY_GREEN),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(''),
                              CircleAvatar(
                                backgroundImage: AssetImage(WASTELESS_LOGO),
                                radius: 55,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ));
  }
}
