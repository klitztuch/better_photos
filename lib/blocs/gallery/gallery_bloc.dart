import 'package:better_photos/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState>{
  GalleryBloc(GalleryState initialState) : super(initialState);

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

}