import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tezos_asessment/app/data/models/transaction_block_response.dart';
import 'package:tezos_asessment/app/data/models/transaction_response.dart';
import 'package:tezos_asessment/app/data/repositories/transaction_repository.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  late TransactionRepository _transactionRepository;

  TransactionCubit([ TransactionRepository? transactionRepository]) : super(TransactionInitial()){
    _transactionRepository = transactionRepository ?? TransactionRepository(dio: Dio());
  }

  void fetchLatestBlock() async {
    emit(TransactionBlockLoading());
    try {
      var response = await _transactionRepository.fetchLatestBlock();
      emit(TransactionBlockSuccess(transactionBlockResponse: response));
    } catch (e) {
      emit(TransactionBlockError(error: e.toString()));
    }
  }

  void fetchTransactions({required String hashBlock}) async {
    emit(TransactionBlockLoading());
    try {
      var response = await _transactionRepository.fetchTransactions(hashBlock: hashBlock);
      emit(TransactionSuccess(transactionResponse: response));
    } catch (e) {
      emit(TransactionError(error: e.toString()));
    }
  }
}
