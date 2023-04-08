import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:wasteless/core/errors/exception.dart';

import '../models/driver_map_model.dart';
import 'package:http/http.dart' as http;

abstract class BinsRemoteDataSource {
  Future<List<DriverMapModel>> getAllBins();
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class BinsRemoteDataSourceImpl implements BinsRemoteDataSource {
  final http.Client client;

  BinsRemoteDataSourceImpl({required this.client});
  @override
  Future<List<DriverMapModel>> getAllBins() async {
    final respnse = await client.get(
      Uri.parse(BASE_URL + "/driverMap"),
      headers: {"Content-Type": "application/json"},
    );

    if (respnse.statusCode == 200) {
      final List decodeJson = json.decode(respnse.body) as List;
      final List<DriverMapModel> driverMapModels = decodeJson
          .map<DriverMapModel>((jsonDriverMapModel) =>
              DriverMapModel.fromJson(jsonDriverMapModel))
          .toList();

      return driverMapModels;
    } else {
      throw ServerException();
    }
  }
}
