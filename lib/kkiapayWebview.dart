import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'kkiapayConf.sample.dart';

class KKiaPay extends StatefulWidget {
  final int? amount;
  final String? phone;
  final String? data;
  final String? apikey;
  final bool? sandbox;
  final Function(Map<String, dynamic>, BuildContext)? callback;
  final String? theme;
  final String? name;

  KKiaPay({
    this.amount,
    this.phone,
    this.data,
    this.sandbox,
    this.apikey,
    this.callback,
    this.theme,
    this.name,
  });

  @override
  _KKiaPayState createState() => _KKiaPayState(
        this.amount,
        this.phone,
        this.data,
        this.sandbox,
        this.apikey,
        this.callback,
        this.theme,
        this.name,
      );
}

class _KKiaPayState extends State<KKiaPay> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  final int? amount;
  final String? phone;
  final String? data;
  final String? apikey;
  final bool? sandbox;
  final Function(Map<String, dynamic>, BuildContext)? callback;
  final String? theme;
  final String? name;

  ///
  // * @Params amount : Payment amount
  // * @Params phone : Payment phoneNumber
  // * @Params data : Payment data send by webhook
  //
  _KKiaPayState(
    this.amount,
    this.phone,
    this.data,
    this.sandbox,
    this.apikey,
    this.callback,
    this.theme,
    this.name,
  );

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((String url) async {
      if (mounted) {
        if (url.startsWith('http://redirect.kkiapay.me')) {
          /**
           * Payment Done with success
           */
          final link = Uri.parse(url);
          final transactionId = link.queryParameters['transaction_id'];
          callback!({'amount': amount, 'transactionId': transactionId}, context);
          flutterWebViewPlugin.dispose();
          flutterWebViewPlugin.hide();

          // implement action of success payment
        }
      }
    });
  }

  @override
  void dispose() {
    flutterWebViewPlugin.close();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  @override
  Widget build(BuildContext context) {
    final url =
        '$KKiaPayURL/?=${_SdkData(amount: this.amount, phone: this.phone, data: this.data, sandbox: this.sandbox, apikey: this.apikey, theme: this.theme, name: this.name).toBase64()}';
    return WebviewScaffold(
      url: url,
      withZoom: false,
      withLocalStorage: true,
      appBar: Platform.isIOS
          ? AppBar(
              backgroundColor: Color(_getColorFromHex(theme ?? '#4E6BFC')),
            )
          : null,
      hidden: false,
      initialChild: Container(
        color: Colors.transparent,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _SdkData {
  /// @Params amount : Payment amount
  /// @Params reason : Payment reason
  /// @Params name : Payment owner
  /// @Params phone : Payment phoneNumber
  /// @Params data : Payment data send by webhook
  /// @Params sandbox : Payment request made in sandbox
  _SdkData({
    this.amount,
    this.reason,
    this.name,
    this.phone,
    this.data,
    this.sandbox = true,
    this.apikey,
    this.theme = '#4E6BFC',
  });

  final int? amount;
  final reason, name, sandbox, phone, data, apikey, theme;

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'reason': reason,
      'name': name,
      'sandbox': sandbox,
      'key': apikey,
      'callback': callback,
      'phone': phone,
      'sdk': sdk,
      'theme': theme,
      'url': url,
      'host': host,
      'data': data
    };
  }

  String toBase64() {
    var json = jsonEncode(this.toMap());
    var bytes = utf8.encode(json);
    return base64.encode(bytes);
  }
}
