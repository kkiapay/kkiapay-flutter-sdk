import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kkiapay_flutter_sdk/utils/utils.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../utils/config.dart';
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
    WebViewController controller = WebViewController()
      ..enableZoom(false)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      /// listen widget logs event from JavaScriptChannel
      ..addJavaScriptChannel('SDK_CHANNEL', onMessageReceived: (message) {
        print( JsonDecoder().convert(message.message));

        switch (JsonDecoder().convert(message.message)["name"]) {

          case CLOSE_WIDGET: if (viewModel.lastEvent != PAYMENT_SUCCESS) callback( {
            'requestData': viewModel.data,
            'transactionId': null,
            'status': CallbackStatus.PAYMENT_CANCELLED.name
          }, context);
          break;

          case WIDGET_SUCCESSFULLY_INIT: viewModel.loadingFinish();
          break;

          case PAYMENT_SUCCESS:
            viewModel.setLastEvent(PAYMENT_SUCCESS);
            callback( {
              'requestData': viewModel.data,
              'transactionId': JsonDecoder().convert(message.message)["data"]["transactionId"],
              'status': CallbackStatus.PAYMENT_SUCCESS.name
            }, context);
            break;

          case PAYMENT_FAILED: callback( {
            'requestData': null,
            'transactionId': JsonDecoder().convert(message.message)["data"]["transactionId"],
            'status': CallbackStatus.PAYMENT_FAILED.name
          }, context);
          break;

          default:
            break;
        }
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) => viewModel.loadingStart(),
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageFinished: (String url) {
           // controller.clearCache();
          },
          onUrlChange: (url){
            viewModel.onUrlChange( url, (object, context) async {
              Navigator.pop(context);
              callback(object, context);
              }, context);
          },
          onWebResourceError: (WebResourceError error) {
            viewModel.loadingStart();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return WebViewWidget(controller: controller);
  }
}
