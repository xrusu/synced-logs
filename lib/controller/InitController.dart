import 'package:synced_logs/data/RuntimeData.dart';

class InitController {
  static Future<void> init() async {
    RuntimeData.initialized = true;
  }
}
