import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasteless/core/errors/exception.dart';
import '../../../../../core/utils/database.dart';

abstract class MapLocalDataSource {
  Future<Map<String, dynamic>> getCachedAdminMapItems();
  //Future<List<AdminMapDriverModel>> getCachedMapDrivers();
  Future<Unit> cacheAdminMapItems(Map<String, dynamic> mapItems);
  //Future<Unit> cacheMapDrivers(List<AdminMapDriverModel> mapDrivers);
}

class MapLocalDataSourceImpl implements MapLocalDataSource {
  final SharedPreferences sharedPrefrences;
  MapLocalDataSourceImpl({required this.sharedPrefrences});

  @override
  Future<Unit> cacheAdminMapItems(Map<String, dynamic> mapItems) {
    //need to getback to it
    /*List mapItemsModelsToJson = mapItems
        .map<Map<String, dynamic>>((mapBins) => mapBins.toJson())
        .toList();*/
    sharedPrefrences.setString(CACHED_MAP_ITEMS, json.encode(mapItems));
    return Future.value(unit);
  }

  @override
  Future<Map<String, dynamic>> getCachedAdminMapItems() {
    final jsonString = sharedPrefrences.getString(CACHED_MAP_ITEMS);
    if (jsonString != null) {
      Map<String, dynamic> decodeJsonData = json.decode(jsonString);
      /*List<AdminMapBinModel> jsonToMapBins = decodeJsonData
          .map((jsonMapBins) => AdminMapBinModel.fromJson(jsonMapBins))
          .toList();*/
      return Future.value(decodeJsonData);
    } else {
      throw EmptyCacheException();
    }
  }

  /* @override
  Future<Unit> cacheMapBins(List<AdminMapBinModel> mapBins) {
    List mapBinsModelsToJson = mapBins
        .map<Map<String, dynamic>>((mapBins) => mapBins.toJson())
        .toList();
    sharedPrefrences.setString(
        CACHED_MAP_BINS, json.encode(mapBinsModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<Unit> cacheMapDrivers(List<AdminMapDriverModel> mapDrivers) {
    List mapItemsModelsToJson = mapDrivers
        .map<Map<String, dynamic>>((mapDrivers) => mapDrivers.toJson())
        .toList();
    sharedPrefrences.setString(
        CACHED_MAP_DRIVERS, json.encode(mapItemsModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<AdminMapBinModel>> getCachedMapBins() {
    final jsonString = sharedPrefrences.getString(CACHED_MAP_BINS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<AdminMapBinModel> jsonToMapBins = decodeJsonData
          .map((jsonMapBins) => AdminMapBinModel.fromJson(jsonMapBins))
          .toList();
      return Future.value(jsonToMapBins);
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<List<AdminMapDriverModel>> getCachedMapDrivers() {
    final jsonString = sharedPrefrences.getString(CACHED_MAP_DRIVERS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<AdminMapDriverModel> jsonToMapDrivers = decodeJsonData
          .map((jsonMapDrivers) => AdminMapDriverModel.fromJson(jsonMapDrivers))
          .toList();
      return Future.value(jsonToMapDrivers);
    } else {
      throw EmptyCacheException();
    }
  }*/
}
