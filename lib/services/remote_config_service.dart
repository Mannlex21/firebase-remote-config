import 'dart:convert';

import 'package:demo_firebase_config/models/theme.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigService {
  static final FirebaseRemoteConfig remoteConfig =
      FirebaseRemoteConfig.instance;

  static Future<void> initialize() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(
          seconds: 1), // a fetch will wait up to 10 seconds before timing out
      minimumFetchInterval: Duration
          .zero, // fetch parameters will be cached for a maximum of 1 hour
    ));

    await remoteConfig.fetchAndActivate();
  }

  ThemeFirebase? getTheme() {
    String text = RemoteConfigService.remoteConfig.getString('theme');
    print(text.isNotEmpty);
    if (text.isNotEmpty && jsonDecode(text) != null) {
      // var encodedString = jsonEncode(text);

      // Map<String, dynamic> valueMap = json.decode(encodedString);

      ThemeFirebase theme = ThemeFirebase.fromJson(jsonDecode(text));
      return theme;
    } else {
      return null;
    }
  }

  bool isBannerVisible() {
    return RemoteConfigService.remoteConfig.getBool('banner');
  }
}
