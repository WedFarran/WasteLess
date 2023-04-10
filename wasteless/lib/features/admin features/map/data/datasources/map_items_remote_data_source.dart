import 'package:firebase_database/firebase_database.dart';
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/errors/failure.dart';
import 'package:wasteless/features/admin%20features/map/data/models/bins_models.dart';
import 'package:wasteless/features/admin%20features/map/data/models/driver_models.dart';
import 'package:http/http.dart' as http;

abstract class MapItemsRemoteDataSource {
  //Future<Map<String, dynamic>> getAllMapItems();
  Future<List<BinsModel>> getAllMapBins();
  Future<List<DriversModel>> getAllMapDrivers();
}

const url =
    'https://wasteless-36ce0-default-rtdb.asia-southeast1.firebasedatabase.app/bin/';
const url1 =
    'https://wasteless-36ce0-default-rtdb.asia-southeast1.firebasedatabase.app/driver/';

class MapItemsRemoteSourceImp implements MapItemsRemoteDataSource {
  final http.Client client;

  MapItemsRemoteSourceImp({required this.client});
  @override
  Future<List<BinsModel>> getAllMapBins() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("bin");
    Stream<DatabaseEvent> stream = ref.onValue;
    final List<BinsModel> list = [];
    stream.listen((DatabaseEvent event) {
      print('Event Type: ${event.type}'); // DatabaseEventType.value;
      print('Snapshot: ${event.snapshot}'); // DataSnapshot
    });

    try {
      return list;
    } on ServerException {
      ServerFailure();
    }
    return list;
    /* final response = await client
        .get(Uri.parse(url), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<BinsModel> binsModel = decodedJson
          .map<BinsModel>((jsonBinModel) => BinsModel.fromJson(jsonBinModel))
          .toList();
      //  print('wed wed wed wed wed wedw  $binsModel');
      return binsModel;
    } else {
      throw ServerException();
    }*/
  }

  @override
  Future<List<DriversModel>> getAllMapDrivers() async {
    final List<DriversModel> list = [];
    final snapshot = await FirebaseDatabase.instance.ref('driver').get();

    final map = snapshot.value as Map<dynamic, dynamic>;
    map.forEach((key, value) {
      list.add(DriversModel(
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

    /* map.forEach((key, value) {
      final driver = DriversModel.fromMap(value);

      list.add(driver);
    });*/
    try {
      return list;
    } on ServerException {
      ServerFailure();
    }
    return list;
    /*  final response = await client
        .get(Uri.parse(url1), headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<DriversModel> driversModel = decodedJson
          .map<DriversModel>(
              (jsondriverModel) => DriversModel.fromJson(jsondriverModel))
          .toList();
      //print('wed wed wed wed wed wedw  $driversModel');
      return driversModel;
    } else {
      throw ServerException();
    }*/
  }
}
