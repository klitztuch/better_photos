import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  final String text;

  GalleryPage({required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Text('My Text is $text.'),
      ),
    );
  }
}
