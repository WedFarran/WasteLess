import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wasteless/features/admin%20features/map/data/models/bins_models.dart';

class BinRemoteDataSource extends ChangeNotifier {
  final List<BinsModel> _binsList = [];
  List<BinsModel> get binsList => _binsList;
  getAllBins() {
    DatabaseReference dbBins = FirebaseDatabase.instance.ref("bin");
    Stream<DatabaseEvent> streamBins = dbBins.onValue;
    streamBins.listen((DatabaseEvent event) {
      Map<String, dynamic> binsMap =
          Map<String, dynamic>.from(event.snapshot.value as Map);

      binsMap.forEach((key, value) {
        _binsList.add(BinsModel(
          id: key,
          fullnesTime: value['fullnesTime'],
          wasteLevel: value['wasteLevel'],
          lat: value['lat'],
          lng: value['lng'],
          status: value['status'],
        ));
      });

      notifyListeners();
    });
  }
}
