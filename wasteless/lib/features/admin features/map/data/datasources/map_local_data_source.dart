import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasteless/core/errors/exception.dart';
import '../../../../../core/utils/database.dart';
import '../models/bin_model.dart';
import '../models/driver_model.dart';

abstract class MapLocalDataSource {
  Future<List<MapBinModel>> getCachedMapBins();
  Future<List<MapDriverModel>> getCachedMapDrivers();
  Future<Unit> cacheMapBins(List<MapBinModel> mapBins);
  Future<Unit> cacheMapDrivers(List<MapDriverModel> mapDrivers);
}

class MapLocalDataSourceImpl implements MapLocalDataSource {
  final SharedPreferences sharedPrefrences;
  MapLocalDataSourceImpl({required this.sharedPrefrences});

  @override
  Future<Unit> cacheMapBins(List<MapBinModel> mapBins) {
    List mapBinsModelsToJson = mapBins
        .map<Map<String, dynamic>>((mapBins) => mapBins.toJson())
        .toList();
    sharedPrefrences.setString(
        CACHED_MAP_BINS, json.encode(mapBinsModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheMapDrivers(List<MapDriverModel> mapDrivers) {
    List mapItemsModelsToJson = mapDrivers
        .map<Map<String, dynamic>>((mapDrivers) => mapDrivers.toJson())
        .toList();
    sharedPrefrences.setString(
        CACHED_MAP_DRIVERS, json.encode(mapItemsModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<MapBinModel>> getCachedMapBins() {
    final jsonString = sharedPrefrences.getString(CACHED_MAP_BINS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<MapBinModel> jsonToMapBins = decodeJsonData
          .map((jsonMapBins) => MapBinModel.fromJson(jsonMapBins))
          .toList();
      return Future.value(jsonToMapBins);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<List<MapDriverModel>> getCachedMapDrivers() {
    final jsonString = sharedPrefrences.getString(CACHED_MAP_DRIVERS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<MapDriverModel> jsonToMapDrivers = decodeJsonData
          .map((jsonMapDrivers) => MapDriverModel.fromJson(jsonMapDrivers))
          .toList();
      return Future.value(jsonToMapDrivers);
    } else {
      throw EmptyCacheException();
    }
  }
}
