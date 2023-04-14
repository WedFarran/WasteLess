import 'package:firebase_database/firebase_database.dart';

class RetrieveFirebase {
  final databaseReference = FirebaseDatabase.instance.reference();
  String driverId = "UAz9G0lKpmRZZjISV0fbbbtix943";

  RetrieveFirebase({required this.driverId}) {
    databaseReference.child('bin/bin1').orderByChild('driverId').equalTo(driverId).onValue.listen((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      print('Data : ${snapshot.value}');
    });

    databaseReference.child('bin/bin2').orderByChild('driverId').equalTo(driverId).onValue.listen((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      print('Data : ${snapshot.value}');
    });
  }
}


