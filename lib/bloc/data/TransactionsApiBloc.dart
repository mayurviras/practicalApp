import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_app/bloc/data/TransactionsApiEvent.dart';
import 'package:practical_app/bloc/data/TransactionsApiState.dart';
import 'package:practical_app/bloc/domain/TransactionsRepositoryImpl.dart';


class TransactionsApiBloc extends Bloc<TransactionsApiEvent, TransactionsApiState> {
  final TransactionRepositoryImpl transactionRepositoryImpl;

  TransactionsApiBloc({@required this.transactionRepositoryImpl})
      : super(TransactionsApiInitSate());

  @override
  Stream<TransactionsApiState> mapEventToState(TransactionsApiEvent event) async* {
    try {
      if (event is ApiCallGetTransactions) {
        yield TransactionsApiLoadingSate();
        var apiResult = await transactionRepositoryImpl.apiCallGetTransactions();

        if (apiResult == null) {
          yield TransactionsApiErrorSate("Error in transactions fetching");
        } else {
          yield TransactionsApiSuccessSate(apiResult);
        }
      }
    } catch (error) {
      yield TransactionsApiErrorSate("Error in breeds fetching");
    }

    if (event is ResetTransactionsApiStateEvent) {
      yield TransactionsApiInitSate();
    }
  }
}
