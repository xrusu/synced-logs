import 'package:synced_logs/model/log_status_codes.dart';
import 'package:synced_logs/model/synced_log.dart';

class LogsController {
  /*
  *
  * Saves the log locally and on the server
  * Returns a status code, that represents the state of the log
  * If successful, the returned code will be LogStatusCodes.SAVED_ON_SERVER
  * If the operation failed, the returned code will be LogStatusCodes.NOT_SAVED
  * If the log was only saved locally, the returned code will be LogStatusCodes.SAVED_LOCALLY
  *
   */
  static Future<int> saveLog(SyncedLog log) async {
    int statusCode = await saveLogLocally(log);
    if (statusCode == LogStatusCodes.SAVED_LOCALLY) {
      statusCode = await saveLogOnServer(log);
      if (statusCode == LogStatusCodes.NOT_UPLOADED) statusCode = LogStatusCodes.SAVED_LOCALLY;
    }
    return statusCode;
  }

  /*
  *
  * Saves the log locally only
  * Returns a status code, that represents the state of the log
  * If successful, the returned code will be LogStatusCodes.SAVED_LOCALLY
  * If the operation failed, the returned code will be LogStatusCodes.NOT_SAVED
  *
   */
  static Future<int> saveLogLocally(SyncedLog log) async {
    return LogStatusCodes.NOT_SAVED;
  }

  /*
  *
  * Saves the log only on the server
  * Returns a status code, that represents the state of the log
  * If successful, the returned code will be LogStatusCodes.SAVED_ON_SERVER
  * If the operation failed, the returned code will be LogStatusCodes.NOT_UPLOADED
  *
   */
  static Future<int> saveLogOnServer(SyncedLog log) async {
    return LogStatusCodes.NOT_UPLOADED;
  }

  /*
  *
  * Force recheck of server-unsaved logs
  * Returns a status code, that represents the state of the unsaved logs
  * If successful, the returned code will be LogStatusCodes.SAVED_ON_SERVER
  * If the operation failed, the returned code will be LogStatusCodes.NOT_UPLOADED
  *
   */
  static Future<int> saveLocalLogsOnServer() async {
    return LogStatusCodes.NOT_UPLOADED;
  }
}
