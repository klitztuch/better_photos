import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final String text;
  final List<Image> images;

  GalleryPage({required this.text, required this.images}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        GridView.count(crossAxisCount: 4,
          children: images,)
    );
  }
}
