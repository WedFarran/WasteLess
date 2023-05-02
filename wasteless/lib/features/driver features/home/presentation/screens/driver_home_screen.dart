import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wasteless/core/utils/colors.dart';
import 'package:wasteless/core/utils/media_query.dart';
import '../../../../../core/utils/assets_path.dart';
import '../../../../../core/utils/language.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/dialog_button.dart';
import '../../../../../core/widgets/scaffold_blue_background.dart';
import '../../../settings/presentation/screens/profile_screen.dart';

class DriverHomeScreen extends StatefulWidget {
  static const String id = 'driver_home_screen';
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  late double? lat;
  late double? long;
  String locationMessage = '';
  late bool accessLocation = true;
  late DatabaseReference ref;
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location P are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('location P are permanently denied ');
    }
    _liveLocation();
    return Geolocator.getCurrentPosition();
  }

  void _liveLocation() async {
    LocationSettings locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.bestForNavigation, distanceFilter: 2);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((position) async {
      lat = position.latitude;
      long = position.longitude;
      setState(() {
        locationMessage =
            'latitude: ${lat.toString()} , longitude: ${long.toString()}';
      });
      await ref.update({
        "lat": position.latitude,
        "lng": position.longitude,
      });
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
      children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Image.asset(
              WASTELESS_LOGO,
              height: context.height * 0.4,
            ),
          ),
          //Text(locationMessage),
          SizedBox(
            height: context.height * 0.06,
          ),
          StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as dynamic;
                List<dynamic> list = map.values.toList();
                return InkWell(
                    onTap: () => Navigator.of(context)
                            .pushNamed(ProfileScreen.id, arguments: {
                          "fullName": list[5],
                          "image": list[1],
                          "email": list[7],
                          "qr": list[2]
                        }),
                    child: Visibility(
                      visible: accessLocation ? false : true,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '${list[5]} \n \n ${list[6]}',
                            style: anyColorSize16(WHITE),
                          ),
                          SizedBox(
                            width: context.width * 0.04,
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(list[1]),
                            backgroundColor: WHITE,
                            radius: 55,
                          )
                        ],
                      ),
                    ));
              }),
          Visibility(
              visible: accessLocation,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    height: context.height * 0.34,
                    width: context.width * 0.85,
                    decoration: BoxDecoration(
                        color: LIGHT_BLUE,
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        Text(
                          translations(context).trun_gps_on,
                          textAlign: TextAlign.center,
                          style: BOLD_24,
                        ),
                        SizedBox(
                          height: context.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DialogButton(
                              width: 0.7,
                              color: GREEN,
                              title: translations(context).yes,
                              onTap: () {
                                _getCurrentLocation().then((value) {
                                  lat = value.latitude;
                                  long = value.longitude;
                                  setState(() {
                                    locationMessage =
                                        'latitude: ${lat.toString()} , longitude: ${long.toString()}';
                                    accessLocation = true;
                                  });
                                  _liveLocation();
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
              ))
        ])
      ],
    ));
  }
}
