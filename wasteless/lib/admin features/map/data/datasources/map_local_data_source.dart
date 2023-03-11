import 'package:dartz/dartz.dart';

abstract class MapLocalDataSource {
  Future<List> getCachedMaoItems();
  Future<Unit> cacheMapItems(List mapItems);
}

class MapLocalDataSourceImpl implements MapLocalDataSource{
  @override
  Future<Unit> cacheMapItems(List mapItems) {
    // TODO: implement cacheMapItems
    throw UnimplementedError();
  }

  @override
  Future<List> getCachedMaoItems() {
    // TODO: implement getCachedMaoItems
    throw UnimplementedError();
  }

}