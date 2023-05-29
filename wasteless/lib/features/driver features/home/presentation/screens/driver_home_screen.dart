import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasteless/core/common/data/models/driver_models.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/language.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../../../../../core/widgets/warning_dialog.dart';
import '../../../settings/presentation/screens/profile_screen.dart';
import '../widgets/gradient_widget.dart';

class DriverHomeScreen extends StatefulWidget {
  static const String id = 'driver_home_screen';
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  late double? lat;
  late double? long;

  String errorMessage = '';

  bool accessLocation = false;
  bool displayErrorMessage = false;

  late DatabaseReference ref;
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        errorMessage = translations(context).location_services_are_disabled;
        displayErrorMessage = true;
      });
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          errorMessage = translations(context).location_permission_are_denied;
          displayErrorMessage = true;
        });
        return Future.error('Location P are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setState(() {
        errorMessage =
            translations(context).location_permission_are_permanently_denied;
        displayErrorMessage = true;
      });
      return Future.error('location P are permanently denied');
    }
    _liveLocation();
    return Geolocator.getCurrentPosition();
  }

  void _liveLocation() async {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 10);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) async {
      lat = position.latitude;
      long = position.longitude;
      await ref.update({"lat": position.latitude, "lng": position.longitude});
    });
  }

  @override
  void initState() {
    super.initState();
    var user = FirebaseAuth.instance.currentUser;
    var userId = user!.uid;
    ref = FirebaseDatabase.instance.ref('driver/$userId');
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBlueBackground(
      widget: Stack(
        alignment: Alignment.center,
        children: [
          Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child:
                    Image.asset(WASTELESS_LOGO, height: context.height * 0.4)),
            SizedBox(
              height: context.height * 0.05,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const GradientWidget(),
                StreamBuilder(
                    stream: ref.onValue,
                    builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      Map<String, dynamic> map = Map<String, dynamic>.from(
                          snapshot.data!.snapshot.value as Map);
                      List<DriversModel> driver = [];
                      map.forEach((key, value) {
                        driver.add(DriversModel(
                          id: key,
                          lat: value['lat'],
                          lng: value['lng'],
                          area: value['area'],
                          email: value['email'],
                          fullName: value['fullName'],
                          idNumber: value['idNumber'],
                          image: value['image'],
                          nationality: value['nationality'],
                          qR: value['qR'],
                        ));
                      });

                      return InkWell(
                          onTap: () => Navigator.of(context)
                                  .pushNamed(ProfileScreen.id, arguments: {
                                "fullName": driver.first.fullName,
                                "image": driver.first.image,
                                "email": driver.first.email,
                                "qr": driver.first.qR
                              }),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'driver.first.fullName} \n \n driver.first.fullName}',
                                style: anyColorSize16(WHITE),
                              ),
                              SizedBox(
                                width: context.width * 0.04,
                              ),
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(driver.first.image),
                                backgroundColor: WHITE,
                                radius: 55,
                              )
                            ],
                          ));
                    })
              ],
            ),
          ]),
          Visibility(
              visible: displayErrorMessage,
              child: Center(
                child: WarningDialog(
                  title: errorMessage,
                ),
              )),
        ],
      ),
    );
  }
}
