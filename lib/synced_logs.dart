import 'dart:async';

import 'package:flutter/services.dart';
import 'package:synced_logs/controller/init_controller.dart';

class SyncedLogs {
  static const MethodChannel _channel = const MethodChannel('synced_logs');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<bool> init({String? apiLogsServer, String? apiLogsEndpoint, String? apiBulkLogsEndpoint}) async {
    return InitController.init(apiLogsServer: apiLogsServer, apiLogsEndpoint: apiLogsEndpoint, apiBulkLogsEndpoint: apiBulkLogsEndpoint);
  }
}
