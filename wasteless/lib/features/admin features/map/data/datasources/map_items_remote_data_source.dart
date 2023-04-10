import 'dart:convert';

import 'package:wasteless/core/errors/exception.dart';
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
    //final ref = FirebaseDatabase.instance.ref('bin');
    final response = await client
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
    }
  }

  @override
  Future<List<DriversModel>> getAllMapDrivers() async {
    final response = await client
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
    }
  }
}
