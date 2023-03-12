import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/utils/database.dart';
import '../models/bin_model.dart';
import '../models/driver_model.dart';

abstract class MapRemoteDataSource {
  Future<List<MapDriverModel>> getAllMapDrivers();
  Future<List<MapBinModel>> getAllMapBins();
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final http.Client client;

  MapRemoteDataSourceImpl({required this.client});

  @override
  Future<List<MapBinModel>> getAllMapBins() async {
    final response = await client.get(
      Uri.parse(DB_URL + BIN),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<MapBinModel> mapBinsModel = decodeJson
          .map<MapBinModel>(
              (jsonMapBinModel) => MapBinModel.fromJson(jsonMapBinModel))
          .toList();
      return mapBinsModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MapDriverModel>> getAllMapDrivers() async {
    final response = await client.get(
      Uri.parse(DB_URL + DRIVER),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<MapDriverModel> mapDriverModel = decodeJson
          .map<MapDriverModel>((jsonMapDriverModel) =>
              MapDriverModel.fromJson(jsonMapDriverModel))
          .toList();
      return mapDriverModel;
    } else {
      throw ServerException();
    }
  }
}
