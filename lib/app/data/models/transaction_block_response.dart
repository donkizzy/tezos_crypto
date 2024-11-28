class TransactionBlockResponse {
  final String? hash;
  final int? time;
  final int? blockIndex;
  final int? height;
  final List<int>? txIndexes;

  TransactionBlockResponse({
    this.hash,
    this.time,
    this.blockIndex,
    this.height,
    this.txIndexes,
  });

  factory TransactionBlockResponse.fromJson(Map<String, dynamic> json) => TransactionBlockResponse(
    hash: json["hash"],
    time: json["time"],
    blockIndex: json["block_index"],
    height: json["height"],
    txIndexes: json["txIndexes"] == null ? [] : List<int>.from(json["txIndexes"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "hash": hash,
    "time": time,
    "block_index": blockIndex,
    "height": height,
    "txIndexes": txIndexes == null ? [] : List<dynamic>.from(txIndexes!.map((x) => x)),
  };
}
