


import 'package:flutter/material.dart';
import 'package:practical_app/bloc/model/TransactionsApiResponse.dart';

import 'TransactionsApiManager.dart';
import 'TransactionsRepository.dart';

class TransactionRepositoryImpl extends TransactionsRepository {
  final TransactionsApiManager transactionsApiManager;

  TransactionRepositoryImpl({@required this.transactionsApiManager})
      : assert(transactionsApiManager != null);


  @override
  Future<TransactionApiResponse> apiCallGetTransactions() {
    return transactionsApiManager.apiCallGetTransactions();
  }






}