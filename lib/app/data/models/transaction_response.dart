class TransactionResponse {
  final String? hash;
  final int? ver;
  final String? prevBlock;
  final String? mrklRoot;
  final int? time;
  final int? bits;
  final List<String>? nextBlock;
  final int? fee;
  final int? nonce;
  final int? nTx;
  final int? size;
  final int? blockIndex;
  final bool? mainChain;
  final int? height;
  final int? weight;
  final List<Tx>? tx;

  TransactionResponse({
    this.hash,
    this.ver,
    this.prevBlock,
    this.mrklRoot,
    this.time,
    this.bits,
    this.nextBlock,
    this.fee,
    this.nonce,
    this.nTx,
    this.size,
    this.blockIndex,
    this.mainChain,
    this.height,
    this.weight,
    this.tx,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) => TransactionResponse(
        hash: json["hash"],
        ver: json["ver"],
        prevBlock: json["prev_block"],
        mrklRoot: json["mrkl_root"],
        time: json["time"],
        bits: json["bits"],
        nextBlock: json["next_block"] == null ? [] : List<String>.from(json["next_block"]!.map((x) => x)),
        fee: json["fee"],
        nonce: json["nonce"],
        nTx: json["n_tx"],
        size: json["size"],
        blockIndex: json["block_index"],
        mainChain: json["main_chain"],
        height: json["height"],
        weight: json["weight"],
        tx: json["tx"] == null ? [] : List<Tx>.from(json["tx"]!.map((x) => Tx.fromJson(x))),
      );
}

class Tx {
  final String? hash;
  final int? ver;
  final int? vinSz;
  final int? voutSz;
  final int? size;
  final int? weight;
  final int? fee;
  final String? relayedBy;
  final int? lockTime;
  final int? txIndex;
  final bool? doubleSpend;
  final int? time;
  final int? blockIndex;
  final int? blockHeight;
  final List<Input>? inputs;
  final List<Out>? out;

  Tx({
    this.hash,
    this.ver,
    this.vinSz,
    this.voutSz,
    this.size,
    this.weight,
    this.fee,
    this.relayedBy,
    this.lockTime,
    this.txIndex,
    this.doubleSpend,
    this.time,
    this.blockIndex,
    this.blockHeight,
    this.inputs,
    this.out,
  });

  factory Tx.fromJson(Map<String, dynamic> json) => Tx(
        hash: json["hash"],
        ver: json["ver"],
        vinSz: json["vin_sz"],
        voutSz: json["vout_sz"],
        size: json["size"],
        weight: json["weight"],
        fee: json["fee"],
        relayedBy: json["relayed_by"],
        lockTime: json["lock_time"],
        txIndex: json["tx_index"],
        doubleSpend: json["double_spend"],
        time: json["time"],
        blockIndex: json["block_index"],
        blockHeight: json["block_height"],
        inputs: json["inputs"] == null ? [] : List<Input>.from(json["inputs"]!.map((x) => Input.fromJson(x))),
        out: json["out"] == null ? [] : List<Out>.from(json["out"]!.map((x) => Out.fromJson(x))),
      );
}

class Input {
  final int? sequence;
  final String? witness;
  final String? script;
  final int? index;
  final Out? prevOut;

  Input({
    this.sequence,
    this.witness,
    this.script,
    this.index,
    this.prevOut,
  });

  factory Input.fromJson(Map<String, dynamic> json) => Input(
        sequence: json["sequence"],
        witness: json["witness"],
        script: json["script"],
        index: json["index"],
        prevOut: json["prev_out"] == null ? null : Out.fromJson(json["prev_out"]),
      );

}

class Out {
  final int? type;
  final bool? spent;
  final int? value;
  final List<SpendingOutpoint>? spendingOutpoints;
  final int? n;
  final int? txIndex;
  final String? script;
  final String? addr;

  Out({
    this.type,
    this.spent,
    this.value,
    this.spendingOutpoints,
    this.n,
    this.txIndex,
    this.script,
    this.addr,
  });

  factory Out.fromJson(Map<String, dynamic> json) => Out(
        type: json["type"],
        spent: json["spent"],
        value: json["value"],
        spendingOutpoints: json["spending_outpoints"] == null
            ? []
            : List<SpendingOutpoint>.from(json["spending_outpoints"]!.map((x) => SpendingOutpoint.fromJson(x))),
        n: json["n"],
        txIndex: json["tx_index"],
        script: json["script"],
        addr: json["addr"],
      );

}

class SpendingOutpoint {
  final int? txIndex;
  final int? n;

  SpendingOutpoint({
    this.txIndex,
    this.n,
  });

  factory SpendingOutpoint.fromJson(Map<String, dynamic> json) => SpendingOutpoint(
        txIndex: json["tx_index"],
        n: json["n"],
      );

}
