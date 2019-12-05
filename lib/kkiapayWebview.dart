import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_project/utils/success_callback.dart';

import 'package:webview_project/utils/Kkiapay.dart';

final obj = {
  "amount": "1",
  "callback": "http://redirect.kkiapay.me",
  "data": "Leonel zegue",
  "host": "co.opensi.medical",
  "key": "f1e7270098f811e99eae1f0cfc677927",
  "name": "HNS Iiyama",
  "phone": "97000000",
  "reason": "Paiement d\u0027un rendez-vous",
  "sandbox": true,
  "sdk": "android",
  "theme": "#2ba359",
  "url": "https://api.kkiapay.me/utils/file/zse2kUp6hgdDRps1OBpkSHxRE"
};

final Kkiapay kkiapay = Kkiapay(
    key: 'f1e7270098f811e99eae1f0cfc677927',
    sandbox: true,
    sucessCallback: sucessCallback);

final url =
    'https://widget.kkiapay.me/?=eyJhbW91bnQiOiIxIiwiY2FsbGJhY2siOiJodHRwOi8vcmVkaXJlY3Qua2tpYXBheS5tZSIsImRhdGEiOiJMZW9uZWwgemVndWUiLCJob3N0IjoiY28ub3BlbnNpLm1lZGljYWwiLCJrZXkiOiJmMWU3MjcwMDk4ZjgxMWU5OWVhZTFmMGNmYzY3NzkyNyIsIm5hbWUiOiJITlMgSWl5YW1hIiwicGhvbmUiOiI5NzAwMDAwMCIsInJlYXNvbiI6IlBhaWVtZW50IGRcdTAwMjd1biByZW5kZXotdm91cyIsInNhbmRib3giOnRydWUsInNkayI6ImFuZHJvaWQiLCJ0aGVtZSI6IiMyYmEzNTkiLCJ1cmwiOiJodHRwczovL2FwaS5ra2lhcGF5Lm1lL3V0aWxzL2ZpbGUvenNlMmtVcDZoZ2REUnBzMU9CcGtTSHhSRSJ9';

class KkiapayWebview extends StatefulWidget {
  @override
  _KkiapayWebviewState createState() => _KkiapayWebviewState();
}

class _KkiapayWebviewState extends State<KkiapayWebview> {
  @override
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String encodedvalue;
  @override
  void initState() {
    encodedvalue = kkiapay.convertObjectToBase64(obj);

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
          initialUrl: 'https://widget.kkiapay.me/?=$encodedvalue',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webview) async {
            _controller.complete(webview);
          },
          navigationDelegate: (NavigationRequest request) {
            print('request is there');
            final transactionId = getTransactionId(request.url);
            kkiapay.getTransactionInfo(transactionId).then((response) {
              // print

              if (response['status'] == 'SUCCESS') {
                // Navigator.pop(context);
                return sucessCallback(response['amount'], context);
              }
            }).catchError((onError) {
              print(onError);
              print('Internal Server Error');
            });
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        ),
      ),
    );
  }
}
