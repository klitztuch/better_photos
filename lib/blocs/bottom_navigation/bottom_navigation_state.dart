part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends BottomNavigationState {
  final PageIndex currentPage;

  CurrentIndexChanged({required this.currentPage});

  @override
  String toString() => 'CurrentIndexChanged to $currentPage';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class GalleryPageLoaded extends BottomNavigationState {
  final String text;

  GalleryPageLoaded({required this.text});

  @override
  String toString() => 'GalleryPageLoaded with text: $text';
}

class SettingsPageLoaded extends BottomNavigationState {
  final int number;

  SettingsPageLoaded({required this.number});

  @override
  String toString() => 'SettingsPageLoaded with number: $number';
}