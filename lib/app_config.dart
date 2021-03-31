import 'dart:convert';

import 'package:flutter/services.dart';

class AppConfig {
  final String nextcloudHost;
  final String nextcloudApppassword;

  AppConfig(this.nextcloudHost, this.nextcloudApppassword);

  static Future<AppConfig> forEnvironment(String? env) async {
    // set default to dev if nothing was passed
    env = env ?? 'dev';

    // load the json file
    final contents = await rootBundle.loadString(
      'assets/$env.json',
    );

    // decode our json
    final json = jsonDecode(contents);

    // convert our JSON into an instance of our AppConfig class
    return AppConfig(json['NEXTCLOUD_HOST'], json['NEXTCLOUD_APPPASSWORD']);
  }
}
