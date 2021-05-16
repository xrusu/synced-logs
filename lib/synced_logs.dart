import 'dart:async';

import 'package:flutter/services.dart';
import 'package:synced_logs/controller/InitController.dart';

class SyncedLogs {
  static const MethodChannel _channel = const MethodChannel('synced_logs');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<void> init() async {
    return InitController.init();
  }
}