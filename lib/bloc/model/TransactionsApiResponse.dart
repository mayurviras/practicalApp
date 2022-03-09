class TransactionApiResponse {
  TransactionApiResponse({this.message, this.status, this.code, this.data});

  String message;
  String status;
  String code;
  ResponseData data;

  factory TransactionApiResponse.fromJson(Map<String, dynamic> json) =>
      TransactionApiResponse(
        message: json["message"],
        status: json["status"],
        code: json["code"],
        data: json["data"] == null ? null : ResponseData.fromJson(json["data"]),
      );
}

class ResponseData {
  ResponseData({this.clientTransactions});

  List<dynamic> clientTransactions;

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
        clientTransactions: json["clientTransactions"],
      );
}

class TransactionData {
  TransactionData(
      {this.transactionId,
      this.type,
      this.amount,
      this.currencyCode,
      this.entryDate,
      this.comment,
      this.balance});

  int transactionId;
  String type;
  String amount;
  String comment;
  String entryDate;
  String currencyCode;
  String balance;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        transactionId: json["transactionId"],
        type: json["type"],
        amount: json["amount"].toString(),
        comment: json["comment"],
        entryDate: json["entryDate"],
        currencyCode: json["currencyCode"],
        balance: json["balance"].toString(),
      );
}
