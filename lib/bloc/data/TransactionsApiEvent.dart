

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class TransactionsApiEvent extends Equatable {
  const TransactionsApiEvent();
}
class ResetTransactionsApiStateEvent extends TransactionsApiEvent {

  ResetTransactionsApiStateEvent();

  @override
  List<Object> get props => [];

}
class ApiCallGetTransactions extends TransactionsApiEvent {
  ApiCallGetTransactions();
  @override
  List<Object> get props => [];

}
