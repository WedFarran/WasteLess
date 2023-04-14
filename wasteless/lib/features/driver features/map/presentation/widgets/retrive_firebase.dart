import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RetrieveFirebase {
  var user = FirebaseAuth.instance.currentUser;
  var userId = user!.uid;
  DatabaseReference bin1Ref = FirebaseDatabase.instance.ref('bin/bin1');
  DatabaseReference bin2Ref = FirebaseDatabase.instance.ref('bin/bin2');

// Retrieve data for bin1
  bin1Ref.once().then(
  (DataSnapshot snapshot) {
  Map<dynamic, dynamic> bin1Data = snapshot.value;
  String driverId = bin1Data['driverId'];
  String fullnesTime = bin1Data['fullnesTime'];
  double lat = bin1Data['lat'];
  double lng = bin1Data['lng'];
  bool status = bin1Data['status'];
  double wasteLevel = bin1Data['wasteLevel'];

// Do something with the data for bin1
  });

// Retrieve data for bin2
  bin2Ref.once().then((DataSnapshot snapshot) {
  Map<dynamic, dynamic> bin2Data = snapshot.value;
  String driverId = bin2Data['driverId'];
  String fullnesTime = bin2Data['fullnesTime'];
  double lat = bin2Data['lat'];
  double lng = bin2Data['lng'];
  bool status = bin2Data['status'];
  double wasteLevel = bin2Data['wasteLevel'];

// Do something with the data for bin2
  });
}



