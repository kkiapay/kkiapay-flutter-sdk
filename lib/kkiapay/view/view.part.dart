import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/utils/utils.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'widget_builder_view_model.dart';

class LoadingView extends ViewModelWidget<WidgetBuilderViewModel> {
  LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetBuilderViewModel viewModel) {
    return Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 52,
                  child: Center(
                    child: imageFromBase64String(),
                  )),
              RichText(
                  text: new TextSpan(
                    style: new TextStyle(
                  fontSize: 18.0,
                ),
                    children: <TextSpan>[
                  new TextSpan(
                      text: 'Chargement',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  new TextSpan(
                      text: '...',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                ],
                  )
              ),
            ],
          ),
        ));
  }
}

class WidgetBuild extends ViewModelWidget<WidgetBuilderViewModel> {
  final Function(Map<String, dynamic>, BuildContext) callback;
  final String url;

  const WidgetBuild({Key? key, required this.url, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetBuilderViewModel viewModel) {
    return WebView(
      initialUrl: url,
      zoomEnabled: false,
      javascriptMode: JavascriptMode.unrestricted,
      javascriptChannels: Set.from([
        JavascriptChannel(
            name: 'SDK_CHANNEL',
            onMessageReceived: (JavascriptMessage message) {
              print( JsonDecoder().convert(message.message)["name"] );
              if(JsonDecoder().convert(message.message)["name"] == "CLOSE_WIDGET"){
                Navigator.pop(context);
              }
            })
      ]),
      onWebViewCreated: (WebViewController webViewController) {
        webViewController.clearCache();
      },
      onWebResourceError: (error) {
       //Utils.log.d("error",error.failingUrl);
        viewModel.loadingStart();
        //Utils.log.d(error.failingUrl);
      },
      onPageStarted: (url) => viewModel.onPageStarted(url),
      onPageFinished: (url) => viewModel.onPageFinished(url),
      navigationDelegate: (NavigationRequest request) {
        Utils.log.d("error",request.url);
         return viewModel.onUrlChange( request, (object, context) async {
            callback(object, context);
            }, context);
          },
    );
  }
}
