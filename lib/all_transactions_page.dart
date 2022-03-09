import 'package:flutter/material.dart';
import 'package:practical_app/app_strings.dart';

class AllTransactionsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AllTransactionsState();
}

class AllTransactionsState extends State<AllTransactionsPage> {
  @override
  void initState() {
    super.initState();
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
            Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
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
            Container(
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 12),
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.shade50,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepPurple.shade100),
                    child: Center(
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  SizedBox(width: 18,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
