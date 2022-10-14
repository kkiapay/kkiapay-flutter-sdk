import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:kkiapay_flutter_sdk/utils/kkiapayConf.sample.dart';
import 'package:kkiapay_flutter_sdk/utils/utils.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WidgetBuilderViewModel extends BaseViewModel {

  /// Using for loader animation
  Size _newSize = Size(95, 95);
  Size get newSize => _newSize;
  void setNewSize (newSize) {
    _newSize = newSize;
    notifyListeners();
  }

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

  Map<String,dynamic> _data = {};
  Map<String,dynamic> get data => _data;
  void setData (Map<String,dynamic> data) {
    _data = data;
    notifyListeners();
  }

  FutureOr<NavigationDecision> onUrlChange (request,
      Function(Map<String, dynamic>, BuildContext)? callback, context)
  async {
    if (request.url.startsWith(KKiaPayRedirectURL)) {
      //print('blocking navigation to $request}');

      hideWebView ();
      loadingStart ();

      /**
       * Payment Done with success
       */
      final link = Uri.parse(request.url);
      final transactionId = link.queryParameters['transaction_id'];
      callback!( { 'requestData': data, 'transactionId': transactionId, 'status': 'SUCCESS' }, context);

      /**
       * dispose this view switch  [disposeOnCallBack]
       */
      //try{ Navigator.pop(context); } catch(e) {Utils.log.e(e);}

      return NavigationDecision.prevent;
    }

    print('allowing navigation to $request');
    return NavigationDecision.navigate;
  }

  void onPageStarted (url) {
    //Utils.log.d('onPageStarted:::: url = $url');
    loadingStart();
    //Utils.log.d('loadingStarted');
  }

  void onPageFinished ( url) async {
   // Utils.log.d('onPageFinished:::: url = $url');
    await Future.delayed(const Duration(seconds: 2));
    loadingFinish();
    // Utils.log.d('loadingFinish');
  }


  /** Animation */

  double scale = 0;
  AnimationController? controller ;

}
