import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/core/utils/media_query.dart';
import 'package:wasteless/core/utils/styles.dart';

import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../widgets/driver_information_widget.dart';
import '../widgets/history_button.dart';
import 'driver_history.dart';

class AdminDriverProfileScreen extends StatelessWidget {
  static const String id = 'AdminDriverProfileScreen';
  const AdminDriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> driver =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    var driverInfoSnapshot = driver['driverId'];
    String driverKey = driverInfoSnapshot.key;

    return ScaffoldBlueBackground(
      widget: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: PRIMARY_GREEN,
                    )),
                Image.asset(
                  WASTELESS_LOGO_TRANS,
                  height: context.height * 0.15,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(driver['image']),
                  radius: 50,
                ),
                SizedBox(
                  width: context.width * 0.02,
                ),
                HistoryButtonWidget(
                  onTap: () => Navigator.of(context)
                      .pushNamed(DriverHistoryScreen.id, arguments: {
                    "driverId": driverKey,
                    "fullName": driver['fullName'],
                    "idNumber": driver['idNumber'],
                    "image": driver['image']
                  }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.height * 0.07,
          ),
          DriverInformationWidget(
              title: translations(context).name, content: driver['fullName']),
          DriverInformationWidget(
              title: translations(context).id_number,
              content: driver['idNumber']),
          DriverInformationWidget(
              title: translations(context).nationality,
              content: driver['nationality']),
          DriverInformationWidget(
              title: translations(context).area, content: driver['area']),
          DriverInformationWidget(
              title: translations(context).email, content: driver['email'])
        ],
      ),
    );
  }
}
