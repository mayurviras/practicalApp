import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_app/app_strings.dart';
import 'package:practical_app/bloc/data/TransactionsApiBloc.dart';
import 'package:practical_app/bloc/data/TransactionsApiEvent.dart';
import 'package:practical_app/bloc/data/TransactionsApiState.dart';
import 'package:practical_app/bloc/model/TransactionsApiResponse.dart';
import 'package:practical_app/ui/transaction_details.dart';
import 'package:practical_app/utils/global_class.dart';

class AllTransactionsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AllTransactionsState();
}

class AllTransactionsState extends State<AllTransactionsPage> {
  List<TransactionData> allTransactionsList = [];
  String errorMsg = 'Error in transactions fetching';

  @override
  void initState() {
    super.initState();
    getAllTransactions();
  }
  void getAllTransactions() async {
    GlobalClass().checkConnectivity().then((value) {
      if (value == ConnectivityResult.none) {
        errorMsg = AppStrings().networkError;
      } else {
        BlocProvider.of<TransactionsApiBloc>(context)
            .add(ApiCallGetTransactions());
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.0,
        toolbarHeight: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: (){
                SystemNavigator.pop();
              },
              child:  Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              AppStrings().allTransactions,
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 24,
            ),
            transactionsBloc()
          ],
        ),
      ),
    );
  }

  Widget transactionsBloc() {
    return BlocBuilder<TransactionsApiBloc, TransactionsApiState>(
        builder: (context, state) {
      if (state is TransactionsApiSuccessSate) {
        if (allTransactionsList.isEmpty) {
          print(state.apiResponse.data);
          loadTransactions(state.apiResponse.data.clientTransactions);
        }
        BlocProvider.of<TransactionsApiBloc>(context)
            .add(ResetTransactionsApiStateEvent());
      }
      if (state is TransactionsApiErrorSate) {
        errorMsg = state.errorMessage;
        BlocProvider.of<TransactionsApiBloc>(context)
            .add(ResetTransactionsApiStateEvent());
      }

      return transactionsListView(state is TransactionsApiLoadingSate);
    });
  }

  Widget transactionsListView(bool isLoading) {
    return Expanded(
      child: isLoading
          ? Center(
              child: Container(
                  height: 36,
                  width: 36,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                  )),
            )
          : allTransactionsList.length == 0
              ? Center(
                  child: Text(
                    errorMsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : ListView.builder(
                  itemCount: allTransactionsList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(
                          bottom: 15,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransactionDetails(transactionData: allTransactionsList[index],)),
                            );
                          },
                          child: transactionItem(allTransactionsList[index]),
                        ));
                  }),
    );
  }

  Widget transactionItem(TransactionData transactionData) {
    String local=transactionData.type.toUpperCase() == 'TRANSFER'?'- ':'';
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15, left: 18, right: 12),
      decoration: BoxDecoration(
          color: Color.fromRGBO(182, 177, 242, 0.08),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.deepPurple.shade50),
            child: Center(
              child: Icon(
                Icons.arrow_upward,
                color: Colors.deepPurple,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              transactionData.comment==null?"No title":transactionData.comment,
                style: TextStyle(color: Colors.black, fontSize: 16,),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                GlobalClass().getFormatDate(transactionData.entryDate),
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              )
            ],
          )),
          SizedBox(
            width: 12,
          ),
          Text(
              '${GlobalClass().getCurrencyCode(context, transactionData.currencyCode)} ${transactionData.amount}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: transactionData.type.toUpperCase() == 'TRANSFER'
                      ? Colors.red
                      : Colors.green,
                  fontSize: 18))
        ],
      ),
    );
  }

  void loadTransactions(List<dynamic> clientTransactions) {
    clientTransactions.forEach((element) {
      allTransactionsList.add(TransactionData.fromJson(element));
    });
  }
}
