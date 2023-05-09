import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:kkiapay_flutter_sdk/utils/kkiapayConf.sample.dart';
import 'package:kkiapay_flutter_sdk/utils/utils.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WidgetBuilderViewModel extends BaseViewModel {

  bool _hide = false;
  bool get hide => _hide;
  void hideWebView () {
    _hide = true;
    notifyListeners();
  }

  bool _onLoading = true;
  bool get onLoading => _onLoading;
  void loadingStart () {
    _onLoading = true;
    notifyListeners();
  }
  void loadingFinish () {
    _onLoading = false;
    notifyListeners();
  }

  String _lastEvent = "";
  String get lastEvent => _lastEvent;
  void setLastEvent(value) {
    _lastEvent = value;
    notifyListeners();
  }

  Map<String,dynamic> _data = {};
  Map<String,dynamic> get data => _data;
  void setData (Map<String,dynamic> data) {
    _data = data;
    notifyListeners();
  }

  FutureOr<NavigationDecision> onUrlChange (request,
      Function(Map<String, dynamic>, BuildContext)? callback, context)
  async {
    if (request.url.startsWith(WaveRedirectURI)
        || request.url.startsWith(PlayStoreRedirectURI)) {
      Utils.launchWave(request.url);
      return NavigationDecision.prevent;
    }
    return NavigationDecision.navigate;
  }

}
