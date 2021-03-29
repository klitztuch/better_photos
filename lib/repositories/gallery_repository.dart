
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class GalleryRepository {
  late String _data;
  late List<Image> _images;

  Future<String> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));
    _data = 'Gallery Page';
    return _data;
  }

  Future<List<Image>> fetchImages() async {
    //TODO: implement real image service
    await Future.delayed(Duration(milliseconds: 600));
    _images = <Image>[];
    return _images;
  }
}
