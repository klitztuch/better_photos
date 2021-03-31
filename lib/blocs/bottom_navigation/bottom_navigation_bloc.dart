import 'dart:async';

import 'package:better_photos/blocs/gallery/gallery_bloc.dart';
import 'package:better_photos/repositories/models/page.dart';
import 'package:better_photos/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


part 'bottom_navigation_event.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final GalleryRepository galleryRepository;
  final SettingsRepository settingsRepository;
  PageIndex currentPage = PageIndex.GalleryPage;

  BottomNavigationBloc(
      {required this.galleryRepository, required this.settingsRepository})
      : super(PageLoading());

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(page: this.currentPage));
    }

    if (event is PageTapped) {
      currentPage = event.page;
      yield CurrentIndexChanged(currentPage: currentPage);
      yield PageLoading();

      switch (currentPage) {
        case PageIndex.GalleryPage:
          {
            String data = await _getGalleryPageData();
            List<Image> imageData = await _getGalleryPageImages();
            yield GalleryState(text: data, images: imageData);
          }
          break;

        case PageIndex.SettingsPage:
          {
            int data = await _getSettingsPageData();
            yield SettingsPageLoaded(number: data);
          }
          break;
      }
    }
  }

  Future<String> _getGalleryPageData() async {
    return await galleryRepository.fetchData();
  }

  Future<int> _getSettingsPageData() async {
    return await settingsRepository.fetchData();
  }

  Future<List<Image>> _getGalleryPageImages() async {
    return await galleryRepository.fetchImages();
  }
}
