import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:kkiapay_flutter_sdk/utils/Kkiapay.dart';
// import 'package:flutter_webview_plugin_example/screen.dart';

class KkiapayWebview extends StatefulWidget {
  final Kkiapay _kkiapayInstance;

  KkiapayWebview(this._kkiapayInstance);

  _KkiapayWebviewState createState() => _KkiapayWebviewState();
}

class _KkiapayWebviewState extends State<KkiapayWebview> {
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  String encodedvalue;

  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  String getTransactionId(String url) {
    final link = Uri.parse(url);
    return link.queryParameters['transaction_id'];
  }

  @override
  void initState() {
    super.initState();
    final kkiapayInstance = widget._kkiapayInstance;

    final finalObject = {
      "amount": kkiapayInstance.amount,
      "callback": kkiapayInstance.callback,
      "data": kkiapayInstance.data,
      "host": '_packageInfo.packageName',
      "key": kkiapayInstance.key,
      "name": kkiapayInstance.name,
      "phone": kkiapayInstance.phone,
      "sandbox": kkiapayInstance.sandbox,
      "sdk": 'android',
      "theme": kkiapayInstance.theme,
      "url": "https://api.kkiapay.me/utils/file/zse2kUp6hgdDRps1OBpkSHxRE"
    };

    print('ledernierobject');
    print(finalObject);

    encodedvalue = widget._kkiapayInstance.convertObjectToBase64(finalObject);

    // flutterWebViewPlugin.close();

    _onStateChanged = flutterWebViewPlugin.onStateChanged
        .listen((WebViewStateChanged state) async {
      if (state.type == WebViewState.shouldStart) {
        if (state.url.startsWith('http://redirect.kkiapay.me')) {
          flutterWebViewPlugin.stopLoading();
          final transactionId = getTransactionId(state.url);
          widget._kkiapayInstance
              .getTransactionInfo(transactionId)
              .then((response) {
            print(response);
            if (response['status'] == 'SUCCESS') {
              print('object');
              widget._kkiapayInstance
                  .sucessCallback(response['amount'], context);
            }
          }).catchError((onError) {
            print(onError);
            print('Internal Server Error');
          });
        }
      }
    });

    flutterWebViewPlugin.launch('http://kkiapay-devi.surge.sh/?=$encodedvalue');
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.

    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebViewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
