class SyncedLog {
  String? tag;
  String? occurredContext;
  String? stackTrace;
  String? occurredTimestamp;
  String? otherInfo;

  SyncedLog({this.tag, this.occurredContext, this.stackTrace, this.occurredTimestamp, this.otherInfo});

  factory SyncedLog.fromJson(Map<String, dynamic> json) {
    return SyncedLog(
      tag: json['tag'],
      occurredContext: json['occuredContext'],
      stackTrace: json['stackTrace'],
      occurredTimestamp: json['occuredTimestamp'],
      otherInfo: json['otherInfo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tag': tag,
        'occurredContext': occurredContext,
        'stackTrace': stackTrace,
        'occurredTimestamp': occurredTimestamp.toString(),
        'otherInfo': otherInfo,
      };
}
