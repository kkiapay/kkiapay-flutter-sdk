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
                  height: 104,
                  child: Center(
                    child: TweenAnimationBuilder(
                      duration: Duration(seconds: 3),
                      tween: SizeTween(
                          begin: Size(65, 65), end: viewModel.newSize),
                      curve: Curves.bounceIn,
                      onEnd: () {
                        viewModel.setNewSize(viewModel.newSize == Size(95, 95)
                            ? Size(65, 65)
                            : Size(95, 95));
                      },
                      builder: (_, Size? size, child) {
                        //Utils.log.d(size);
                        return Container(
                          width: size?.width,
                          height: size?.height,
                          child: child,
                        );
                      },
                      child: imageFromBase64String(),
                    ),
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
              )),
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
      onWebViewCreated: (WebViewController webViewController) {
        webViewController.clearCache();
      },
      onWebResourceError: (error) {
        Utils.log.d("error",error.failingUrl);
        viewModel.loadingStart();
        Utils.log.d(error.failingUrl);
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
