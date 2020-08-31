import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'kkiapayConf.sample.dart';

class KKiaPay extends StatefulWidget {

  int amount;
  String phone;
  String data;
  String apikey;
  bool sandbox;
  Function callback;
  String theme;


  KKiaPay({this.amount, this.phone, this.data,this.sandbox,this.apikey,this.callback,String theme});

  @override
  _KKiaPayState createState() => _KKiaPayState(this.amount, this.phone, this.data,this.sandbox,this.apikey,this.callback,this.theme);
}

class _KKiaPayState extends State<KKiaPay> {

  final flutterWebViewPlugin = FlutterWebviewPlugin();
  final int amount;
  final String phone;
  final String data;
  final String apikey;
  final bool sandbox;
  final Function callback;
  final String theme;

  ///
  // * @Params amount : Payment amount
  // * @Params phone : Payment phoneNumber
  // * @Params data : Payment data send by webhook
  // 
  _KKiaPayState(this.amount, this.phone, this.data,this.sandbox,this.apikey,this.callback,this.theme);

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((String url) async {
      if (mounted) {
        if (url.startsWith('http://redirect.kkiapay.me')) {
          /**
           * Payment Done with success
           */
          print(url);
          final link = Uri.parse(url);
          final transactionId =  link.queryParameters['transaction_id'];
          print(transactionId);
          print(amount);
          callback({'amount':amount,'transactionId':transactionId},context);
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
    print(this.apikey);
    print(this.sandbox);
    print('====================>');
    final url = '$KKiaPayURL/?=${_SdkData(
      amount: this.amount,
      phone: this.phone,
      data: this.data,
      sandbox: this.sandbox,
      apikey: this.apikey,
      theme: this.theme
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
  _SdkData({this.amount, this.reason,this.name, this.phone, this.data, this.sandbox = true,this.apikey,this.theme});

  final int amount;
  final reason, name, sandbox, phone, data, apikey,theme;

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
