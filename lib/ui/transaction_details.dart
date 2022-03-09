import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical_app/bloc/model/TransactionsApiResponse.dart';
import 'package:practical_app/utils/global_class.dart';

import '../app_strings.dart';

class TransactionDetails extends StatefulWidget {
  final TransactionData transactionData;
  TransactionDetails({Key key, @required this.transactionData}) : super(key: key);
  @override
  State<StatefulWidget> createState() => TransactionState();
}

class TransactionState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0.0,
        toolbarHeight: 0.0,
      ),
      backgroundColor: Color.fromRGBO(112, 93, 156, 1),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              AppStrings().transactionsDetails,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings().detailsSummaryText,
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings().recepient,
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade600),
                      ),
                      Expanded(child: Text(
                        '-',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings().amount,
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade600),
                      ),
                      Expanded(child: Text(
                        '${GlobalClass().getCurrencyCode(context, widget.transactionData.currencyCode)} ${widget.transactionData.amount}',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings().transactionDate,
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade600),
                      ),
                      Expanded(child: Text(
                      GlobalClass().getFormatDate(widget.transactionData.entryDate),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings().reference,
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade600),
                      ),
                      Expanded(child: Text(
                        widget.transactionData.transactionId.toString(),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings().reference,
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade600),
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade700,
                          shape: BoxShape.circle
                        ),
                      ),
                      SizedBox(width: 2,),
                      Text(
                        'Successful',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent.shade700),
                      )
                    ],
                  ),
                  SizedBox(height: 12,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
