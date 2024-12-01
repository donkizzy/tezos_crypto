import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tezos_asessment/app/data/bloc/transaction_cubit.dart';
import 'package:tezos_asessment/app/data/repositories/transaction_repository.dart';
import 'package:tezos_asessment/app/data/models/transaction_block_response.dart';
import 'package:tezos_asessment/app/data/models/transaction_response.dart';

import '../../../mocks.dart';
import 'transaction_cubit_test.mocks.dart';

@GenerateMocks([TransactionRepository])
void main() {
  late TransactionCubit transactionCubit;
  late MockTransactionRepository mockTransactionRepository;

  setUp(() {
    mockTransactionRepository = MockTransactionRepository();
    transactionCubit = TransactionCubit(mockTransactionRepository);
  });

  test('initial state is correct', () {
    expect(transactionCubit.state, TransactionInitial());
  });

  group('Fetch Latest Transaction Block', () {
    var response = TransactionBlockResponse.fromJson(transactionBlockResponse);
    blocTest<TransactionCubit, TransactionState>(
      'emits [TransactionBlockLoading, TransactionBlockSuccess] when fetchLatestBlock is successful',
      build: () {
        when(mockTransactionRepository.fetchLatestBlock()).thenAnswer((_) async => response);
        return transactionCubit;
      },
      act: (cubit) => cubit.fetchLatestBlock(),
      expect: () => [
        TransactionBlockLoading(),
        TransactionBlockSuccess(transactionBlockResponse: response),
      ],
    );

    blocTest<TransactionCubit, TransactionState>(
      'emits [TransactionBlockLoading, TransactionBlockError] when fetchLatestBlock fails',
      build: () {
        when(mockTransactionRepository.fetchLatestBlock()).thenThrow(Exception('Failed to fetch'));
        return transactionCubit;
      },
      act: (cubit) => cubit.fetchLatestBlock(),
      expect: () => [
        TransactionBlockLoading(),
        const TransactionBlockError(error: 'Exception: Failed to fetch'),
      ],
    );

  });

  group('Fetch Transaction Lists', (){
    final response = TransactionResponse.fromJson(transactionList);

    blocTest<TransactionCubit, TransactionState>(
      'emits [TransactionBlockLoading, TransactionSuccess] when fetchTransactions is successful',
      build: () {
        when(mockTransactionRepository.fetchTransactions(hashBlock: '000000000000000000001d74687b6170827dad9bf59c4d612db3d7cd73009a5b')).thenAnswer((_) async => response);
        return transactionCubit;
      },
      act: (cubit) => cubit.fetchTransactions(hashBlock: '000000000000000000001d74687b6170827dad9bf59c4d612db3d7cd73009a5b'),
      expect: () => [
        TransactionBlockLoading(),
        TransactionSuccess(transactionResponse: response),
      ],
    );

    blocTest<TransactionCubit, TransactionState>(
      'emits [TransactionBlockLoading, TransactionError] when fetchTransactions fails',
      build: () {
        when(mockTransactionRepository.fetchTransactions(hashBlock: '000000000000000000001d74687b6170827dad9bf59c4d612db3d7cd73009a5b')).thenThrow(Exception('Failed to fetch'));
        return transactionCubit;
      },
      act: (cubit) => cubit.fetchTransactions(hashBlock: '000000000000000000001d74687b6170827dad9bf59c4d612db3d7cd73009a5b'),
      expect: () => [
        TransactionBlockLoading(),
        const TransactionError(error: 'Exception: Failed to fetch'),
      ],
    );
  });
}