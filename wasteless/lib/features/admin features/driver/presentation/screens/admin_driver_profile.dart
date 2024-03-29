import 'package:flutter/material.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/widgets/logo_back_widget.dart';
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
          const LogoBackButton(),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(driver['image']),
                  backgroundColor: WHITE,
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
      child: Padding(padding: EdgeInsets.all(5)),
    );
  }
}
