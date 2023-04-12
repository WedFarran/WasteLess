import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';

import '../widgets/gradient_widget.dart';

class DriverHomeScreen extends StatelessWidget {
  static const String id = 'driver_home_screen';
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    var userId = user!.uid;
    DatabaseReference ref =
        FirebaseDatabase.instance.ref('driver/F74yC0JSyUh4S6gdz3CGn6dxHoJ3');
    return ScaffoldBlueBackground(
      widget: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(
            WASTELESS_LOGO,
            height: context.height * 0.4,
          ),
        ),
        SizedBox(
          height: context.height * 0.06,
        ),
        InkWell(
          onTap: () {
            print(ref.key);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              const GradientWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ahmed Kamal \n \n 439016210',
                    style: anyColorSize16(WHITE),
                  ),
                  SizedBox(
                    width: context.width * 0.04,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage(WASTELESS_LOGO),
                    radius: 55,
                  )
                ],
              )
            ],
          ),
        ),
        /* InkWell(
                onTap: () {},
                child: Container(
                  height: context.height * 0.19,
                  width: context.width * 0.78,
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
              ),*/
      ]),
    );
  }
}
