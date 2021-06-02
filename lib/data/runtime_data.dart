class RuntimeData {
  static bool initialized = false;
  static String logsFolder = "/synced_logs/";

  /// the domain of the server, for example: 'logsingest.codingshadows.com'
  static String apiLogsServer = "";

  /// send only one log at a time to ingest, for example 'api/save/log'
  static String apiLogsEndpoint = "";

  /// send a list of logs to ingest, for example 'api/save/bulk/log'
  static String apiBulkLogsEndpoint = "";
}
