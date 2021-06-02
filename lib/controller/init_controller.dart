import 'package:synced_logs/data/RuntimeData.dart';

class InitController {
  static Future<bool> init({String? apiLogsServer, String? apiLogsEndpoint, String? apiBulkLogsEndpoint}) async {
    if (apiLogsServer == null && apiLogsEndpoint == null && apiBulkLogsEndpoint == null) {
      RuntimeData.initialized = false;
      throw ("Api server endpoints not set!");
    } else {
      RuntimeData.apiLogsServer = apiLogsServer!;
      RuntimeData.apiLogsEndpoint = apiLogsEndpoint!;
      RuntimeData.apiBulkLogsEndpoint = apiBulkLogsEndpoint!;
      RuntimeData.initialized = true;
    }
    return RuntimeData.initialized;
  }
}
