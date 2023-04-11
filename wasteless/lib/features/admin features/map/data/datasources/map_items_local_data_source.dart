import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasteless/core/errors/exception.dart';

abstract class MapItemsLocalDataSource {
  Future<Map<String, dynamic>> getChachedMapItems();
  Future<Unit> cacheMapItems(Map<String, dynamic> mapItems);
}

class MapItemsLocalDataSourceImpl implements MapItemsLocalDataSource {
  final SharedPreferences sharedPreferences;
  MapItemsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheMapItems(Map<String, dynamic> mapItems) {
    sharedPreferences.setString("CACHED_MAP_ITEMS", json.encode(mapItems));
    return Future.value(unit);
  }

  @override
  Future<Map<String, dynamic>> getChachedMapItems() {
    final jsonString = sharedPreferences.getString("CACHED_MAP_ITEMS");
    if (jsonString != null) {
      Map<String, dynamic> mapItems = json.decode(jsonString);
      return Future.value(mapItems);
    } else {
      throw EmptyCacheException();
    }
  }
}
