import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:tezos_asessment/app/data/models/transaction_block_response.dart';
import 'package:tezos_asessment/app/data/models/transaction_response.dart';
import 'package:tezos_asessment/app/data/repositories/transaction_repository.dart';

import '../../../mocks.dart';
import 'transaction_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late TransactionRepository repository;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    repository = TransactionRepository(dio: mockDio);
  });

  group('fetchLatestBlock', () {
    test('returns TransactionBlockResponse on successful fetch', () async {
      when(mockDio.get(any))
          .thenAnswer((_) async => Response(data: transactionBlockResponse,
          statusCode: 200, requestOptions: RequestOptions()));

      final result = await repository.fetchLatestBlock();

      expect(result, isA<TransactionBlockResponse>());
      expect(result.hash, '000000000000000000001d74687b6170827dad9bf59c4d612db3d7cd73009a5b');
      expect(result.height, 872365);
    });

    test('throws error on fetch failure', () async {
      when(mockDio.get(any)).thenThrow(Exception('Failed to fetch'));

      expect(repository.fetchLatestBlock(), throwsA(isA<Exception>()));
    });
  });

  group('fetchTransactions', () {
    test('returns TransactionResponse on successful fetch', () async {
      when(mockDio.get(any)).thenAnswer((_) async => Response(data: transactionList, statusCode: 200, requestOptions: RequestOptions()));

      final result = await repository.fetchTransactions(hashBlock: '000000000000000000001d74687b6170827dad9bf59c4d612db3d7cd73009a5b');

      expect(result, isA<TransactionResponse>());
      expect(result.hash, '000000000000000000001d74687b6170827dad9bf59c4d612db3d7cd73009a5b');
      expect(result.tx, isNotEmpty);
    });

    test('throws error on fetch failure', () async {
      when(mockDio.get(any)).thenThrow(Exception('Failed to fetch'));
      expect(repository.fetchTransactions(hashBlock: '0000000000000000000'), throwsA(isA<Exception>()));
    });
  });
}
