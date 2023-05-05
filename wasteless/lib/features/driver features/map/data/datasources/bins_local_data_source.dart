import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/features/driver%20features/map/data/models/driver_map_model.dart';

abstract class BinsLocalDataSource {
  //this class to create the needed function we will need a function to save all the bins and another function to return the saved bins
  Future<List<BinsModel>> getCachedBins();
  Future<Unit> cachedBins(List<BinsModel> driverMapModel);
}
const CASHED_BINS = "CASHED_BINS";

class BinsLocalDataSourceImpl implements BinsLocalDataSource {
  final SharedPreferences sharedPreferences;

  BinsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cachedBins(List<BinsModel> driverMapModel) {
    List binsModelsToJson = driverMapModel
        .map<Map<String, dynamic>>((driverMapModel) => driverMapModel.toJson())
        .toList();
    sharedPreferences.setString(CASHED_BINS, json.encode(binsModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<BinsModel>> getCachedBins() {
    final jsonString = sharedPreferences.getString(CASHED_BINS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<BinsModel> jsonToDriverMapModels = decodeJsonData
          .map<BinsModel>(
              (jsonDriverModel) => BinsModel.fromJson(jsonDriverModel))
          .toList();
      return Future.value(jsonToDriverMapModels);
    }else{
      throw EmptyCacheException();
    }
  }
}
