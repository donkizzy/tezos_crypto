part of 'transaction_cubit.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();
}

final class TransactionInitial extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionBlockLoading extends TransactionState {
  @override
  List<Object> get props => [];
}

final class TransactionBlockSuccess extends TransactionState {
  final TransactionBlockResponse transactionBlockResponse;

  const TransactionBlockSuccess({required this.transactionBlockResponse});
  @override
  List<Object> get props => [transactionBlockResponse];
}

final class TransactionBlockError extends TransactionState {
  final String error ;

  const TransactionBlockError({required this.error});
  @override
  List<Object> get props => [error];
}


final class TransactionSuccess extends TransactionState {
  final TransactionResponse transactionResponse;

  const TransactionSuccess({required this.transactionResponse});
  @override
  List<Object> get props => [transactionResponse];
}

final class TransactionError extends TransactionState {
  final String error ;

  const TransactionError({required this.error});
  @override
  List<Object> get props => [error];
}
