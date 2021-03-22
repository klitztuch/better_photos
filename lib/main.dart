import 'package:better_photos/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:better_photos/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/app_screen.dart';

class SimpleBlocObserver extends BlocObserver {
  Logger _logger = Logger((SimpleBlocObserver).toString());

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _logger.info(transition);
  }
}

void main() async {
  // Logger configuration
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  // Observer initialization
  Bloc.observer = SimpleBlocObserver();

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc(
            galleryRepository: GalleryRepository(),
            settingsRepository: SettingsRepository())
          ..add(AppStarted()),
        child: AppScreen(),
      ),
    );
  }
}
