
import 'package:practical_app/bloc/model/TransactionsApiResponse.dart';

abstract class TransactionsRepository {

  Future<TransactionApiResponse> apiCallGetTransactions();
}
