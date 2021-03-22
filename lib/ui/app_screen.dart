import 'package:better_photos/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:better_photos/repositories/models/page.dart';
import 'package:better_photos/ui/pages/gallery_page.dart';
import 'package:better_photos/ui/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template counter_app}
/// A [StatelessWidget] which sets the `home` to [GalleryPage].
/// {@endtemplate}
class AppScreen extends StatelessWidget {
  /// {@macro counter_app}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Better Photos'),
      ),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is GalleryPageLoaded) {
            return GalleryPage(text: state.text);
          }
          if (state is SettingsPageLoaded) {
            return SettingsPage(number: state.number);
          }
          return Container();
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.photo), label: 'Gallery'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ],
            onTap: (index) => context
                .read<BottomNavigationBloc>()
                .add(PageTapped(page: PageIndex.values[index])),
            currentIndex: context.select(
                (BottomNavigationBloc value) => value.currentPage.index),
          );
        },
      ),
    );
  }
}
