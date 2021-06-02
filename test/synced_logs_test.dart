import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:synced_logs/controller/local_logs_controller.dart';
import 'package:synced_logs/model/synced_log.dart';
import 'package:synced_logs/synced_logs.dart';

void main() {
  const MethodChannel channel = MethodChannel('synced_logs');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await SyncedLogs.platformVersion, '42');
  });

  test('logLocalSaving', () async {
    SyncedLogs.init(apiLogsServer: 'logsingest.codingshadows.com', apiLogsEndpoint: 'api/save/log', apiBulkLogsEndpoint: 'api/save/bulk/log');
    for (int i = 0; i < 50; i++) {
      await LocalLogsController.saveLogLocally(new SyncedLog(tag: "LOG_TAG", otherInfo: "OTHER_LOG_INFO " + i.toString()));
    }

    //print(await LocalLogsController.getAllLocalLogs());
    //expect(await LocalLogsController.getAllLocalLogs(), '42');
  });
}
