import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'kkiapayConf.sample.dart';

class KKiaPay extends StatefulWidget {

  int _amount;
  String _phone;
  String _data;


  KKiaPay(this._amount, this._phone, this._data);

  @override
  _KKiaPayState createState() => _KKiaPayState(this._amount, this._phone, this._data);
}

class _KKiaPayState extends State<KKiaPay> {

  final flutterWebViewPlugin = FlutterWebviewPlugin();
  final int _amount;
  final String _phone;
  final String _data;

  /**
   * @Params amount : Payment amount
   * @Params phone : Payment phoneNumber
   * @Params data : Payment data send by webhook
   */
  _KKiaPayState(this._amount, this._phone, this._data);

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((String url) async {
      if (mounted) {
        if (url.startsWith('http://redirect.kkiapay.me')) {
          /**
           * Payment Done with success
           */
          flutterWebViewPlugin.dispose();
          flutterWebViewPlugin.hide();
          //TODO action of success payment
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

  @override
  Widget build(BuildContext context) {
    final url = '$KKiaPayURL/?=${_SdkData(
      amount: this._amount,
      phone: this._phone,
      data: this._data
    ).toBase64()}';
    return WebviewScaffold (
        url: url,
        appBar: new AppBar(
          backgroundColor: Color(0xFFFE7367),
        title: const Text('Paiement', style: TextStyle(color: Colors.white),),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
      color: Color(0xFFFE7367),
      child: const Center(
      child: CircularProgressIndicator(),
      ),
    ));
  }
}

class _SdkData {

  /**
   * @Params amount : Payment amount
   * @Params reason : Payment reason
   * @Params name : Payment owner
   * @Params phone : Payment phoneNumber
   * @Params data : Payment data send by webhook
   * @Params sandbox : Payment request made in sandbox
   */
  _SdkData({this.amount, this.reason,this.name, this.phone, this.data, this.sandbox = true});

  final int amount;
  final reason, name, sandbox, phone, data;

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'reason': reason,
      'name': name,
      'sandbox': sandbox,
      'key': key,
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