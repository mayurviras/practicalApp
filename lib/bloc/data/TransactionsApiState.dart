

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:practical_app/bloc/model/TransactionsApiResponse.dart';

@immutable
abstract class TransactionsApiState extends Equatable{

}
class TransactionsApiInitSate extends TransactionsApiState {
  TransactionsApiInitSate();
  @override
  List<dynamic> get props => [];
}
class TransactionsApiLoadingSate extends TransactionsApiState {
  TransactionsApiLoadingSate();
  @override
  List<dynamic> get props => [];
}

class TransactionsApiSuccessSate extends TransactionsApiState {
  final TransactionApiResponse apiResponse;
  TransactionsApiSuccessSate(this.apiResponse);
  @override
  List<dynamic> get props => [apiResponse];
}

class TransactionsApiErrorSate extends TransactionsApiState {
  final String errorMessage;

  TransactionsApiErrorSate(this.errorMessage);
  @override
  List<dynamic> get props => [errorMessage];
}

