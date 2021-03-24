part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object?> get props => props;
}

class DemoEvent extends GalleryEvent {
  @override
  String toString() {
    return 'demo event';
  }
}