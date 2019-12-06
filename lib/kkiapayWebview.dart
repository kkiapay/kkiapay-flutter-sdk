import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:webview_project/utils/Kkiapay.dart';

class KkiapayWebview extends StatefulWidget {
  final Kkiapay _kkiapayInstance;

  KkiapayWebview(this._kkiapayInstance);

  _KkiapayWebviewState createState() => _KkiapayWebviewState();
}

class _KkiapayWebviewState extends State<KkiapayWebview> {
  @override
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String encodedvalue;
  @override
  void initState() {
    final kkiapayInstance = widget._kkiapayInstance;
    final finalObject = {
      "amount": kkiapayInstance.amount,
      "callback": kkiapayInstance.callback,
      "data": kkiapayInstance.data,
      "host": "co.opensi.medical",
      "key": kkiapayInstance.key,
      "name": kkiapayInstance.name,
      "phone": kkiapayInstance.phone,
      "sandbox": kkiapayInstance.sandbox,
      "sdk": kkiapayInstance.sdk,
      "theme": kkiapayInstance.theme,
      "url": "https://api.kkiapay.me/utils/file/zse2kUp6hgdDRps1OBpkSHxRE"
    };
    encodedvalue = widget._kkiapayInstance.convertObjectToBase64(finalObject);
    print(encodedvalue);
    print('encode');

    super.initState();
  }

  String getTransactionId(String url) {
    final link = Uri.parse(url);
    return link.queryParameters['transaction_id'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://kkiapay-devi.surge.sh/?=$encodedvalue',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webview) async {
            _controller.complete(webview);
          },
          navigationDelegate: (NavigationRequest request) {
            print('request is there');
            final transactionId = getTransactionId(request.url);

            widget._kkiapayInstance
                .getTransactionInfo(transactionId)
                .then((response) {
              if (response['status'] == 'SUCCESS') {
                print('object');
                widget._kkiapayInstance
                    .sucessCallback(response['amount'], context);
              }
            }).catchError((onError) {
              print(onError);
              print('Internal Server Error');
            });
          },
        ),
      ),
    );
  }
}
