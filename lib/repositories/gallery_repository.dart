import 'package:better_photos/repositories/api/nextcloud_service.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryRepository {
  late String _data;
  late List<Image> _images;
  late NextcloudService _nextcloudService;

  Future<String> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Gallery Page';
    return _data;
  }

  Future<List<Image>> fetchImages() async {
    final prefs = await SharedPreferences.getInstance();
    
    var nextcloudHost = prefs.getString('nextcloud_host');
    var nextcloudAppPassword = prefs.getString('nextcloud_appPassword');
    _nextcloudService = NextcloudService(nextcloudHost!, nextcloudAppPassword!);
    var images = await _nextcloudService.getImages();
    _images = images.map((e) => Image.network(e)).toList();
    return _images;
  }
}
