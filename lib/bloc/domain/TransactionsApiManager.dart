
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practical_app/bloc/model/TransactionsApiResponse.dart';
import 'package:practical_app/utils/network_url.dart';

class TransactionsApiManager {
  TransactionsApiManager();

  Future<TransactionApiResponse> apiCallGetTransactions() async {
    var randomDogApi = NetworkUrl.baseUrl + NetworkUrl.endPoint;
    Uri apiUri = Uri.parse(randomDogApi);
    http.Response response;
    TransactionApiResponse apiResponse;

    try {
      response = await http.get(apiUri,headers: {
        'Sourceappid':NetworkUrl.Sourceappid,
        'Authorization': "Bearer "+NetworkUrl.token
      });

      print("apiCallGetTransactions:- response:- " + response.body);
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if(jsonResponse.containsKey("status")){
        if(jsonResponse["status"].toString().toLowerCase()=="successful"){
          apiResponse =TransactionApiResponse.fromJson(jsonResponse);
        }
      }
    } catch (e) {
      print(e);
    }
    return apiResponse;
  }


}