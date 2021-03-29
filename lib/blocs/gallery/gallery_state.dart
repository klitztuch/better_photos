part of 'gallery_bloc.dart';

class GalleryState extends BottomNavigationState {
  final String text;
  final List<Image> images;

  GalleryState({required this.text, required this.images});

  @override
  String toString() {
    return 'GalleryState loaded with text: $text';
  }
}