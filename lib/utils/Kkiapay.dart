import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:meta/meta.dart';

class Kkiapay {
  String apikey;
  bool sandbox;
  //
  String amount;
  String data;
  String host;
  String theme;
  String phone;
  String callback;

  //
  final _sandboxEndpoint = 'https://api-sandbox.kkiapay.me';
  final _liveEndpoint = 'https://api.kkiapay.me';

  String get _endpoint => sandbox ? _sandboxEndpoint : _liveEndpoint;

  Kkiapay(
      {@required this.apikey,
      this.sandbox = false,
      this.callback = 'http://redirect.kkiapay.me'});

  Future<Map> getTransactionInfo(transactionId) async {
    final response = await http.post('$_endpoint/api/v1/transactions/status',
        headers: {'x-api-key': apikey}, body: {'transactionId': transactionId});
    Map responseObject = json.decode(response.body);
    return responseObject;
  }
}
