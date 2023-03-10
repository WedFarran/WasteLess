import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasteless/core/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WasteLess());
}

class WasteLess extends StatelessWidget {
  const WasteLess({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      title: 'WasteLess',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WasteLess'),
        ),
        body: const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(25.1193, 55.3773),
          ),
        ),
      ),
    );
  }
}
