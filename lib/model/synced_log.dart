class SyncedLog {
  String? tag;
  String? occuredContext;
  String? stackTrace;
  String? occuredTimestamp;
  String? otherInfo;

  SyncedLog({this.tag, this.occuredContext, this.stackTrace, this.occuredTimestamp, this.otherInfo});

  factory SyncedLog.fromJson(Map<String, dynamic> json) {
    return SyncedLog(
      tag: json['tag'],
      occuredContext: json['occuredContext'],
      stackTrace: json['stackTrace'],
      occuredTimestamp: json['occuredTimestamp'],
      otherInfo: json['otherInfo'],
    );
  }

  Map<String, dynamic> toJson() => {
        'tag': tag,
        'occuredContext': occuredContext,
        'stackTrace': stackTrace,
        'occuredTimestamp': occuredTimestamp.toString(),
        'otherInfo': otherInfo,
      };
}
