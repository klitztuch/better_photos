class GalleryRepository {
  late String _data;

  Future<String> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Gallery Page';
    return _data;
  }
}
