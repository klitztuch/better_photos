import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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