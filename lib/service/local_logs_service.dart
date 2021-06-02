import 'dart:io';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:synced_logs/data/runtime_data.dart';
import 'package:synced_logs/model/log_status_codes.dart';
import 'package:synced_logs/model/synced_log.dart';

class LocalLogsService {
  static List<SyncedLog> localLogsQueue = [];

  static Future<void> saveLogLocally(SyncedLog log) async {
    localLogsQueue.add(log);
    await _saveLogsFromQueue();
  }

  //TODO REFACTOR THIS, SAVE LOGS IN THE all_local_server_unsaved_logs.json FILE ONLY IF THE SERVER SAVE FAILS
  static Future<void> _saveLogsFromQueue() async {
    List<SyncedLog> _currentLogsQueue = new List.from(localLogsQueue);
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String logsPath = appDocDir.path + RuntimeData.logsFolder;
    File allLocalLogsFile = new File(logsPath + "all_local_logs.json");
    File allLocalServerUnsavedLogsFile = new File(logsPath + "all_local_server_unsaved_logs.json");
    if (!allLocalLogsFile.existsSync()) allLocalLogsFile.createSync(recursive: true);
    if (!allLocalServerUnsavedLogsFile.existsSync()) allLocalServerUnsavedLogsFile.createSync(recursive: true);
    for (SyncedLog log in _currentLogsQueue) {
      if (allLocalLogsFile.lengthSync() == 0) {
        await allLocalLogsFile.writeAsString(json.encode(log), mode: FileMode.writeOnlyAppend);
        await allLocalServerUnsavedLogsFile.writeAsString(json.encode(log), mode: FileMode.writeOnlyAppend);
      } else {
        await allLocalLogsFile.writeAsString("," + json.encode(log), mode: FileMode.writeOnlyAppend);
        await allLocalServerUnsavedLogsFile.writeAsString("," + json.encode(log), mode: FileMode.writeOnlyAppend);
      }

      localLogsQueue.remove(log);
    }
  }

  static Future<List<SyncedLog>> getAllLocalLogs() async {
    List<SyncedLog> allLocalLogs = [];
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String logsPath = appDocDir.path + RuntimeData.logsFolder;
    File allLocalLogsFile = new File(logsPath + "all_local_logs.json");
    // if (!allLocalLogsFile.existsSync()) allLocalLogsFile.create(recursive: true);
    String allLocalLogsRaw = "[" + await allLocalLogsFile.readAsString() + "]";
    //print(allLocalLogsRaw);
    allLocalLogs = json.decode(allLocalLogsRaw).map<SyncedLog>((e) => SyncedLog.fromJson(e)).toList();
    return allLocalLogs;
  }

  static Future<List<SyncedLog>> getAllLocalServerUnsavedLogs() async {
    List<SyncedLog> allLocalServerUnsavedLogs = [];
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String logsPath = appDocDir.path + RuntimeData.logsFolder;
    File allLocalServerUnsavedLogsFile = new File(logsPath + "all_local_server_unsaved_logs.json");
    // if (!allLocalServerUnsavedLogsFile.existsSync()) allLocalServerUnsavedLogsFile.create(recursive: true);
    String allLocalServerUnsavedLogsRaw = await allLocalServerUnsavedLogsFile.readAsString();
    allLocalServerUnsavedLogs = json.decode(allLocalServerUnsavedLogsRaw);
    return allLocalServerUnsavedLogs;
  }

  static Future<int> clearAllLocalLogs() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String logsPath = appDocDir.path + RuntimeData.logsFolder;
    File allLocalLogsFile = new File(logsPath + "all_local_logs.json");
    File allLocalServerUnsavedLogsFile = new File(logsPath + "all_local_server_unsaved_logs.json");
    allLocalLogsFile.delete();
    allLocalServerUnsavedLogsFile.delete();
    return LogStatusCodes.ALL_LOGS_CLEARED;
  }

  static Future<int> clearAllSavedLogs() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String logsPath = appDocDir.path + RuntimeData.logsFolder;
    File allLocalLogsFile = new File(logsPath + "all_local_logs.json");
    allLocalLogsFile.delete();
    return LogStatusCodes.ALL_SAVED_LOGS_CLEARED;
  }
}
