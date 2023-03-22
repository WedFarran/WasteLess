import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/utils/database.dart';
import '../models/bin_model.dart';
import '../models/driver_model.dart';

abstract class MapRemoteDataSource {
  Future<Map<String, dynamic>> getAllAdminMapItems();
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final http.Client client;

  MapRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> getAllAdminMapItems() async {
    Future<List<AdminMapBinModel>> binsList =
        (await getAllMapBins()) as Future<List<AdminMapBinModel>>;
    Future<List<AdminMapDriverModel>> driversList =
        (await getAllMapDrivers()) as Future<List<AdminMapDriverModel>>;
    Map<String, dynamic> adminMapItems = {
      'bins': binsList,
      'drivers': driversList
    };
    return adminMapItems;
  }

  Future<List<AdminMapBinModel>> getAllMapBins() async {
    final response = await client.get(
      Uri.parse(DB_URL + BIN),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<AdminMapBinModel> mapBinsModel = decodeJson
          .map<AdminMapBinModel>(
              (jsonMapBinModel) => AdminMapBinModel.fromJson(jsonMapBinModel))
          .toList();
      return mapBinsModel;
    } else {
      throw ServerException();
    }
  }

  Future<List<AdminMapDriverModel>> getAllMapDrivers() async {
    final response = await client.get(
      Uri.parse(DB_URL + DRIVER),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodeJson = json.decode(response.body) as List;
      final List<AdminMapDriverModel> mapDriverModel = decodeJson
          .map<AdminMapDriverModel>((jsonMapDriverModel) =>
              AdminMapDriverModel.fromJson(jsonMapDriverModel))
          .toList();
      return mapDriverModel;
    } else {
      throw ServerException();
    }
  }
}
