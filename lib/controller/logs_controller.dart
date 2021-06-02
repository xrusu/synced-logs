import 'package:synced_logs/model/log_status_codes.dart';
import 'package:synced_logs/model/synced_log.dart';

class LogsController {
  static Future<int> saveLog(SyncedLog log) async {
    int statusCode = await saveLogLocally(log);
    if (statusCode == LogStatusCodes.SAVED_LOCALLY) {
      statusCode = await saveLogOnServer(log);
      if (statusCode == LogStatusCodes.NOT_UPLOADED) statusCode = LogStatusCodes.SAVED_LOCALLY;
    }
    return statusCode;
  }

  static Future<int> saveLogLocally(SyncedLog log) async {
    return LogStatusCodes.NOT_SAVED;
  }

  static Future<int> saveLogOnServer(SyncedLog log) async {
    return LogStatusCodes.NOT_UPLOADED;
  }

  static Future<int> saveLocalLogsOnServer() async {
    return LogStatusCodes.NOT_UPLOADED;
  }
}
