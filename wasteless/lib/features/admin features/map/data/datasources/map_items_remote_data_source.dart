import 'package:wasteless/core/errors/exception.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:wasteless/core/errors/failure.dart';
import 'package:http/http.dart' as http;
import '../../../../../core/model/bins_models.dart';
import '../../../../../core/model/driver_models.dart';

abstract class MapItemsRemoteDataSource {
  List<BinsModel> getAllMapBins();
  List<DriversModel> getAllMapDrivers();
}

class MapItemsRemoteSourceImp implements MapItemsRemoteDataSource {
  final http.Client client;

  MapItemsRemoteSourceImp({required this.client});
  @override
  List<BinsModel> getAllMapBins() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("bin");
    Stream<DatabaseEvent> streamBins = ref.onValue;
    final List<BinsModel> binsList = [];
    try {
      streamBins.listen((DatabaseEvent event) {
        Map<String, dynamic> binsMap =
            Map<String, dynamic>.from(event.snapshot.value as Map);

        binsMap.forEach((key, value) {
          binsList.add(BinsModel(
              id: key,
              fullnesTime: value['fullnesTime'],
              wasteLevel: value['wasteLevel'],
              lat: value['lat'],
              lng: value['lng'],
              status: value['status']));
        });
      });
      return binsList;
    } on ServerException {
      ServerFailure();
    }
    return binsList;
  }

  @override
  List<DriversModel> getAllMapDrivers() {
    final List<DriversModel> driversList = [];
    DatabaseReference ref = FirebaseDatabase.instance.ref("bin");
    Stream<DatabaseEvent> streamDrivers = ref.onValue;
    try {
      streamDrivers.listen((DatabaseEvent event) {
        Map<String, dynamic> driversMap =
            Map<String, dynamic>.from(event.snapshot.value as Map);

        driversMap.forEach((key, value) {
          driversList.add(DriversModel(
              id: key,
              area: value['area'],
              email: value['email'],
              fullName: value['fullName'],
              idNumber: value['idNumber'],
              image: value['image'],
              lat: value['lat'],
              lng: value['lng'],
              nationality: value['nationality'],
              qR: value['qR']));
        });
      });
      return driversList;
    } on ServerException {
      ServerFailure();
    }
    return driversList;
  }
}
