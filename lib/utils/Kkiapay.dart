import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:package_info/package_info.dart';

class Kkiapay {
  Client client = Client();
  String key;
  bool sandbox;
  //
  final String amount;
  final dynamic data;
  String host;
  final String theme;
  final String phone;
  final String url;
  final String name;

  final callback = 'http://redirect.kkiapay.me';
  final sdk = 'android';
  Function sucessCallback;

  final _sandboxEndpoint = 'https://api-sandbox.kkiapay.me';
  final _liveEndpoint = 'https://api.kkiapay.me';

  String get _endpoint => sandbox ? _sandboxEndpoint : _liveEndpoint;

  Kkiapay(
      {@required this.key,
      this.name,
      this.sandbox = false,
      @required this.sucessCallback,
      this.theme = '',
      this.data = '',
      @required this.amount,
      this.phone,
      this.url = '',
      this.host});

  Future<Map> getTransactionInfo(transactionId) async {
    final response = await client.post('$_endpoint/api/v1/transactions/status',
        headers: {'x-api-key': key}, body: {'transactionId': transactionId});
    Map responseObject = json.decode(response.body);

    return responseObject;
  }

  String convertObjectToBase64(Map<String, dynamic> object) {
    final jsonEncoder = JsonEncoder();
    final bytes = utf8.encode(jsonEncoder.convert(object));
    final base64Str = base64.encode(bytes);

    return base64Str;
  }

  getAppInfo() async {
    //get app information
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    host = packageName;
  }
}
