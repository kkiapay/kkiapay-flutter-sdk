import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:meta/meta.dart';

/*
{
  
"amount":"1",
"callback":"http://redirect.kkiapay.me",
"data":"Leonel zegue",
"host":"co.opensi.medical",
"key":"f1e7270098f811e99eae1f0cfc677927",
"name":"HNS Iiyama",
"phone":"97000000",
"reason":"Paiement d\u0027un rendez-vous",
"sandbox":true,
"sdk":"android",
"theme":"#2ba359",
"url":"https://api.kkiapay.me/utils/file/zse2kUp6hgdDRps1OBpkSHxRE"

}
96820190
96809883
*/

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
  Function sucessCallback;

  final _sandboxEndpoint = 'https://api-sandbox.kkiapay.me';
  final _liveEndpoint = 'https://api.kkiapay.me';

  String get _endpoint => sandbox ? _sandboxEndpoint : _liveEndpoint;

  Kkiapay(
      {@required this.apikey,
      this.sandbox = false,
      this.callback = 'http://redirect.kkiapay.me',
      this.sucessCallback});

  Future<Map> getTransactionInfo(transactionId) async {
    final response = await http.post('$_endpoint/api/v1/transactions/status',
        headers: {'x-api-key': apikey}, body: {'transactionId': transactionId});
    Map responseObject = json.decode(response.body);

    return responseObject;
  }

  String convertObjectToBase64(Map<String, dynamic> object) {
    final jsonEncoder = JsonEncoder();
    final bytes = utf8.encode(jsonEncoder.convert(object));
    final base64Str = base64.encode(bytes);

    return base64Str;
  }
}
