import 'dart:math';

class SettingsRepository {
  late String _data;

  Future<int> fetchData() async {
    await Future.delayed(Duration(milliseconds: 600));

    return Random().nextInt(1000);
  }

  String get data => _data;
}
