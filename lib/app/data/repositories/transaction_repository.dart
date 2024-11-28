import 'dart:async';

import 'package:dio/dio.dart';
import 'package:tezos_asessment/app/data/models/transaction_block_response.dart';
import 'package:tezos_asessment/app/data/models/transaction_response.dart';

class TransactionRepository {
  final Dio  dio  ;

  TransactionRepository({required this.dio});

  Future<TransactionBlockResponse> fetchLatestBlock() async {
    var completer = Completer<TransactionBlockResponse>();
    try {
      var response = await dio.get('https://blockchain.info/latestblock');
      var result = TransactionBlockResponse.fromJson(response.data);
      completer.complete(result);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  Future<TransactionResponse> fetchTransactions({required String hashBlock}) async {
    var completer = Completer<TransactionResponse>();
    try {
      var response = await dio.get('https://blockchain.info/rawblock/$hashBlock');
      var result = TransactionResponse.fromJson(response.data);
      completer.complete(result);
    } catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

}