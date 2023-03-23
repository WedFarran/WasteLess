import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasteless/core/errors/exception.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/bin_entity.dart';
import 'package:wasteless/features/admin%20features/map/domain/entities/driver_entity.dart';
import '../../../../../core/utils/database.dart';

abstract class MapLocalDataSource {
  Future<Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>
      getCachedAdminMapItems();
  Future<Unit> cacheAdminMapItems(
      Map<String, List<Either<AdminMapBin, AdminMapDriver>>> mapItems);
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
  Future<Map<String, List<Either<AdminMapBin, AdminMapDriver>>>>
      getCachedAdminMapItems() {
    final jsonString = sharedPrefrences.getString(CACHED_MAP_ITEMS);
    if (jsonString != null) {
      Map<String, List<Either<AdminMapBin, AdminMapDriver>>> decodeJsonData =
          json.decode(jsonString);
      /*List<AdminMapBinModel> jsonToMapBins = decodeJsonData
          .map((jsonMapBins) => AdminMapBinModel.fromJson(jsonMapBins))
          .toList();*/
      return Future.value(decodeJsonData);
    } else {
      throw EmptyCacheException();
    }
  }
}
