import 'dart:js' as js;
import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../../../kkiapay_flutter_sdk_platform_interface.dart';
import '../../utils/config.dart';
import '../mobile/kkiapay.dart';


class KKiaPayWeb extends KkiapayFlutterSdkPlatform  {

  /// Constructs
  KKiaPayWeb();

 static Future pay (KKiaPay paymentRequest, BuildContext context, Function(dynamic, BuildContext) callback) async {
    final data = js.JsObject.jsify({
      'amount': paymentRequest.amount.toString(),
      'key': paymentRequest.apikey.toString(),
      'sandbox': paymentRequest.sandbox.toString(),
      'name': paymentRequest.name.toString(),
      'phone': paymentRequest.phone.toString(),
      'email': paymentRequest.email.toString(),
      'data': paymentRequest.data.toString(),
      'theme': paymentRequest.theme.toString(),
      'reason': paymentRequest.reason.toString(),
      'partnerId': paymentRequest.partnerId.toString(),
      'countries': paymentRequest.countries,
    });

    void onSuccessListener(js.JsObject response) async {
      callback( {
        'requestData':  {
          'amount': paymentRequest.amount,
          'key': paymentRequest.apikey,
          'sandbox': paymentRequest.sandbox,
          'name': paymentRequest.name,
          'phone': paymentRequest.phone,
          'email': paymentRequest.email,
          'data': paymentRequest.data,
          'theme': paymentRequest.theme,
          'countries': paymentRequest.countries.toString(),
          'reason': paymentRequest.reason.toString(),
          'partnerId': paymentRequest.partnerId.toString(),
        },
        'transactionId': response["transactionId"],
        'status': PAYMENT_SUCCESS
      },context );
    }

    js.context.callMethod('addSuccessListener', [onSuccessListener]);

    js.context.callMethod('openKkiapayWidget', [data]);
  }

}
