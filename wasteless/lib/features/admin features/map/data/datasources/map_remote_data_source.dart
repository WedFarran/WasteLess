import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/core/utils/database.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/bin_entity.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/driver_entity.dart';
import '../models/bin_model.dart';
import '../models/driver_model.dart';

abstract class MapRemoteDataSource {
  Future<Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>
      getAllAdminMapItems();
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  final http.Client client;

  MapRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>
      getAllAdminMapItems() async {
    Future<List<AdminMapBinModel>> binsList =
        (await getAllMapBins()) as Future<List<AdminMapBinModel>>;
    Future<List<AdminMapDriverModel>> driversList =
        (await getAllMapDrivers()) as Future<List<AdminMapDriverModel>>;
    Future<Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>
        adminMapItems = {'bins': binsList, 'drivers': driversList}
            as Future<Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>;
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
