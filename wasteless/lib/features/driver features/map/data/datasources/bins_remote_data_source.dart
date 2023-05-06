import 'dart:async';
import 'dart:convert';
import 'package:wasteless/core/errors/exception.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/common/data/models/bins_models.dart';

abstract class BinsRemoteDataSource {
  Future<List<BinsModel>> getAllBins();
}

// ignore: constant_identifier_names
const BASE_URL = "https://jsonplaceholder.typicode.com";

class BinsRemoteDataSourceImpl implements BinsRemoteDataSource {
  final http.Client client;

  BinsRemoteDataSourceImpl({required this.client});
  @override
  Future<List<BinsModel>> getAllBins() async {
    final respnse = await client.get(
      // ignore: prefer_interpolation_to_compose_strings
      Uri.parse(BASE_URL + "/driverMap"),
      headers: {"Content-Type": "application/json"},
    );

    if (respnse.statusCode == 200) {
      final List decodeJson = json.decode(respnse.body) as List;
      final List<BinsModel> driverMapModels = decodeJson
          .map<BinsModel>(
              (jsonDriverMapModel) => BinsModel.fromJson(jsonDriverMapModel))
          .toList();

      return driverMapModels;
    } else {
      throw ServerException();
    }
  }
}
