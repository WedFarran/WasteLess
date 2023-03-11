abstract class MapRemoteDataSource {
  Future<List> getAllMapItems();
  Future<List> filterMapItems(List filterdItems);
  Future<List> displayDetails(String objectType, Object opject);
}

class MapRemoteDataSourceImpl implements MapRemoteDataSource {
  @override
  Future<List> displayDetails(String objectType, Object opject) {
    // TODO: implement displayDetails
    throw UnimplementedError();
  }

  @override
  Future<List> filterMapItems(List filterdItems) {
    // TODO: implement filterMapItems
    throw UnimplementedError();
  }

  @override
  Future<List> getAllMapItems() {
    // TODO: implement getAllMapItems
    throw UnimplementedError();
  }
}
