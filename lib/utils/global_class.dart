import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class GlobalClass{

  final Connectivity _connectivity = Connectivity();
  Future<ConnectivityResult> checkConnectivity() async{
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    return result;
  }
  String getFormatDate(String serverDate){
    serverDate =serverDate.split('T')[0];
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    DateTime oldDate =formatter.parse(serverDate,true);
    DateTime localDate =oldDate.toLocal();

    return Jiffy(localDate).format('do MMM. yyyy');

    // newFormatter.format(localDate);
  }

  String getCurrencyCode(BuildContext context,String isoCode){
    if(isoCode.isEmpty){
      var format = NumberFormat.simpleCurrency(name: 'NGN');
      return format.currencySymbol;
    }else{
      var format = NumberFormat.simpleCurrency(name: isoCode);
      if(format.currencySymbol=='NGR'){
        return '₦';
      }
      return format.currencySymbol;
    }


  }

}