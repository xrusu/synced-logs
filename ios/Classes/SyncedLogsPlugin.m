#import "SyncedLogsPlugin.h"
#if __has_include(<synced_logs/synced_logs-Swift.h>)
#import <synced_logs/synced_logs-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "synced_logs-Swift.h"
#endif

@implementation SyncedLogsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSyncedLogsPlugin registerWithRegistrar:registrar];
}
@end
