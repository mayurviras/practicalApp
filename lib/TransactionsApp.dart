import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_app/ui/all_transactions_page.dart';
import 'package:practical_app/utils/provider_list.dart';
import 'app_strings.dart';

class TransactionsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TransactionsState();
}

class _TransactionsState extends State<TransactionsApp> {
  MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MyAppProviders().getBlocProviders(),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppStrings().appName,
                theme: ThemeData(
                  primarySwatch: white,
                ),
                home: AllTransactionsPage());
          },
        ));
  }
}
