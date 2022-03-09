import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:practical_app/bloc/data/TransactionsApiBloc.dart';
import 'package:practical_app/bloc/domain/TransactionsApiManager.dart';
import 'package:practical_app/bloc/domain/TransactionsRepositoryImpl.dart';

class MyAppProviders {
  TransactionRepositoryImpl transactionRepositoryImpl = new TransactionRepositoryImpl(transactionsApiManager: TransactionsApiManager());

  List<BlocProviderSingleChildWidget> getBlocProviders() {
    List<BlocProviderSingleChildWidget> blocProviders = [
      BlocProvider<TransactionsApiBloc>(
          create: (context) => TransactionsApiBloc(
              transactionRepositoryImpl:transactionRepositoryImpl )),

    ];
    return blocProviders;
  }
}
