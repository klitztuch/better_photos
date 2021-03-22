part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object?> get props => props;
}

class AppStarted extends BottomNavigationEvent {
  @override
  String toString() {
    return 'AppStarted';
  }
}

class PageTapped extends BottomNavigationEvent {
  final PageIndex page;

  PageTapped({required this.page});

  @override
  String toString() {
    return 'PageTapped: $page';
  }
}
