import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/named_and_image_widget.dart';
import '../widgets/profile_information.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'ProfileScreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String fullName = arguments["fullName"];
    int i = fullName.indexOf(" ");
    String firstName = fullName.substring(1, i);
    String lastName = fullName.substring(i, fullName.length);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NameAndImageWidget(
                title: arguments["fullName"],
                image: arguments["image"],
                backArrowVisible: true,
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  translations(context).your_information,
                  style: NORMAL_20,
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              ProfileInformation(
                title: translations(context).first_name,
                information: firstName,
              ),
              ProfileInformation(
                title: translations(context).last_name,
                information: lastName,
              ),
              ProfileInformation(
                title: translations(context).email,
                information: arguments["email"].toString(),
              ),
              Center(
                child: QrImage(
                  data: arguments["qr"].toString(),
                  backgroundColor: WHITE,
                  size: 150,
                ),
              ),
              Center(
                child: Text(
                  translations(context).qr,
                  style: NORMAL_20,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
