import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:synced_logs/data/runtime_data.dart';
import 'package:synced_logs/model/synced_log.dart';

class ServerLogsService {
  static Future<int> saveLog(SyncedLog log) async {
    if (RuntimeData.apiLogsServer.trim() != "" && RuntimeData.apiLogsEndpoint.trim() != "") {
      final response = await http.post(
        Uri.https(RuntimeData.apiLogsServer, RuntimeData.apiLogsEndpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(log.toJson()),
      );
      return response.statusCode;
    } else {
      throw ("Api server endpoints not set!");
    }
  }

  static Future<int> saveBulkLog(List<SyncedLog> syncedLogs) async {
    if (RuntimeData.apiLogsServer.trim() != "" && RuntimeData.apiBulkLogsEndpoint.trim() != "") {
      final response = await http.post(
        Uri.https(RuntimeData.apiLogsServer, RuntimeData.apiBulkLogsEndpoint),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(syncedLogs),
      );
      return response.statusCode;
    } else {
      throw ("Api server endpoints not set!");
    }
  }
}
