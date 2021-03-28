part of 'gallery_bloc.dart';

class GalleryState extends BottomNavigationState {
  final String text;

  GalleryState({required this.text});

  @override
  String toString() {
    return 'GalleryState loaded with text: $text';
  }
}